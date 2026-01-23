using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System.Text.Json.Serialization;

namespace AngularProjectApi.Models
{
    public class EducationalBuildingInfo
    {
        public Guid Id { get; set; }
        public decimal AverageSiteLevel { get; set; }        
        public decimal HighestPointLevel { get; set; }        
        public decimal ProposedCourtyardLevel { get; set; }  
        public decimal LowestPointLevel { get; set; }
        
        [JsonIgnore]
        [ValidateNever]
        public EducationalBuilding EducationalBuilding { get; set; } = null!;
        public Guid EducationalBuildingId { get; set; }
    }
}
