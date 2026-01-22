// namespace AngularProjectApi.Models;

// public partial class LandTechnicalInspection
// {
//   public int Id { get; set; }

//   public int LandCode { get; set; }

//   public int GovernorateCode { get; set; }

//   public string LandAddress { get; set; } = null!;

//   public string LandOwnerName { get; set; } = null!;

//   public string LandOwnerAddress { get; set; } = null!;

//   public int TotalArea { get; set; }

//   public string LandNature { get; set; } = null!;

//   public int LandOwnershipCode { get; set; }

//   public string? NorthernBoundary { get; set; }

//   public int? NorthernBoundaryLength { get; set; }

//   public string? SouthernBoundary { get; set; }

//   public int? SouthernBoundaryLength { get; set; }

//   public string? EasternBoundary { get; set; }

//   public int? EasternBoundaryLength { get; set; }

//   public string? WesternBoundary { get; set; }

//   public int? WesternBoundaryLength { get; set; }

//   public string? NortheastBoundary { get; set; }

//   public int? NortheastBoundaryLength { get; set; }

//   public string? NorthwestBoundary { get; set; }

//   public int? NorthwestBoundaryLength { get; set; }

//   public string? SoutheastBoundary { get; set; }

//   public int? SoutheastBoundaryLength { get; set; }

//   public string? SouthwestBoundary { get; set; }

//   public int? SouthwestBoundaryLength { get; set; }

//   public Guid? TechnicalResponsiblePersonId { get; set; }

//   public int? LegalResponsiblePersonId { get; set; }

//   public DateTime? NeedsCommitteeDate { get; set; }

//   public DateTime? TechnicalInspectionDate { get; set; }
//   public DateTime? CreatedAt { get; set; }
// }



using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AngularProjectApi.Models;

[Table("LandTechnicalInspection")]
public partial class LandTechnicalInspection
{
    [Key]
    public int Id { get; set; }

    [Required(ErrorMessage = "كود الأرض مطلوب")]
    public int LandCode { get; set; }

    public virtual Land? Land { get; set; }

    public ICollection<LandAndLegalConnection> LandAndLegalConnections { get; set; } = new List<LandAndLegalConnection>();

    [Required(ErrorMessage = "كود المحافظة مطلوب")]
    public int GovernorateCode { get; set; }

    [Required(ErrorMessage = "عنوان الأرض مطلوب")]
    [StringLength(500, ErrorMessage = "العنوان طويل جداً")]
    public string LandAddress { get; set; } = null!;

    [Required(ErrorMessage = "اسم مالك الأرض مطلوب")]
    [StringLength(200, MinimumLength = 3, ErrorMessage = "الاسم يجب أن يكون 3 أحرف على الأقل")]
    public string LandOwnerName { get; set; } = null!;

    [Required(ErrorMessage = "عنوان مالك الأرض مطلوب")]
    public string LandOwnerAddress { get; set; } = null!;

    [Required(ErrorMessage = "المساحة الإجمالية مطلوبة")]
    [Range(1, int.MaxValue, ErrorMessage = "المساحة يجب أن تكون أكبر من صفر")]
    public int TotalArea { get; set; }

    [Required(ErrorMessage = "طبيعة الأرض مطلوبة")]
    public string LandNature { get; set; } = null!;

    [Required(ErrorMessage = "كود ملكية الأرض مطلوب")]
    public int LandOwnershipCode { get; set; }

    [Required(ErrorMessage = "الحد الشمالي مطلوب")]
    public string? NorthernBoundary { get; set; }

    [Required(ErrorMessage = "طول الحد الشمالي مطلوب")]
    [Range(0, int.MaxValue, ErrorMessage = "الطول لا يمكن أن يكون سالباً")]
    public int? NorthernBoundaryLength { get; set; }

    [Required(ErrorMessage = "الحد الجنوبي مطلوب")]
    public string? SouthernBoundary { get; set; }

    [Required(ErrorMessage = "طول الحد الجنوبي مطلوب")]
    [Range(0, int.MaxValue)]
    public int? SouthernBoundaryLength { get; set; }

    [Required(ErrorMessage = "الحد الشرقي مطلوب")]
    public string? EasternBoundary { get; set; }

    [Required(ErrorMessage = "طول الحد الشرقي مطلوب")]
    [Range(0, int.MaxValue)]
    public int? EasternBoundaryLength { get; set; }

    [Required(ErrorMessage = "الحد الغربي مطلوب")]
    public string? WesternBoundary { get; set; }

    [Required(ErrorMessage = "طول الحد الغربي مطلوب")]
    [Range(0, int.MaxValue)]
    public int? WesternBoundaryLength { get; set; }

    [Required(ErrorMessage = "الحد الشمالي الشرقي مطلوب")]
    public string? NortheastBoundary { get; set; }

    [Required(ErrorMessage = "طول الحد الشمالي الشرقي مطلوب")]
    [Range(0, int.MaxValue)]
    public int? NortheastBoundaryLength { get; set; }

    [Required(ErrorMessage = "الحد الشمالي الغربي مطلوب")]
    public string? NorthwestBoundary { get; set; }

    [Required(ErrorMessage = "طول الحد الشمالي الغربي مطلوب")]
    [Range(0, int.MaxValue)]
    public int? NorthwestBoundaryLength { get; set; }

    [Required(ErrorMessage = "الحد الجنوبي الشرقي مطلوب")]
    public string? SoutheastBoundary { get; set; }

    [Required(ErrorMessage = "طول الحد الجنوبي الشرقي مطلوب")]
    [Range(0, int.MaxValue)]
    public int? SoutheastBoundaryLength { get; set; }

    [Required(ErrorMessage = "الحد الجنوبي الغربي مطلوب")]
    public string? SouthwestBoundary { get; set; }

    [Required(ErrorMessage = "طول الحد الجنوبي الغربي مطلوب")]
    [Range(0, int.MaxValue)]
    public int? SouthwestBoundaryLength { get; set; }

    [Required(ErrorMessage = "المسؤول الفني مطلوب")]
    public Guid? TechnicalResponsiblePersonId { get; set; }

    [Required(ErrorMessage = "المسؤول القانوني مطلوب")]
    public int? LegalResponsiblePersonId { get; set; }

    [Required(ErrorMessage = "تاريخ احتياج اللجنة مطلوب")]
    [DataType(DataType.Date)]
    public DateTime? NeedsCommitteeDate { get; set; }

    [Required(ErrorMessage = "تاريخ المعاينة الفنية مطلوب")]
    [DataType(DataType.Date)]
    public DateTime? TechnicalInspectionDate { get; set; }

    [Required]
    public DateTime? CreatedAt { get; set; } = DateTime.Now;
}