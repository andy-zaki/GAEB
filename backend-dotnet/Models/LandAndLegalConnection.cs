using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AngularProjectApi.Models
{
  public class LandAndLegalConnection
  {
    [Key]
    public int Id { get; set; }
    public int LandId { get; set; }
    public int SchoolReferenceNumber { get; set; }

    [ForeignKey(nameof(LandId))]
    public LandTechnicalInspection? LandTechnicalInspection { get; set; }
  }
}
