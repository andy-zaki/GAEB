using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AngularProjectApi.Models;

public class Land
{
    [Key]
    public Guid Id { get; set; } = Guid.NewGuid();
    
    public int? ReferenceNumber { get; set; }
    
    [MaxLength(50)]
    public string? UsageStatus { get; set; }
    
    [MaxLength(100)]
    public string? Headquarters { get; set; }
    
    [MaxLength(50)]
    public string? ApprovalStatus { get; set; }
    
    [MaxLength(50)]
    public string? IdentificationNumber { get; set; }
    
    [MaxLength(100)]
    public string? CenterDepartment { get; set; }
    
    [Column(TypeName = "decimal(18,2)")]
    public decimal? TotalArea { get; set; }
    
    [MaxLength(50)]
    public string? Phase { get; set; }
    
    [MaxLength(100)]
    public string? Approval { get; set; }
    
    [MaxLength(100)]
    public string? Housing { get; set; }
    
    [Column(TypeName = "decimal(18,2)")]
    public decimal? CommitteePricing { get; set; }
    
    [Column(TypeName = "decimal(18,2)")]
    public decimal? PurchasePrice { get; set; }
    
    [MaxLength(255)]
    public string? SaleNegotiations { get; set; }
    
    [Required(ErrorMessage = "كود الأرض مطلوب")]
    [Range(1, int.MaxValue, ErrorMessage = "كود الأرض يجب أن يكون أكبر من أو يساوي 1")]
    public int LandCode { get; set; }
    
    [MaxLength(100)]
    public string? Village { get; set; }
    
    [MaxLength(255)]
    public string? CurrentOwner { get; set; }
    
    [MaxLength(255)]
    public string? OriginalOwner { get; set; }
    
    [MaxLength(100)]
    public string? Model { get; set; }
    
    [MaxLength(255)]
    public string? Documents { get; set; }
    
    [MaxLength(255)]
    public string? Plan { get; set; }
    
    [MaxLength(255)]
    public string? BranchNotification { get; set; }
    
    [MaxLength(100)]
    public string? RealEstateStatus { get; set; }
    
    [MaxLength(100)]
    public string? BuildingBoundaries { get; set; }
    
    [MaxLength(100)]
    public string? NetworkData { get; set; }
    
    public string? NetworkObservations { get; set; }
    
    [MaxLength(100)]
    public string? LandAreaFromTotal { get; set; }
    
    [MaxLength(100)]
    public string? LandUseDatabase { get; set; }
    
    [MaxLength(100)]
    public string? LandInspectionDatabase { get; set; }
    
    public string? LandConstructionObstacles { get; set; }
    
    public string? LandCreationObstacles { get; set; }
    
    public string? LandConstructionData { get; set; }
    
    [MaxLength(100)]
    public string? LandReceiptDatabase { get; set; }
    
    [MaxLength(100)]
    public string? PaidAmountsDatabase { get; set; }
    
    public string? DecisionData { get; set; }
    
    public string? LandCommittees { get; set; }
    
    public string? LandFacilities { get; set; }
    
    [MaxLength(100)]
    public string? LandCoordinatesData { get; set; }
    
    public string? EducationalStudies { get; set; }
    
    public string? LandReviewCommittees { get; set; }

    // Boundaries
    [MaxLength(255)]
    public string? North { get; set; }

    [MaxLength(255)]
    public string? South { get; set; }

    [MaxLength(255)]
    public string? East { get; set; }

    [MaxLength(255)]
    public string? West { get; set; }

    // Boundary lengths
    public int? LengthNorth { get; set; }
    public int? LengthSouth { get; set; }
    public int? LengthEast { get; set; }
    public int? LengthWest { get; set; }

    // Corners
    [MaxLength(255)]
    public string? Ne { get; set; }

    [MaxLength(255)]
    public string? Nw { get; set; }

    [MaxLength(255)]
    public string? Se { get; set; }

    [MaxLength(255)]
    public string? Sw { get; set; }

    // Corner lengths
    public int? LengthNe { get; set; }
    public int? LengthNw { get; set; }
    public int? LengthSe { get; set; }
    public int? LengthSw { get; set; }
    
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    public DateTime UpdatedAt { get; set; } = DateTime.Now;

    public virtual LandTechnicalInspection? LandTechnicalInspection { get; set; }
    
    // Navigation properties
    public ICollection<LandCoordinate> Coordinates { get; set; } = new List<LandCoordinate>();
    public ICollection<BuildingLocation> BuildingLocations { get; set; } = new List<BuildingLocation>();
}

public class LandCoordinate
{
    [Key]
    public Guid Id { get; set; } = Guid.NewGuid();
    
    [Required]
    public Guid LandId { get; set; }
    
    [Required]
    public int PointNumber { get; set; }
    
    [Required]
    [Column(TypeName = "decimal(10,8)")]
    public decimal Latitude { get; set; }
    
    [Required]
    [Column(TypeName = "decimal(11,8)")]
    public decimal Longitude { get; set; }
    
    [Column(TypeName = "decimal(10,2)")]
    public decimal? Elevation { get; set; }
    
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    
    // Navigation property
    [ForeignKey("LandId")]
    public Land Land { get; set; } = null!;
}

public class BuildingLocation
{
    [Key]
    public Guid Id { get; set; } = Guid.NewGuid();
    
    [Required]
    public Guid LandId { get; set; }
    
    [Required]
    [MaxLength(50)]
    public string Code { get; set; } = string.Empty;
    
    [MaxLength(255)]
    public string? LocationName { get; set; }
    
    public int? Coordinates { get; set; }
    
    [MaxLength(50)]
    public string? Status { get; set; }
    
    [MaxLength(50)]
    public string? RequiredStatus { get; set; }
    
    [MaxLength(255)]
    public string? NeighborDescription { get; set; }
    
    public DateTime CreatedAt { get; set; } = DateTime.Now;
    
    // Navigation property
    [ForeignKey("LandId")]
    public Land Land { get; set; } = null!;
}
