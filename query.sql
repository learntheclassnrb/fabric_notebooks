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
        l.ZipCodePart1,
        l.ZipCodePart2,
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

        CASE
            WHEN NULLIF(LTRIM(RTRIM(CAST(a.PostalCode AS varchar(50)))), '') IS NOT NULL
            THEN LEFT(REPLACE(LTRIM(RTRIM(CAST(a.PostalCode AS varchar(50)))), '-', ''), 5)
            ELSE NULL
        END AS ZipCodePart1,

        CASE
            WHEN LEN(REPLACE(LTRIM(RTRIM(CAST(ISNULL(a.PostalCode, '') AS varchar(50)))), '-', '')) > 5
            THEN SUBSTRING(REPLACE(LTRIM(RTRIM(CAST(a.PostalCode AS varchar(50)))), '-', ''), 6, 4)
            ELSE NULL
        END AS ZipCodePart2,

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
    ZipCodePart1,
    ZipCodePart2,
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
    ZipCodePart1,
    ZipCodePart2,
    TerritoryCode,
    FireDistrictCode,
    Address1,
    Address2
FROM CDHLocation;




------WITH ApexLocation AS
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
        l.ZipCodePart1,
        l.ZipCodePart2,
        l.TerritoryCode,
        l.FireDistrictCode,
        l.Address1,
        l.Address2
    FROM dbo.Location_Dim l
),

CDHBase AS
(
    SELECT
        a.AddressId,
        a.Line1,
        a.Line2,
        a.Line3,
        a.City,
        a.State,
        a.County,
        a.CreateTimestamp,

        LTRIM(RTRIM(CAST(a.PostalCode AS varchar(50)))) AS PostalCodeRaw,
        REPLACE(LTRIM(RTRIM(CAST(a.PostalCode AS varchar(50)))), '-', '') AS PostalCodeNoDash
    FROM pol.Address a
    WHERE NULLIF(LTRIM(RTRIM(a.Line1)), '') IS NOT NULL
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

        CASE
            WHEN a.PostalCodeNoDash NOT LIKE '%[^0-9]%'
             AND LEN(a.PostalCodeNoDash) IN (5, 9)
            THEN LEFT(a.PostalCodeNoDash, 5)
            ELSE NULL
        END AS ZipCodePart1,

        CASE
            WHEN a.PostalCodeNoDash NOT LIKE '%[^0-9]%'
             AND LEN(a.PostalCodeNoDash) = 9
            THEN RIGHT(a.PostalCodeNoDash, 4)
            ELSE NULL
        END AS ZipCodePart2,

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

    FROM CDHBase a
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
    ZipCodePart1,
    ZipCodePart2,
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
    ZipCodePart1,
    ZipCodePart2,
    TerritoryCode,
    FireDistrictCode,
    Address1,
    Address2
FROM CDHLocation;
