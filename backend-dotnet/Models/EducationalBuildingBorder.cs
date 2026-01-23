using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.Text.Json.Serialization;

namespace AngularProjectApi.Models
{
    public class EducationalBuildingBorder
    {
        public Guid Id { get; set; }
        public string BoundaryName { get; set; } = string.Empty;

        public decimal Length { get; set; }             

        public bool NeighborFound { get; set; }          

        public decimal? NeighborLevel { get; set; }

        public string NeighborDescription { get; set; } = string.Empty;

        public bool HasFence { get; set; }
        
        [JsonIgnore]
        [ValidateNever]
        public EducationalBuilding EducationalBuilding { get; set; } = null!;
        public Guid EducationalBuildingId { get; set; }
    }
}
