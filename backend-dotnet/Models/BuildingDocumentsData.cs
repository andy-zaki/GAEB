using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AngularProjectApi.Models;

[Table("BuildingDocumentsData")]
public class BuildingDocumentsData
{
    [Key]
    public int Id { get; set; }

    [Required]
    [MaxLength(50)]
    public string BuildingNumber { get; set; } = string.Empty;

    [Required]
    public int DocumentId { get; set; }

    public bool Exist { get; set; }
    public bool DoesNotExist { get; set; }
    public bool NotRequired { get; set; }

    [ForeignKey(nameof(BuildingNumber))]
    public Building? Building { get; set; }

    [ForeignKey(nameof(DocumentId))]
    public DocumentsData? Document { get; set; }
}
