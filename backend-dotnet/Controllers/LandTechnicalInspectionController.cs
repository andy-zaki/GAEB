using AngularProjectApi.Data;
using AngularProjectApi.Models;
using AutoMapper;
using FluentValidation;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;

namespace AngularProjectApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class LandTechnicalInspectionController : ControllerBase
{
    private readonly ApplicationDbContext _context;
    protected readonly IMapper _mapper;
    private readonly IValidator<LandTechnicalInspection> _validator;

    public LandTechnicalInspectionController(ApplicationDbContext context, IMapper mapper, IValidator<LandTechnicalInspection> validator)
    {
        _context = context;
        _mapper = mapper;
        _validator = validator;
    }

    // GET: api/lands
    [HttpGet]
    public async Task<ActionResult<IEnumerable<LandTechnicalInspection>>> GetAll()
    {
        return await _context.LandTechnicalInspection.OrderByDescending(l => l.CreatedAt).ToListAsync();
    }

    // GET: api/lands/{id}
    [HttpGet("{id}")]
    public async Task<ActionResult<LandTechnicalInspection>> Get(int id)
    {
        var landTechnicalInspection = await _context.LandTechnicalInspection.FindAsync(id);

        if (landTechnicalInspection == null)
        {
            return NotFound();
        }

        return landTechnicalInspection;
    }

    // GET: api/LandTechnicalInspection/{id}
    [HttpGet("GetByLandCode/{landCode}")]

    public async Task<ActionResult<LandTechnicalInspectionDTO>> GetByLandCode(int landCode)
    {
        var land = await _context.Lands.FirstOrDefaultAsync(l => l.LandCode == landCode);

        if (land == null)
        {
            return NotFound("لا يوجد أرض بهذا الكود");
        }

        var landTechnicalInspection = await _context.LandTechnicalInspection.FirstOrDefaultAsync(l => l.LandCode == landCode);

        if (landTechnicalInspection == null)
        {
            return NotFound("لا يوجد معاينة فنية لكود الأرض الذي أدخلته");
        }

        LandTechnicalInspectionDTO landTechnicalInspectionDTO = _mapper.Map<LandTechnicalInspectionDTO>(landTechnicalInspection);

        var governorate = await _context.Governorates.SingleAsync(L => L.Id == landTechnicalInspection.GovernorateCode);
        landTechnicalInspectionDTO.Governorate = governorate.Name;

        var landOwner = await _context.LandOwner.SingleAsync(L => L.Id == landTechnicalInspection.GovernorateCode);
        landTechnicalInspectionDTO.LandOwnerShipName = landOwner.Name;

        var user = await _context.Users.SingleAsync(u => u.Id == landTechnicalInspection.TechnicalResponsiblePersonId);

        landTechnicalInspectionDTO.TechnicalResponsiblePersonNameAndId = user.Id + " " + user.FullName;

        return landTechnicalInspectionDTO;
    }

    // POST: api
    [HttpPost]
    public async Task<ActionResult<LandTechnicalInspection>> Create(LandTechnicalInspection landTechnicalInspection)
    {
        Console.WriteLine("this is the land ownership code:");
        Console.WriteLine(JsonSerializer.Serialize(landTechnicalInspection, new JsonSerializerOptions { WriteIndented = true }));
        if (landTechnicalInspection == null)
        {
            return BadRequest();
        }

        var validationResult = await _validator.ValidateAsync(landTechnicalInspection);
        if (!validationResult.IsValid)
        {
            foreach (var error in validationResult.Errors)
            {
                ModelState.AddModelError(error.PropertyName, error.ErrorMessage);
            }

            return ValidationProblem(ModelState);
        }

        if (await _context.LandTechnicalInspection.AnyAsync(l => l.LandCode == landTechnicalInspection.LandCode))
        {
            return Conflict("يوجد بالفعل فحص فني للأرض بنفس كود قطعة الأرض.");
        }

        // Verify the land exists in the Lands table
        if (!await _context.Lands.AnyAsync(l => l.LandCode == landTechnicalInspection.LandCode))
        {
            return BadRequest("لا توجد قطعة أرض بهذا الكود في جدول الأراضي.");
        }

        if (!await _context.Governorates.AnyAsync(g => g.Id == landTechnicalInspection.GovernorateCode))
        {
            return BadRequest("كود المحافظة غير موجود.");
        }

        if (!await _context.LandOwner.AnyAsync(o => o.Id == landTechnicalInspection.LandOwnershipCode))
        {
            return BadRequest("كود الملكية غير موجود.");
        }

        if (!await _context.Users.AnyAsync(u => u.Id == landTechnicalInspection.TechnicalResponsiblePersonId))
        {
            return BadRequest("المسؤول الفني غير موجود.");
        }

        landTechnicalInspection.CreatedAt = DateTime.Now;

        _context.LandTechnicalInspection.Add(landTechnicalInspection);

        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(Create), new { id = landTechnicalInspection.Id }, landTechnicalInspection);
    }
}
