using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AngularProjectApi.Data;
using AngularProjectApi.Models;

namespace AngularProjectApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class LandsController : ControllerBase
{
  private readonly ApplicationDbContext _context;

  public LandsController(ApplicationDbContext context)
  {
    _context = context;
  }

  // GET: api/lands
  [HttpGet]
  public async Task<ActionResult<IEnumerable<Land>>> GetLands()
  {
    return await _context.Lands
        .OrderByDescending(l => l.CreatedAt)
        .ToListAsync();
  }

  // GET: api/lands/legal-land-ids
  [HttpGet("legal-land-ids")]
  public async Task<ActionResult<IEnumerable<int>>> GetLegalLandIds()
  {
    var ids = await _context.LandTechnicalInspection
        .AsNoTracking()
        .Select(x => x.LandCode)
        .Distinct()
        .OrderBy(x => x)
        .ToListAsync();

    return ids;
  }

  
  [HttpGet("land-codes")]
  public async Task<ActionResult<IEnumerable<int>>> GetLandCodes()
  {
    var codes = await _context.Lands
        .AsNoTracking()
        .Select(x => x.LandCode)
        .Distinct()
        .OrderBy(x => x)
        .ToListAsync();

    return codes;
  }

  
  [HttpGet("available-land-codes")]
  public async Task<ActionResult<IEnumerable<int>>> GetAvailableLandCodes()
  {
    var codes = await _context.Lands
        .AsNoTracking()
        .Where(l => !_context.LandTechnicalInspection.Any(ti => ti.LandCode == l.LandCode))
        .Select(x => x.LandCode)
        .Distinct()
        .OrderBy(x => x)
        .ToListAsync();

    return codes;
  }

  // GET: api/lands/{id}
  [HttpGet("{id}")]
  public async Task<ActionResult<Land>> GetLand(Guid id)
  {
    var land = await _context.Lands.FindAsync(id);

    if (land == null)
    {
      return NotFound();
    }

    return land;
  }

  // GET: api/lands/by-reference/{referenceNumber}
  [HttpGet("by-reference/{referenceNumber}")]
  public async Task<ActionResult<Land>> GetLandByReference(int referenceNumber)
  {
    var land = await _context.Lands.FirstOrDefaultAsync(l => l.ReferenceNumber == referenceNumber);

    if (land == null)
    {
      return NotFound();
    }

    return land;
  }

  // POST: api/lands/search
  [HttpPost("search")]
  public async Task<ActionResult<IEnumerable<Land>>> SearchLands([FromBody] LandSearchCriteria criteria)
  {
    var query = _context.Lands.AsQueryable();

    if (!string.IsNullOrEmpty(criteria.Governorate))
      query = query.Where(l => l.Headquarters == criteria.Governorate);

    if (!string.IsNullOrEmpty(criteria.UsageStatus))
      query = query.Where(l => l.UsageStatus == criteria.UsageStatus);

    if (!string.IsNullOrEmpty(criteria.ApprovalStatus))
      query = query.Where(l => l.ApprovalStatus == criteria.ApprovalStatus);

    if (!string.IsNullOrEmpty(criteria.Phase))
      query = query.Where(l => l.Phase == criteria.Phase);

    return await query.OrderByDescending(l => l.CreatedAt).ToListAsync();
  }

