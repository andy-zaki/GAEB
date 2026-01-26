using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AngularProjectApi.Data;
using AngularProjectApi.Models;
using FluentValidation;

namespace AngularProjectApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class SchoolMapsController : ControllerBase
{
    private readonly ApplicationDbContext _context;
    private readonly IValidator<EducationalBuilding> _educationalBuildingValidator;

    public SchoolMapsController(ApplicationDbContext context, IValidator<EducationalBuilding> educationalBuildingValidator)
    {
        _context = context;
        _educationalBuildingValidator = educationalBuildingValidator;
    }

    [HttpGet("study-periods/{buildingNumber}")]
    public async Task<ActionResult<IEnumerable<StudyPeriod>>> GetStudyPeriods(string buildingNumber)
        => await _context.StudyPeriods.Where(s => s.BuildingNumber == buildingNumber).OrderBy(s => s.Period).ToListAsync();

    [HttpGet("roads/{buildingId}")]
    public async Task<ActionResult<IEnumerable<SchoolRoad>>> GetSchoolRoads(string buildingId)
        => await _context.SchoolRoads.Where(r => r.BuildingId == buildingId).ToListAsync();

    [HttpGet("annexes/{buildingId}")]
    public async Task<ActionResult<IEnumerable<SchoolAnnex>>> GetSchoolAnnexes(string buildingId)
        => await _context.SchoolAnnexes.Where(a => a.BuildingId == buildingId).ToListAsync();

    [HttpGet("spaces/{buildingId}")]
    public async Task<ActionResult<IEnumerable<SchoolSpace>>> GetSchoolSpaces(string buildingId)
        => await _context.SchoolSpaces.Where(s => s.BuildingId == buildingId).ToListAsync();

    [HttpGet("educational-buildings/{buildingNumber}")]
    public async Task<ActionResult<EducationalBuilding>> GetEducationalBuilding(string buildingNumber)
    {
        var building = await _context.EducationalBuildings.FirstOrDefaultAsync(e => e.BuildingNumber == buildingNumber);
        return building == null ? NotFound() : building;
    }

    [HttpGet("educational-buildings")]
    public async Task<ActionResult<IEnumerable<EducationalBuilding>>> GetEducationalBuildings()
        => await _context.EducationalBuildings.OrderBy(e => e.BuildingNumber).ToListAsync();

    [HttpGet("educational-buildings/available")]
    public async Task<ActionResult<IEnumerable<EducationalBuilding>>> GetAvailableEducationalBuildings()
    {
        var linkedBuildingNumbersQuery = _context.LandAndLegalConnection
            .AsNoTracking()
            .Select(x => x.SchoolReferenceNumber.ToString());

        var buildings = await _context.EducationalBuildings
            .AsNoTracking()
            .Where(b => !linkedBuildingNumbersQuery.Contains(b.BuildingNumber))
            .OrderBy(e => e.BuildingNumber)
            .ToListAsync();

        return buildings;
    }

