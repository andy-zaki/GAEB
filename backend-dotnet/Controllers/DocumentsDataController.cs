using AngularProjectApi.Data;
using AngularProjectApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AngularProjectApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class DocumentsDataController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public DocumentsDataController(ApplicationDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<DocumentsData>>> GetMasterDocuments()
    {
        var docs = await _context.DocumentsData
            .AsNoTracking()
            .OrderBy(d => d.Id)
            .ToListAsync();

        return Ok(docs);
    }

    [HttpPost]
    public async Task<ActionResult<DocumentsData>> CreateMasterDocument([FromBody] DocumentsData doc)
    {
        if (doc == null)
        {
            return BadRequest("البيانات مطلوبة");
        }

        if (string.IsNullOrWhiteSpace(doc.Name))
        {
            return BadRequest("اسم المستند مطلوب");
        }

        _context.DocumentsData.Add(doc);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetMasterDocuments), new { id = doc.Id }, doc);
    }

    [HttpPut("{id:int}")]
    public async Task<ActionResult<DocumentsData>> UpdateMasterDocument(int id, [FromBody] DocumentsData doc)
    {
        if (doc == null)
        {
            return BadRequest("البيانات مطلوبة");
        }

        if (string.IsNullOrWhiteSpace(doc.Name))
        {
            return BadRequest("اسم المستند مطلوب");
        }

        var existing = await _context.DocumentsData.FindAsync(id);
        if (existing == null)
        {
            return NotFound("المستند غير موجود");
        }

        existing.Name = doc.Name;
        existing.DocumentCode = doc.DocumentCode;

        await _context.SaveChangesAsync();
        return Ok(existing);
    }

    [HttpDelete("{id:int}")]
    public async Task<IActionResult> DeleteMasterDocument(int id)
    {
        var existing = await _context.DocumentsData.FindAsync(id);
        if (existing == null)
        {
            return NotFound("المستند غير موجود");
        }

        _context.DocumentsData.Remove(existing);
        await _context.SaveChangesAsync();
        return Ok();
    }

    [HttpGet("building-numbers")]
    public async Task<ActionResult<IEnumerable<object>>> GetBuildingNumbers()
    {
        var numbers = await _context.Buildings
            .AsNoTracking()
            .Select(b => new { buildingNumber = b.BuildingNumber, schoolName = b.SchoolName })
            .OrderBy(x => x.buildingNumber)
            .ToListAsync();

        return Ok(numbers);
    }

    [HttpGet("by-buildingnumber/{buildingNumber}")]
    public async Task<ActionResult<IEnumerable<object>>> GetBuildingDocuments(string buildingNumber)
    {
        if (string.IsNullOrWhiteSpace(buildingNumber))
        {
            return BadRequest("رقم المبنى مطلوب");
        }

        var exists = await _context.Buildings.AnyAsync(b => b.BuildingNumber == buildingNumber);
        if (!exists)
        {
            return NotFound("رقم المبنى غير موجود");
        }

        var master = await _context.DocumentsData
            .AsNoTracking()
            .OrderBy(d => d.Id)
            .ToListAsync();

        var statuses = await _context.BuildingDocumentsData
            .AsNoTracking()
            .Where(x => x.BuildingNumber == buildingNumber)
            .ToListAsync();

        var result = master.Select(m =>
        {
            var s = statuses.FirstOrDefault(x => x.DocumentId == m.Id);
            return new
            {
                documentId = m.Id,
                name = m.Name,
                exist = s?.Exist ?? false,
                doesNotExist = s?.DoesNotExist ?? false,
                notRequired = s?.NotRequired ?? false
            };
        }).ToList();

        return Ok(result);
    }

    [HttpPost("save")]
    public async Task<IActionResult> SaveBuildingDocuments([FromBody] SaveBuildingDocumentsRequest request)
    {
        if (request == null)
        {
            return BadRequest("البيانات مطلوبة");
        }

        if (string.IsNullOrWhiteSpace(request.BuildingNumber))
        {
            return BadRequest("رقم المبنى مطلوب");
        }

        var exists = await _context.Buildings.AnyAsync(b => b.BuildingNumber == request.BuildingNumber);
        if (!exists)
        {
            return NotFound("رقم المبنى غير موجود");
        }

        if (request.Documents == null)
        {
            return BadRequest("قائمة المستندات مطلوبة");
        }

        var masterIds = await _context.DocumentsData
            .AsNoTracking()
            .Select(d => d.Id)
            .ToListAsync();

        var invalidIds = request.Documents
            .Select(d => d.DocumentId)
            .Distinct()
            .Where(id => !masterIds.Contains(id))
            .ToList();

        if (invalidIds.Count > 0)
        {
            return BadRequest($"مستندات غير موجودة: {string.Join(", ", invalidIds)}");
        }

        await using var tx = await _context.Database.BeginTransactionAsync();

        var current = await _context.BuildingDocumentsData
            .Where(d => d.BuildingNumber == request.BuildingNumber)
            .ToListAsync();

        if (current.Count > 0)
        {
            _context.BuildingDocumentsData.RemoveRange(current);
            await _context.SaveChangesAsync();
        }

        var newRows = request.Documents.Select(d => new BuildingDocumentsData
        {
            BuildingNumber = request.BuildingNumber,
            DocumentId = d.DocumentId,
            Exist = d.Exist,
            DoesNotExist = d.DoesNotExist,
            NotRequired = d.NotRequired
        }).ToList();

        _context.BuildingDocumentsData.AddRange(newRows);
        await _context.SaveChangesAsync();

        await tx.CommitAsync();

        return Ok(new { buildingNumber = request.BuildingNumber, count = newRows.Count });
    }
}
