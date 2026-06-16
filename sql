WITH ApexLocation AS
(
    SELECT
        'APEX' AS SourceSystemCode,
        CAST(l.sKey AS varchar(100)) AS SourceLocationId,

        l.sKey,
        l.CreateUpdateFlag,
        l.SSISProcessedStartDateTime,
        l.BatchRunDate,
        l.CreateDate,
        l.CreateTime,
        l.LastUpdateDate,
        l.LastUpdateTime,
        l.IsRIIMCompliant,
        l.CityName,
        l.State_sKey,
        l.StateOrTerritoryAbbreviation,
        l.CountyName,
        l.FIPSCountyCode,
        l.InternationalAddressIndicator,

        CASE
            WHEN NULLIF(LTRIM(RTRIM(CAST(l.ZipCodePart1 AS varchar(50)))), '') IS NOT NULL
             AND NULLIF(LTRIM(RTRIM(CAST(l.ZipCodePart2 AS varchar(50)))), '') IS NOT NULL
                THEN CONCAT(
                    NULLIF(LTRIM(RTRIM(CAST(l.ZipCodePart1 AS varchar(50)))), ''),
                    '-',
                    NULLIF(LTRIM(RTRIM(CAST(l.ZipCodePart2 AS varchar(50)))), '')
                )

            WHEN NULLIF(LTRIM(RTRIM(CAST(l.ZipCodePart1 AS varchar(50)))), '') IS NOT NULL
                THEN NULLIF(LTRIM(RTRIM(CAST(l.ZipCodePart1 AS varchar(50)))), '')

            ELSE NULL
        END AS PostalCode,

        l.TerritoryCode,
        l.FireDistrictCode,
        l.Address1,
        l.Address2
    FROM dbo.Location_Dim l
),

CDHLocation AS
(
    SELECT
        'CDH' AS SourceSystemCode,
        CAST(a.AddressId AS varchar(100)) AS SourceLocationId,

        CAST(NULL AS bigint) AS sKey,
        CAST('I' AS varchar(50)) AS CreateUpdateFlag,

        CAST(a.CreateTimestamp AS datetime) AS SSISProcessedStartDateTime,
        CAST(a.CreateTimestamp AS date) AS BatchRunDate,
        CAST(a.CreateTimestamp AS date) AS CreateDate,
        CAST(a.CreateTimestamp AS time(7)) AS CreateTime,
        CAST(a.CreateTimestamp AS date) AS LastUpdateDate,
        CAST(a.CreateTimestamp AS time(7)) AS LastUpdateTime,

        CAST('N' AS varchar(50)) AS IsRIIMCompliant,

        NULLIF(LTRIM(RTRIM(a.City)), '') AS CityName,

        CAST(NULL AS bigint) AS State_sKey,

        NULLIF(LTRIM(RTRIM(a.State)), '') AS StateOrTerritoryAbbreviation,

        NULLIF(LTRIM(RTRIM(a.County)), '') AS CountyName,

        CAST(NULL AS varchar(50)) AS FIPSCountyCode,

        CAST('N' AS varchar(50)) AS InternationalAddressIndicator,

        NULLIF(LTRIM(RTRIM(CAST(a.PostalCode AS varchar(50)))), '') AS PostalCode,

        CAST(NULL AS varchar(50)) AS TerritoryCode,

        CAST(NULL AS varchar(50)) AS FireDistrictCode,

        NULLIF(LTRIM(RTRIM(a.Line1)), '') AS Address1,

        NULLIF(LTRIM(RTRIM(
            CONCAT(
                ISNULL(NULLIF(LTRIM(RTRIM(a.Line2)), ''), ''),
                CASE
                    WHEN NULLIF(LTRIM(RTRIM(a.Line2)), '') IS NOT NULL
                     AND NULLIF(LTRIM(RTRIM(a.Line3)), '') IS NOT NULL
                    THEN ' '
                    ELSE ''
                END,
                ISNULL(NULLIF(LTRIM(RTRIM(a.Line3)), ''), '')
            )
        )), '') AS Address2

    FROM pol.Address a
    WHERE NULLIF(LTRIM(RTRIM(a.Line1)), '') IS NOT NULL
)

SELECT
    SourceSystemCode,
    SourceLocationId,
    sKey,
    CreateUpdateFlag,
    SSISProcessedStartDateTime,
    BatchRunDate,
    CreateDate,
    CreateTime,
    LastUpdateDate,
    LastUpdateTime,
    IsRIIMCompliant,
    CityName,
    State_sKey,
    StateOrTerritoryAbbreviation,
    CountyName,
    FIPSCountyCode,
    InternationalAddressIndicator,
    PostalCode,
    TerritoryCode,
    FireDistrictCode,
    Address1,
    Address2
FROM ApexLocation

UNION ALL

SELECT
    SourceSystemCode,
    SourceLocationId,
    sKey,
    CreateUpdateFlag,
    SSISProcessedStartDateTime,
    BatchRunDate,
    CreateDate,
    CreateTime,
    LastUpdateDate,
    LastUpdateTime,
    IsRIIMCompliant,
    CityName,
    State_sKey,
    StateOrTerritoryAbbreviation,
    CountyName,
    FIPSCountyCode,
    InternationalAddressIndicator,
    PostalCode,
    TerritoryCode,
    FireDistrictCode,
    Address1,
    Address2
FROM CDHLocation;
