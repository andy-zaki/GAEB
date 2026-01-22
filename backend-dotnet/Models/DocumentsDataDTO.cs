namespace AngularProjectApi.Models;

public class DocumentsDataMasterDTO
{
    public int Id { get; set; }
    public string? DocumentCode { get; set; }
    public string Name { get; set; } = string.Empty;
}

public class BuildingDocumentStatusDTO
{
    public int DocumentId { get; set; }
    public bool Exist { get; set; }
    public bool DoesNotExist { get; set; }
    public bool NotRequired { get; set; }
}

public class SaveBuildingDocumentsRequest
{
    public string BuildingNumber { get; set; } = string.Empty;
    public List<BuildingDocumentStatusDTO> Documents { get; set; } = new();
}
