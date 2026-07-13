SELECT
    peh.PAT_ID,
    peh.PAT_ENC_CSN_ID,
    peh.HSP_ACCOUNT_ID,

    peh.HOSP_ADMSN_TIME,
    peh.HOSP_DISCH_TIME,

    peh.DISCH_DISP_C,
    disp.NAME AS DISCHARGE_DISPOSITION,

    peh.DISCH_DEST_C,

    dx.LINE AS DIAGNOSIS_SEQUENCE,
    CASE
        WHEN dx.LINE = 1 THEN 'Principal Final Diagnosis'
        ELSE 'Secondary Final Diagnosis'
    END AS DIAGNOSIS_TYPE,

    dx.DX_ID,
    edg.DX_NAME,
    edg.REF_BILL_CODE AS ICD_CODE,
    edg.REF_BILL_CODE_SET_C AS ICD_CODE_SET

FROM PAT_ENC_HSP peh

INNER JOIN HSP_ACCT_DX_LIST dx
    ON peh.HSP_ACCOUNT_ID = dx.HSP_ACCOUNT_ID

INNER JOIN CLARITY_EDG edg
    ON dx.DX_ID = edg.DX_ID

LEFT JOIN ZC_DISCH_DISP disp
    ON peh.DISCH_DISP_C = disp.DISCH_DISP_C

WHERE peh.HOSP_DISCH_TIME IS NOT NULL

-- Use the principal final diagnosis only
AND dx.LINE = 1

-- Replace with the post-acute disposition codes used by your organization
AND peh.DISCH_DISP_C IN
(
    /* SNF code,
       inpatient rehabilitation code,
       LTACH code,
       home-health code,
       hospice code */
);
