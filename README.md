WITH ApexLocation AS
(
    SELECT
        'APEX' AS SourceSystemCode,
        CAST(l.sKey AS varchar(100)) AS SourceLocationId,

        CAST(l.sKey AS bigint) AS sKey,

        CAST(l.Address1 AS varchar(255)) AS Address1,
        CAST(l.Address2 AS varchar(255)) AS Address2,
        CAST(NULL AS varchar(255)) AS Address3,

        CAST(l.CityName AS varchar(255)) AS CityName,
        CAST(l.State_sKey AS bigint) AS State_sKey,
        CAST(l.StateOrTerritoryAbbreviation AS varchar(50)) AS StateOrTerritoryAbbreviation,
        CAST(l.CountyName AS varchar(255)) AS CountyName,

        /* 
           Apex has ZipCodePart1 and ZipCodePart2.
           We preserve both raw parts and create a combined PostalCode for easier comparison to CDH.
        */
        CASE
            WHEN NULLIF(CAST(l.ZipCodePart1 AS varchar(50)), '') IS NOT NULL
             AND NULLIF(CAST(l.ZipCodePart2 AS varchar(50)), '') IS NOT NULL
                THEN CONCAT(
                    CAST(l.ZipCodePart1 AS varchar(50)),
                    '-',
                    CAST(l.ZipCodePart2 AS varchar(50))
                )

            WHEN NULLIF(CAST(l.ZipCodePart1 AS varchar(50)), '') IS NOT NULL
                THEN CAST(l.ZipCodePart1 AS varchar(50))

            WHEN NULLIF(CAST(l.ZipCodePart2 AS varchar(50)), '') IS NOT NULL
                THEN CAST(l.ZipCodePart2 AS varchar(50))

            ELSE CAST(l.ZipCodePart1 AS varchar(50))
        END AS PostalCode,

        CAST(l.ZipCodePart1 AS varchar(50)) AS ZipCodePart1,
        CAST(l.ZipCodePart2 AS varchar(50)) AS ZipCodePart2,

        CAST(l.FIPSCountyCode AS varchar(50)) AS FIPSCountyCode,
        CAST(l.InternationalAddressIndicator AS varchar(50)) AS InternationalAddressIndicator,
        CAST(l.TerritoryCode AS varchar(50)) AS TerritoryCode,
        CAST(l.FireDistrictCode AS varchar(50)) AS FireDistrictCode,

        CAST(l.CreateUpdateFlag AS varchar(50)) AS CreateUpdateFlag,
        CAST(l.SSISProcessedStartDateTime AS datetime) AS SSISProcessedStartDateTime,
        CAST(l.BatchRunDate AS date) AS BatchRunDate,
        CAST(l.CreateDate AS date) AS CreateDate,
        CAST(l.CreateTime AS time(7)) AS CreateTime,
        CAST(l.LastUpdateDate AS date) AS LastUpdateDate,
        CAST(l.LastUpdateTime AS time(7)) AS LastUpdateTime,
        CAST(l.IsRIIMCompliant AS varchar(50)) AS IsRIIMCompliant

    FROM dbo.Location_Dim l
),

CDHLocation AS
(
    SELECT
        'CDH' AS SourceSystemCode,
        CAST(a.AddressId AS varchar(100)) AS SourceLocationId,

        CAST(NULL AS bigint) AS sKey,

        CAST(a.Line1 AS varchar(255)) AS Address1,
        CAST(a.Line2 AS varchar(255)) AS Address2,
        CAST(a.Line3 AS varchar(255)) AS Address3,

        CAST(a.City AS varchar(255)) AS CityName,
        CAST(NULL AS bigint) AS State_sKey,
        CAST(a.State AS varchar(50)) AS StateOrTerritoryAbbreviation,
        CAST(a.County AS varchar(255)) AS CountyName,

        /*
           CDH has one PostalCode field.
           Return it exactly as CDH stores it.
           Do not split, validate, or replace bad values.
        */
        CAST(a.PostalCode AS varchar(50)) AS PostalCode,

        CAST(NULL AS varchar(50)) AS ZipCodePart1,
        CAST(NULL AS varchar(50)) AS ZipCodePart2,

        CAST(NULL AS varchar(50)) AS FIPSCountyCode,
        CAST(NULL AS varchar(50)) AS InternationalAddressIndicator,
        CAST(NULL AS varchar(50)) AS TerritoryCode,
        CAST(NULL AS varchar(50)) AS FireDistrictCode,

        CAST(NULL AS varchar(50)) AS CreateUpdateFlag,
        CAST(a.CreateTimestamp AS datetime) AS SSISProcessedStartDateTime,
        CAST(a.CreateTimestamp AS date) AS BatchRunDate,
        CAST(a.CreateTimestamp AS date) AS CreateDate,
        CAST(a.CreateTimestamp AS time(7)) AS CreateTime,
        CAST(a.CreateTimestamp AS date) AS LastUpdateDate,
        CAST(a.CreateTimestamp AS time(7)) AS LastUpdateTime,
        CAST(NULL AS varchar(50)) AS IsRIIMCompliant

    FROM pol.Address a
)

SELECT
    SourceSystemCode,
    SourceLocationId,
    sKey,
    Address1,
    Address2,
    Address3,
    CityName,
    State_sKey,
    StateOrTerritoryAbbreviation,
    CountyName,
    PostalCode,
    ZipCodePart1,
    ZipCodePart2,
    FIPSCountyCode,
    InternationalAddressIndicator,
    TerritoryCode,
    FireDistrictCode,
    CreateUpdateFlag,
    SSISProcessedStartDateTime,
    BatchRunDate,
    CreateDate,
    CreateTime,
    LastUpdateDate,
    LastUpdateTime,
    IsRIIMCompliant
FROM ApexLocation

UNION ALL

SELECT
    SourceSystemCode,
    SourceLocationId,
    sKey,
    Address1,
    Address2,
    Address3,
    CityName,
    State_sKey,
    StateOrTerritoryAbbreviation,
    CountyName,
    PostalCode,
    ZipCodePart1,
    ZipCodePart2,
    FIPSCountyCode,
    InternationalAddressIndicator,
    TerritoryCode,
    FireDistrictCode,
    CreateUpdateFlag,
    SSISProcessedStartDateTime,
    BatchRunDate,
    CreateDate,
    CreateTime,
    LastUpdateDate,
    LastUpdateTime,
    IsRIIMCompliant
FROM CDHLocation;
