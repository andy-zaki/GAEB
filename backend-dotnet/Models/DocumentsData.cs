using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AngularProjectApi.Models;

[Table("DocumentsData")]
public class DocumentsData
{
    [Key]
    public int Id { get; set; }

    [StringLength(50)]
    public string? DocumentCode { get; set; }

    [Required]
    [StringLength(500)]
    public string Name { get; set; } = null!;
}
