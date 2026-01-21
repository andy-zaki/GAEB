using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using AngularProjectApi.Data;
using AngularProjectApi.Models;

namespace AngularProjectApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class LookupController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public LookupController(ApplicationDbContext context)
    {
        _context = context;
    }

    // GET: api/GetDistricts
    [HttpGet("GetDistricts")]
    public async Task<ActionResult<IEnumerable<District>>> GetGetDistricts(bool isSorted)
    {
        if (!isSorted)
            return await _context.District.AsNoTracking().ToListAsync();

        return await _context.District.AsNoTracking().OrderBy(l => l.Name).ToListAsync();
    }

    // GET: api/GetGovernorates
    [HttpGet("GetGovernorates")]
    public async Task<ActionResult<IEnumerable<Governorate>>> GetGovernorates()
    {
        return await _context.Governorates.AsNoTracking().OrderBy(l => l.Name).ToListAsync();
    }


    // GET: api/GetLandOwner
    [HttpGet("GetLandOwners")]
    public async Task<ActionResult<IEnumerable<LandOwner>>> GetLandOwners()
    {
        return await _context.LandOwner.AsNoTracking().OrderBy(l => l.Name).ToListAsync();
    }


    // GET: api/GetLandOwnerships
    [HttpGet("GetLandOwnerships")]
    public async Task<ActionResult<IEnumerable<LandOwnership>>> GetLandOwnerships()
    {
        return await _context.LandOwnerships.AsNoTracking().OrderBy(l => l.Name).ToListAsync();
    }

    // GET: api/lookup/GetVillagesByDistrict/{districtNumber}
    [HttpGet("GetVillagesByDistrictNumber/{districtNumber}")]
    public async Task<ActionResult<IEnumerable<Village>>> GetVillagesByDistrict(int districtNumber)
    {
        var villages = await _context.Villages
            .AsNoTracking()
            .Where(v => v.DistrictNumber == districtNumber)
            .OrderBy(v => v.Number)
            .ToListAsync();

        return villages;
    }

    [HttpGet("GetVillages")]
    public async Task<ActionResult<IEnumerable<Village>>> GetVillages()
    {
        return await _context.Villages.AsNoTracking().OrderBy(v => v.Number).ToListAsync();
    }

    // GET: api/lookup/GetVillagesContinue
    [HttpGet("GetVillagesContinue")]
    public async Task<ActionResult<IEnumerable<VillagesContinue>>> GetVillagesContinue()
    {
        return await _context.VillagesContinue.AsNoTracking().OrderBy(v => v.Number).ToListAsync();
    }
}
