CREATE TABLE EducationalBuildingInfos (
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,

    AverageSiteLevel DECIMAL(18, 2) NOT NULL,
    HighestPointLevel DECIMAL(18, 2) NOT NULL,
    ProposedCourtyardLevel DECIMAL(18, 2) NOT NULL,
    LowestPointLevel DECIMAL(18, 2) NOT NULL,

    EducationalBuildingId UNIQUEIDENTIFIER NOT NULL,

    CONSTRAINT FK_EducationalBuildingInfo_EducationalBuilding
        FOREIGN KEY (EducationalBuildingId)
        REFERENCES EducationalBuildings(Id)
        ON DELETE CASCADE
);

CREATE TABLE EducationalBuildingBorders (
    Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,

    BoundaryName NVARCHAR(200) NOT NULL,
    Length DECIMAL(18, 2) NOT NULL,

    NeighborFound BIT NOT NULL,
    NeighborLevel DECIMAL(18, 2) NULL,

    NeighborDescription NVARCHAR(500) NOT NULL,
    HasFence BIT NOT NULL,

    EducationalBuildingId UNIQUEIDENTIFIER NOT NULL,

    CONSTRAINT FK_EducationalBuildingBorder_EducationalBuilding
        FOREIGN KEY (EducationalBuildingId)
        REFERENCES EducationalBuildings(Id)
        ON DELETE CASCADE
);
