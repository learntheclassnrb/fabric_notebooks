REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(
    REGEXP_REPLACE(

    IFNULL([ADMISSION_H_AND_P_NOTES], ""),

    "(?i)\b(?:ADMISSION\s+)?(?:H\s*&\s*P|H\s+AND\s+P|HISTORY\s+(?:AND|&)\s+PHYSICAL)\b\s*:?",
    CHAR(10) + CHAR(10) +
    "ADMISSION H&P" +
    CHAR(10)
),

    "(?i)\b(?:CHIEF\s+COMPLAINT|CC)\b\s*:",
    CHAR(10) + CHAR(10) +
    "CHIEF COMPLAINT" +
    CHAR(10)
),

    "(?i)\bHISTORY\s+OF\s+PRESENT\s+ILLNESS\b\s*:?",
    CHAR(10) + CHAR(10) +
    "HISTORY OF PRESENT ILLNESS" +
    CHAR(10)
),

    "(?i)\bHPI\b\s*:",
    CHAR(10) + CHAR(10) +
    "HISTORY OF PRESENT ILLNESS" +
    CHAR(10)
),

    "(?i)\b(?:EMERGENCY\s+DEPARTMENT\s+COURSE|ED\s+COURSE)\b\s*:?",
    CHAR(10) + CHAR(10) +
    "EMERGENCY DEPARTMENT COURSE" +
    CHAR(10)
),

    "(?i)\bPAST\s+MEDICAL\s+HISTORY\b\s*:?",
    CHAR(10) + CHAR(10) +
    "PAST MEDICAL HISTORY" +
    CHAR(10)
),

    "(?i)\bPMH\b\s*:",
    CHAR(10) + CHAR(10) +
    "PAST MEDICAL HISTORY" +
    CHAR(10)
),

    "(?i)\b(?:PAST\s+SURGICAL\s+HISTORY|SURGICAL\s+HISTORY)\b\s*:?",
    CHAR(10) + CHAR(10) +
    "PAST SURGICAL HISTORY" +
    CHAR(10)
),

    "(?i)\bPSH\b\s*:",
    CHAR(10) + CHAR(10) +
    "PAST SURGICAL HISTORY" +
    CHAR(10)
),

    "(?i)\bFAMILY\s*/?\s*SOCIAL\s+HISTORY\b\s*:?",
    CHAR(10) + CHAR(10) +
    "FAMILY / SOCIAL HISTORY" +
    CHAR(10)
),

    "(?i)\bFAMILY\s+HISTORY\b\s*:?",
    CHAR(10) + CHAR(10) +
    "FAMILY HISTORY" +
    CHAR(10)
),

    "(?i)\bSOCIAL\s+HISTORY\b\s*:?",
    CHAR(10) + CHAR(10) +
    "SOCIAL HISTORY" +
    CHAR(10)
),

    "(?i)\bALLERGIES\b\s*:?",
    CHAR(10) + CHAR(10) +
    "ALLERGIES" +
    CHAR(10)
),

    "(?i)\b(?:HOME\s+MEDICATIONS|MEDICATIONS\s+ON\s+ADMISSION)\b\s*:?",
    CHAR(10) + CHAR(10) +
    "HOME MEDICATIONS" +
    CHAR(10)
),

    "(?i)\bREVIEW\s+OF\s+SYSTEMS\b\s*:?",
    CHAR(10) + CHAR(10) +
    "REVIEW OF SYSTEMS" +
    CHAR(10)
),

    "(?i)\bROS\b\s*:",
    CHAR(10) + CHAR(10) +
    "REVIEW OF SYSTEMS" +
    CHAR(10)
),

    "(?i)\bPHYSICAL\s+EXAM(?:INATION)?\b\s*:?",
    CHAR(10) + CHAR(10) +
    "PHYSICAL EXAM" +
    CHAR(10)
),

    "(?i)\b(?:ADMISSION\s+VITALS|VITAL\s+SIGNS|VITALS)\b\s*:",
    CHAR(10) + CHAR(10) +
    "VITAL SIGNS" +
    CHAR(10)
),

    "(?i)\bDIAGNOSTIC\s+DATA\b\s*:?",
    CHAR(10) + CHAR(10) +
    "DIAGNOSTIC DATA" +
    CHAR(10)
),

    "(?i)\b(?:LABORATORY|LAB)\s+RESULTS\b\s*:?",
    CHAR(10) + CHAR(10) +
    "LAB RESULTS" +
    CHAR(10)
),

    "(?i)\b(?:RADIOLOGY|IMAGING)\s+RESULTS\b\s*:?",
    CHAR(10) + CHAR(10) +
    "IMAGING RESULTS" +
    CHAR(10)
),

    "(?i)\bASSESSMENT\s*(?:&|AND|/)\s*PLAN\b\s*:?",
    CHAR(10) + CHAR(10) +
    "ASSESSMENT & PLAN" +
    CHAR(10)
),

    "(?i)\bA\s*/\s*P\b\s*:",
    CHAR(10) + CHAR(10) +
    "ASSESSMENT & PLAN" +
    CHAR(10)
),

    "(?i)\b(?:ACTIVE\s+HOSPITAL\s+PROBLEMS|PROBLEM\s+LIST)\b\s*:?",
    CHAR(10) + CHAR(10) +
    "ACTIVE HOSPITAL PROBLEMS" +
    CHAR(10)
),

    "(?i)\bCODE\s+STATUS\b\s*:?",
    CHAR(10) + CHAR(10) +
    "CODE STATUS" +
    CHAR(10)
)