    [HttpPost("study-periods")]
    public async Task<ActionResult<StudyPeriod>> AddStudyPeriod(StudyPeriod period)
    {
        period.Id = Guid.NewGuid();
        period.CreatedAt = period.UpdatedAt = DateTime.Now;
        _context.StudyPeriods.Add(period);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetStudyPeriods), new { buildingNumber = period.BuildingNumber }, period);
    }

    [HttpPost("roads")]
    public async Task<ActionResult<SchoolRoad>> AddSchoolRoad(SchoolRoad road)
    {
        road.Id = Guid.NewGuid();
        road.CreatedAt = DateTime.Now;
        _context.SchoolRoads.Add(road);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetSchoolRoads), new { buildingId = road.BuildingId }, road);
    }

    [HttpPost("annexes")]
    public async Task<ActionResult<SchoolAnnex>> AddSchoolAnnex(SchoolAnnex annex)
    {
        annex.Id = Guid.NewGuid();
        annex.CreatedAt = annex.UpdatedAt = DateTime.Now;
        _context.SchoolAnnexes.Add(annex);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetSchoolAnnexes), new { buildingId = annex.BuildingId }, annex);
    }

    [HttpPost("spaces")]
    public async Task<ActionResult<SchoolSpace>> AddSchoolSpace(SchoolSpace space)
    {
        space.Id = Guid.NewGuid();
        space.CreatedAt = space.UpdatedAt = DateTime.Now;
        _context.SchoolSpaces.Add(space);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetSchoolSpaces), new { buildingId = space.BuildingId }, space);
    }

    // Plan (pseudocode):
    // 1. Generate new Guid for the incoming `building` and set CreatedAt/UpdatedAt timestamps.
    // 2. Add the `building` to the DbContext.
    // 3. Create a new `Land` entity that references the created building:
    //    - Generate new Guid for `Land`.
    //    - Set `BuildingId` to the created building's Id.
    //    - Set owner/area fields from the `building` where applicable.
    //    - Set CreatedAt/UpdatedAt timestamps for the land record.
    // 4. Add the `Land` entity to the DbContext.
    // 5. Save changes once to persist both records in a single transaction.
    // 6. Return CreatedAtAction for the created building.
    //
    // Notes:
    // - The Land entity and its DbSet are assumed to exist in the project (named `Land` in the DbContext).
    // - Adjust `OwnerName` / `Area` / other Land properties to match your actual `Land` model if names differ.

    [HttpPost("educational-buildings")]
    public async Task<ActionResult<EducationalBuilding>> CreateEducationalBuilding(EducationalBuilding building)
    {
        if (building == null)
        {
            return BadRequest(new { message = "بيانات غير صحيحة" });
        }

        var validationResult = await _educationalBuildingValidator.ValidateAsync(building);
        if (!validationResult.IsValid)
        {
            foreach (var error in validationResult.Errors)
            {
                ModelState.AddModelError(error.PropertyName, error.ErrorMessage);
            }

            return ValidationProblem(ModelState);
        }

        var buildingNumberAsInt = int.Parse(building.BuildingNumber);
        var landOwnerId = int.Parse(building.LandOwnership);
        var landOwner = await _context.LandOwner.AsNoTracking().FirstAsync(l => l.Id == landOwnerId);

        try
        {
            var land = new Land
            {
                Id = Guid.NewGuid(),
                LandCode = buildingNumberAsInt,
                CurrentOwner = landOwner.Name,
                TotalArea = building.TotalArea,
                ReferenceNumber = buildingNumberAsInt,
                CreatedAt = DateTime.UtcNow,
                UpdatedAt = DateTime.UtcNow
            };

            _context.Lands.Add(land);

            building.Id = Guid.NewGuid();
            building.CreatedAt = building.UpdatedAt = DateTime.Now;
            _context.EducationalBuildings.Add(building);

            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetEducationalBuilding), new { buildingNumber = building.BuildingNumber }, building);
        }
        catch (Exception ex)
        {
            return BadRequest(new { message = "خطأ في حفظ البيانات", error = ex.Message });
        }
    }

    [HttpPost("educational-buildings/create-with-building")]
    public async Task<ActionResult<object>> CreateEducationalBuildingWithBuilding(EducationalBuilding educationalBuilding)
    {
        if (educationalBuilding == null)
        {
            return BadRequest(new { message = "بيانات غير صحيحة" });
        }

        var validationResult = await _educationalBuildingValidator.ValidateAsync(educationalBuilding);
        if (!validationResult.IsValid)
        {
            foreach (var error in validationResult.Errors)
            {
                ModelState.AddModelError(error.PropertyName, error.ErrorMessage);
            }

            return ValidationProblem(ModelState);
        }

        if (string.IsNullOrWhiteSpace(educationalBuilding.BuildingName))
        {
            return BadRequest(new { message = "مسمى قطعة الأرض مطلوب." });
        }

        await using var transaction = await _context.Database.BeginTransactionAsync();
        try
        {
            educationalBuilding.Id = Guid.NewGuid();
            educationalBuilding.CreatedAt = educationalBuilding.UpdatedAt = DateTime.Now;
            _context.EducationalBuildings.Add(educationalBuilding);

            var building = new Building
            {
                Id = Guid.NewGuid(),
                BuildingNumber = educationalBuilding.BuildingNumber,
                SchoolName = educationalBuilding.BuildingName,
                EducationalBuildingId = educationalBuilding.Id,
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now
            };
            _context.Buildings.Add(building);

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return Ok(new { educationalBuilding, building });
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return BadRequest(new { message = "خطأ في حفظ البيانات", error = ex.Message });
        }
    }

    [HttpPut("educational-buildings/{id}")]
    public async Task<ActionResult<EducationalBuilding>> UpdateEducationalBuilding(Guid id, EducationalBuilding building)
    {
        if (id != building.Id) return BadRequest("معرف المبنى غير متطابق");

        var existingBuilding = await _context.EducationalBuildings.FindAsync(id);
        if (existingBuilding == null) return NotFound("المبنى غير موجود");

        // Update all fields
        existingBuilding.BuildingNumber = building.BuildingNumber;
        existingBuilding.UsageStatus = building.UsageStatus;
        existingBuilding.AddressNumber = building.AddressNumber;
        existingBuilding.Street = building.Street;
        existingBuilding.PhoneNumber = building.PhoneNumber;
        existingBuilding.LandOwnership = building.LandOwnership;
        existingBuilding.BuildingOwnership = building.BuildingOwnership;
        existingBuilding.FenceCode = building.FenceCode;
        existingBuilding.FenceHeight = building.FenceHeight;
        existingBuilding.FenceCondition = building.FenceCondition;
        existingBuilding.NorthSide = building.NorthSide;
        existingBuilding.SouthSide = building.SouthSide;
        existingBuilding.EastSide = building.EastSide;
        existingBuilding.WestSide = building.WestSide;
        existingBuilding.NorthEast = building.NorthEast;
        existingBuilding.SouthEast = building.SouthEast;
        existingBuilding.NorthWest = building.NorthWest;
        existingBuilding.SouthWest = building.SouthWest;
        existingBuilding.BuildingMaterial = building.BuildingMaterial;
        existingBuilding.CoordinateX = building.CoordinateX;
        existingBuilding.CoordinateY = building.CoordinateY;
        existingBuilding.CoordinateZ = building.CoordinateZ;
        existingBuilding.PositiveEnvironment = building.PositiveEnvironment;
        existingBuilding.NegativeEnvironment = building.NegativeEnvironment;
        existingBuilding.UpdatedAt = DateTime.Now;

        try
        {
            await _context.SaveChangesAsync();
            return Ok(existingBuilding);
        }
        catch (DbUpdateConcurrencyException)
        {
            if (!_context.EducationalBuildings.Any(e => e.Id == id))
                return NotFound("المبنى غير موجود");
            throw;
        }
    }

    [HttpPut("educational-buildings/by-number/{buildingNumber}")]
    public async Task<ActionResult<EducationalBuilding>> UpsertEducationalBuildingByNumber(string buildingNumber, EducationalBuilding building)
    {
        if (building == null)
        {
            return BadRequest(new { message = "بيانات غير صحيحة" });
        }

        if (string.IsNullOrWhiteSpace(buildingNumber))
        {
            ModelState.AddModelError(nameof(buildingNumber), "رقم المبنى مطلوب");
            return ValidationProblem(ModelState);
        }

        building.BuildingNumber = buildingNumber;

        void ValidateMaxLength(string? value, int max, string fieldName)
        {
            if (value != null && value.Length > max)
            {
                ModelState.AddModelError(fieldName, $"يجب ألا يزيد طول الحقل عن {max} حرف");
            }
        }

        void ValidateNonNegative(decimal? value, string fieldName)
        {
            if (value.HasValue && value.Value < 0)
            {
                ModelState.AddModelError(fieldName, "يجب ألا تكون القيمة سالبة");
            }
        }

        ValidateMaxLength(building.BuildingNumber, 50, nameof(EducationalBuilding.BuildingNumber));
        ValidateMaxLength(building.UsageStatus, 100, nameof(EducationalBuilding.UsageStatus));
        ValidateMaxLength(building.AddressNumber, 50, nameof(EducationalBuilding.AddressNumber));
        ValidateMaxLength(building.Street, 255, nameof(EducationalBuilding.Street));
        ValidateMaxLength(building.PhoneNumber, 50, nameof(EducationalBuilding.PhoneNumber));
        ValidateMaxLength(building.LandOwnership, 100, nameof(EducationalBuilding.LandOwnership));
        ValidateMaxLength(building.BuildingOwnership, 100, nameof(EducationalBuilding.BuildingOwnership));
        ValidateMaxLength(building.FenceCode, 50, nameof(EducationalBuilding.FenceCode));
        ValidateMaxLength(building.FenceCondition, 100, nameof(EducationalBuilding.FenceCondition));
        ValidateMaxLength(building.NorthSide, 255, nameof(EducationalBuilding.NorthSide));
        ValidateMaxLength(building.SouthSide, 255, nameof(EducationalBuilding.SouthSide));
        ValidateMaxLength(building.EastSide, 255, nameof(EducationalBuilding.EastSide));
        ValidateMaxLength(building.WestSide, 255, nameof(EducationalBuilding.WestSide));
        ValidateMaxLength(building.NorthEast, 255, nameof(EducationalBuilding.NorthEast));
        ValidateMaxLength(building.SouthEast, 255, nameof(EducationalBuilding.SouthEast));
        ValidateMaxLength(building.NorthWest, 255, nameof(EducationalBuilding.NorthWest));
        ValidateMaxLength(building.SouthWest, 255, nameof(EducationalBuilding.SouthWest));
        ValidateMaxLength(building.BuildingMaterial, 100, nameof(EducationalBuilding.BuildingMaterial));
        ValidateMaxLength(building.PositiveEnvironment, 255, nameof(EducationalBuilding.PositiveEnvironment));
        ValidateMaxLength(building.NegativeEnvironment, 255, nameof(EducationalBuilding.NegativeEnvironment));

        ValidateNonNegative(building.FenceHeight, nameof(EducationalBuilding.FenceHeight));
        ValidateNonNegative(building.CoordinateX, nameof(EducationalBuilding.CoordinateX));
        ValidateNonNegative(building.CoordinateY, nameof(EducationalBuilding.CoordinateY));
        ValidateNonNegative(building.CoordinateZ, nameof(EducationalBuilding.CoordinateZ));
        ValidateNonNegative(building.TotalArea, nameof(EducationalBuilding.TotalArea));

        if (!ModelState.IsValid)
        {
            return ValidationProblem(ModelState);
        }

        var existingBuilding = await _context.EducationalBuildings
            .FirstOrDefaultAsync(e => e.BuildingNumber == buildingNumber);

        if (existingBuilding == null)
        {
            building.Id = Guid.NewGuid();
            building.CreatedAt = building.UpdatedAt = DateTime.Now;
            _context.EducationalBuildings.Add(building);
        }
        else
        {
            existingBuilding.UsageStatus = building.UsageStatus;
            existingBuilding.AddressNumber = building.AddressNumber;
            existingBuilding.Street = building.Street;
            existingBuilding.PhoneNumber = building.PhoneNumber;
            existingBuilding.LandOwnership = building.LandOwnership;
            existingBuilding.BuildingOwnership = building.BuildingOwnership;
            existingBuilding.FenceCode = building.FenceCode;
            existingBuilding.FenceHeight = building.FenceHeight;
            existingBuilding.FenceCondition = building.FenceCondition;
            existingBuilding.NorthSide = building.NorthSide;
            existingBuilding.SouthSide = building.SouthSide;
            existingBuilding.EastSide = building.EastSide;
            existingBuilding.WestSide = building.WestSide;
            existingBuilding.NorthEast = building.NorthEast;
            existingBuilding.SouthEast = building.SouthEast;
            existingBuilding.NorthWest = building.NorthWest;
            existingBuilding.SouthWest = building.SouthWest;
            existingBuilding.BuildingMaterial = building.BuildingMaterial;
            existingBuilding.CoordinateX = building.CoordinateX;
            existingBuilding.CoordinateY = building.CoordinateY;
            existingBuilding.CoordinateZ = building.CoordinateZ;
            existingBuilding.PositiveEnvironment = building.PositiveEnvironment;
            existingBuilding.NegativeEnvironment = building.NegativeEnvironment;
            existingBuilding.UpdatedAt = DateTime.Now;
        }

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateException ex)
        {
            return BadRequest(new { message = "خطأ في حفظ البيانات", error = ex.Message });
        }

        return Ok(existingBuilding ?? building);
    }

    // POST: api/school-maps/educational-buildings/create-with-location
    [HttpPost("educational-buildings/create-with-location")]
    public async Task<ActionResult<EducationalBuilding>> CreateEducationalBuildingWithLocation([FromBody] CreateBuildingWithLocationDTO dto)
    {
        // Validate that the building number doesn't already exist
        if (await _context.EducationalBuildings.AnyAsync(b => b.BuildingNumber == dto.BuildingNumber))
        {
            return BadRequest(new { message = "Building number already exists" });
        }

        // Validate that district exists
        var district = await _context.District.FirstOrDefaultAsync(d => d.Number == dto.DistrictNum);
        if (district == null)
        {
            return BadRequest(new { message = "District not found" });
        }

        // Validate that village exists and belongs to the district
        var village = await _context.Villages.FirstOrDefaultAsync(d => d.Number == dto.VillageNum);
        if (village == null)
        {
            return BadRequest(new { message = "Village not found" });
        }

        // Check if village belongs to the district (village number should start with district number)
        if (!village.Number.ToString().StartsWith(district.Number.ToString()))
        {
            return BadRequest(new { message = "Village does not belong to the selected district" });
        }

        // Validate that villages continue exists
        var villagesContinue = await _context.VillagesContinue.FirstOrDefaultAsync(d => d.Number == dto.VillagesContinueNumber);
        if (villagesContinue == null)
        {
            return BadRequest(new { message = "VillagesContinue not found" });
        }

        // Validate that land ownership exists
        var landOwner = await _context.LandOwner.FindAsync(dto.LandOwnershipId);
        if (landOwner == null)
        {
            return BadRequest(new { message = "Land ownership not found" });
        }

        // Create the educational building
        var building = new EducationalBuilding
        {
            Id = Guid.NewGuid(),
            BuildingNumber = dto.BuildingNumber,
            BuildingName = dto.BuildingName,
            TotalArea = dto.TotalArea,
            DistrictId = dto.DistrictNum,
            VillageId = dto.VillageNum,
            VillagesContinueId = dto.VillagesContinueNumber,
            LandOwnership = landOwner.Name,
            CreatedAt = DateTime.Now,
            UpdatedAt = DateTime.Now
        };

        _context.EducationalBuildings.Add(building);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetEducationalBuilding), new { buildingNumber = building.BuildingNumber }, building);
    }
}