  // POST: api/lands
  [HttpPost]
  public async Task<ActionResult<Land>> CreateLand(Land land)
  {
    if (!ModelState.IsValid)
    {
      return ValidationProblem(ModelState);
    }

    var landCodeExists = await _context.Lands
        .AsNoTracking()
        .AnyAsync(x => x.LandCode == land.LandCode);

    if (landCodeExists)
    {
      ModelState.AddModelError(nameof(Land.LandCode), "كود الأرض موجود بالفعل");
      return ValidationProblem(ModelState);
    }

    land.Id = Guid.NewGuid();
    if (!land.ReferenceNumber.HasValue)
    {
      land.ReferenceNumber = land.LandCode;
    }
    land.CreatedAt = DateTime.Now;
    land.UpdatedAt = DateTime.Now;

    _context.Lands.Add(land);

    BuildingLocation buildingLocation = new()
    {
      LandId = land.Id,
      Code = "01",
      LocationName = "شمال",
      NeighborDescription = land.North,
      Coordinates = land.LengthNorth,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land.Id,
      Code = "02",
      LocationName = "شمال شرق",
      NeighborDescription = land.Ne,
      Coordinates = land.LengthNe,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land.Id,
      Code = "03",
      LocationName = "جنوب شرق",
      NeighborDescription = land.Se,
      Coordinates = land.LengthSe,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land.Id,
      Code = "04",
      LocationName = "شمال غرب",
      NeighborDescription = land.Nw,
      Coordinates = land.LengthNw,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land.Id,
      Code = "05",
      LocationName = "جنوب غرب",
      NeighborDescription = land.Sw,
      Coordinates = land.LengthSw,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land.Id,
      Code = "06",
      LocationName = "جنوب",
      NeighborDescription = land.South,
      Coordinates = land.LengthSouth,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land.Id,
      Code = "07",
      LocationName = "شرق",
      NeighborDescription = land.East,
      Coordinates = land.LengthEast,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land.Id,
      Code = "08",
      LocationName = "غرب",
      NeighborDescription = land.West,
      Coordinates = land.LengthWest,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    try
    {
      await _context.SaveChangesAsync();
    }
    catch (DbUpdateException)
    {
      var message = "";
      if (_context.Lands.AsNoTracking().Any(x => x.LandCode == land.LandCode))
      {
        ModelState.AddModelError(nameof(Land.LandCode), "كود الأرض موجود بالفعل");
        return ValidationProblem(ModelState);
      }

      if (land.ReferenceNumber.HasValue && _context.Lands.AsNoTracking().Any(x => x.ReferenceNumber == land.ReferenceNumber))
      {
        ModelState.AddModelError(nameof(Land.ReferenceNumber), "الرقم المرجعي موجود بالفعل");
        return ValidationProblem(ModelState);
      }

      ModelState.AddModelError("", "تعذر حفظ بيانات الأرض بسبب تعارض في البيانات");
      return ValidationProblem(ModelState);
    }

    return CreatedAtAction(nameof(GetLand), new { id = land.Id }, land);
  }

  // POST: api/lands
  [HttpPost("CreateLandDataInsertion")]
  public async Task<ActionResult<Land>> CreateLandDataInsertion(LandDataInsertionDTO land)
  {
    if (!land.LandCode.HasValue || land.LandCode.Value <= 0)
    {
      return BadRequest("كود قطعة الأرض مطلوب.");
    }

    Land land1 = new()
    {
      Id = Guid.NewGuid(),
      TotalArea = land.TotalArea,
      ReferenceNumber = land.LandCode,
      LandCode = land.LandCode.Value,
      CurrentOwner = land.OwnerName
    };
    _context.Lands.Add(land1);

    BuildingLocation buildingLocation = new()
    {
      LandId = land1.Id,
      Code = "01",
      LocationName = "شمال",
      NeighborDescription = land.North,
      Coordinates = land.LengthNorth,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land1.Id,
      Code = "02",
      LocationName = "شمال شرق",
      NeighborDescription = land.Ne,
      Coordinates = land.LengthNe,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land1.Id,
      Code = "03",
      LocationName = "جنوب شرق",
      NeighborDescription = land.Se,
      Coordinates = land.LengthSe,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land1.Id,
      Code = "04",
      LocationName = "شمال غرب",
      NeighborDescription = land.Nw,
      Coordinates = land.LengthNw,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land1.Id,
      Code = "05",
      LocationName = "جنوب غرب",
      NeighborDescription = land.Sw,
      Coordinates = land.LengthSw,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land1.Id,
      Code = "06",
      LocationName = "جنوب",
      NeighborDescription = land.South,
      Coordinates = land.LengthSouth,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land1.Id,
      Code = "07",
      LocationName = "شرق",
      NeighborDescription = land.East,
      Coordinates = land.LengthEast,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    buildingLocation = new()
    {
      LandId = land1.Id,
      Code = "08",
      LocationName = "غرب",
      NeighborDescription = land.West,
      Coordinates = land.LengthWest,
      Status = "يوجد",
      RequiredStatus = "مطلوب",
      CreatedAt = DateTime.Now
    };
    _context.Add(buildingLocation);

    await _context.SaveChangesAsync();

    return CreatedAtAction(nameof(GetLand), new { id = land1.Id }, land);
  }

  [HttpPost("ConnectLandAndLegal")]
  public async Task<IActionResult> ConnectLandAndLegal(LandAndLegalConnectionDTO landAndLegalConnectionDTO)
  {
    if (landAndLegalConnectionDTO == null)
    {
      return BadRequest("بيانات غير صحيحة.");
    }

    if (string.IsNullOrWhiteSpace(landAndLegalConnectionDTO.LandSerialLegal))
    {
      return BadRequest("مسلسل الارض بالشئون القانونية مطلوب.");
    }

    if (!int.TryParse(landAndLegalConnectionDTO.LandSerialLegal, out var landSerialLegal))
    {
      return BadRequest("مسلسل الارض بالشئون القانونية غير صحيح.");
    }

    var hasInspection = await _context.LandTechnicalInspection
        .AsNoTracking()
        .AnyAsync(x => x.LandCode == landSerialLegal);

    if (!hasInspection)
    {
      return BadRequest("لا يمكن ربط الشئون القانونية قبل عمل المعاينة الفنية (الفحص الفني) للأرض.");
    }

    if (landAndLegalConnectionDTO.schoolIds == null || landAndLegalConnectionDTO.schoolIds.Count == 0)
    {
      return BadRequest("الرقم التعريفي للمدرسة مطلوب.");
    }

    var requestedSchoolIds = landAndLegalConnectionDTO.schoolIds
        .Where(x => !string.IsNullOrWhiteSpace(x))
        .Distinct()
        .ToList();

    var parsedSchoolIds = new List<int>();
    foreach (var schoolId in requestedSchoolIds)
    {
      if (!int.TryParse(schoolId, out var schoolRef))
      {
        return BadRequest("الرقم التعريفي للمدرسة غير صحيح.");
      }
      parsedSchoolIds.Add(schoolRef);
    }

    var alreadyLinked = await _context.LandAndLegalConnection
        .AsNoTracking()
        .Where(x => parsedSchoolIds.Contains(x.SchoolReferenceNumber))
        .Select(x => x.SchoolReferenceNumber)
        .Distinct()
        .ToListAsync();

    if (alreadyLinked.Count > 0)
    {
      return BadRequest($"لا يمكن ربط هذه المدرسة لأنها مرتبطة بالفعل: {string.Join(", ", alreadyLinked)}");
    }

    foreach (var schoolRef in parsedSchoolIds)
    {
      LandAndLegalConnection landAndLegalConnection = new()
      {
        LandId = landSerialLegal,
        SchoolReferenceNumber = schoolRef
      };

      _context.Add(landAndLegalConnection);
    }

    await _context.SaveChangesAsync();
    return Created();

  }

  // PUT: api/lands/{id}
  [HttpPut("{id}")]
  public async Task<IActionResult> UpdateLand(Guid id, Land land)
  {
    if (id != land.Id)
    {
      return BadRequest();
    }

    if (!ModelState.IsValid)
    {
      return ValidationProblem(ModelState);
    }

    var landCodeExists = await _context.Lands
        .AsNoTracking()
        .AnyAsync(x => x.Id != id && x.LandCode == land.LandCode);

    if (landCodeExists)
    {
      ModelState.AddModelError(nameof(Land.LandCode), "كود الأرض موجود بالفعل");
      return ValidationProblem(ModelState);
    }

    land.UpdatedAt = DateTime.Now;
    _context.Entry(land).State = EntityState.Modified;

    try
    {
      await _context.SaveChangesAsync();
    }
    catch (DbUpdateConcurrencyException)
    {
      if (!LandExists(id))
      {
        return NotFound();
      }
      throw;
    }
    catch (DbUpdateException)
    {
      ModelState.AddModelError(nameof(Land.LandCode), "كود الأرض موجود بالفعل");
      return ValidationProblem(ModelState);
    }

    return NoContent();
  }

  // DELETE: api/lands/{id}
  [HttpDelete("{id}")]
  public async Task<IActionResult> DeleteLand(Guid id)
  {
    var land = await _context.Lands.FindAsync(id);
    if (land == null)
    {
      return NotFound();
    }

    _context.Lands.Remove(land);
    await _context.SaveChangesAsync();

    return NoContent();
  }

  // GET: api/lands/{landId}/buildings
  [HttpGet("{landId}/buildings")]
  public async Task<ActionResult<IEnumerable<object>>> GetBuildingLocations(Guid landId)
  {
    var locations = await _context.BuildingLocations.AsNoTracking().Where(b => b.LandId == landId)
        .ToListAsync();

    // Map to DTO with camelCase property names for JSON serialization
    var result = locations.Select(b => new
    {
      id = b.Id,
      code = b.Code,
      locationName = b.LocationName,
      coordinates = b.Coordinates,
      status = b.Status,
      requiredStatus = b.RequiredStatus,
      neighborDescription = b.NeighborDescription ?? ""
    }).ToList();

    return result;
  }

  // GET: api/lands/{landId}/coordinates
  [HttpGet("{landId}/coordinates")]
  public async Task<ActionResult<IEnumerable<LandCoordinate>>> GetLandCoordinates(Guid landId)
  {
    return await _context.LandCoordinates
        .Where(c => c.LandId == landId)
        .OrderBy(c => c.PointNumber)
        .ToListAsync();
  }

  // POST: api/lands/{landId}/coordinates
  [HttpPost("{landId}/coordinates")]
  public async Task<ActionResult<LandCoordinate>> AddLandCoordinate(Guid landId, LandCoordinate coordinate)
  {
    coordinate.Id = Guid.NewGuid();
    coordinate.LandId = landId;
    coordinate.CreatedAt = DateTime.Now;

    _context.LandCoordinates.Add(coordinate);
    await _context.SaveChangesAsync();

    return CreatedAtAction(nameof(GetLandCoordinates), new { landId }, coordinate);
  }

  private bool LandExists(Guid id)
  {
    return _context.Lands.Any(e => e.Id == id);
  }
}

public class LandSearchCriteria
{
  public string? Governorate { get; set; }
  public string? UsageStatus { get; set; }
  public string? ApprovalStatus { get; set; }
  public string? Phase { get; set; }
}
