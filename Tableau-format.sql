REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(
REPLACE(

IFNULL([ADMISSION_H_AND_P_NOTES], ""),

    "ADMISSION H & P",
    "~HP_ADMISSION~"
),
    "ADMISSION H&P",
    "~HP_ADMISSION~"
),
    "HISTORY AND PHYSICAL",
    "~HP_ADMISSION~"
),
    "HISTORY & PHYSICAL",
    "~HP_ADMISSION~"
),

    "CHIEF COMPLAINT:",
    "~HP_CC~"
),
    "Chief Complaint:",
    "~HP_CC~"
),
    "CC:",
    "~HP_CC~"
),

    "HISTORY OF PRESENT ILLNESS",
    "~HP_HPI~"
),
    "History of Present Illness:",
    "~HP_HPI~"
),
    "HPI:",
    "~HP_HPI~"
),

    "EMERGENCY DEPARTMENT COURSE",
    "~HP_ED~"
),
    "ED COURSE:",
    "~HP_ED~"
),
    "ED Course:",
    "~HP_ED~"
),

    "PAST MEDICAL HISTORY",
    "~HP_PMH~"
),
    "PMH:",
    "~HP_PMH~"
),

    "PAST SURGICAL HISTORY",
    "~HP_PSH~"
),
    "SURGICAL HISTORY",
    "~HP_PSH~"
),
    "PSH:",
    "~HP_PSH~"
),

    "ALLERGIES / MEDICATIONS",
    "~HP_ALLMED~"
),
    "ALLERGIES/MEDICATIONS",
    "~HP_ALLMED~"
),
    "ALLERGIES AND MEDICATIONS",
    "~HP_ALLMED~"
),
    "ALLERGIES:",
    "~HP_ALLERGIES~"
),

    "MEDICATIONS ON ADMISSION",
    "~HP_MEDS~"
),
    "HOME MEDICATIONS",
    "~HP_MEDS~"
),
    "Prior to Admission Medications",
    "~HP_MEDS~"
),

    "FAMILY / SOCIAL HISTORY",
    "~HP_FAMSOC~"
),
    "FAMILY/SOCIAL HISTORY",
    "~HP_FAMSOC~"
),
    "FAMILY AND SOCIAL HISTORY",
    "~HP_FAMSOC~"
),

    "REVIEW OF SYSTEMS",
    "~HP_ROS~"
),
    "ROS:",
    "~HP_ROS~"
),

    "PHYSICAL EXAMINATION",
    "~HP_PE~"
),
    "PHYSICAL EXAM",
    "~HP_PE~"
),

    "ADMISSION VITALS:",
    "~HP_VITALS~"
),
    "Admission Vitals:",
    "~HP_VITALS~"
),
    "VITAL SIGNS:",
    "~HP_VITALS~"
),

    "DIAGNOSTIC DATA",
    "~HP_DIAG~"
),

    "LABORATORY RESULTS",
    "~HP_LABS~"
),
    "LAB RESULTS",
    "~HP_LABS~"
),

    "RADIOLOGY RESULTS",
    "~HP_IMAGING~"
),
    "IMAGING RESULTS",
    "~HP_IMAGING~"
),

    "ACTIVE HOSPITAL PROBLEMS",
    "~HP_PROBLEMS~"
),
    "Active Hospital Problems",
    "~HP_PROBLEMS~"
),
    "PROBLEM LIST",
    "~HP_PROBLEMS~"
),

    "ASSESSMENT & PLAN",
    "~HP_AP~"
),
    "ASSESSMENT AND PLAN",
    "~HP_AP~"
),
    "ASSESSMENT/PLAN",
    "~HP_AP~"
),
    "A/P:",
    "~HP_AP~"
),

    "CODE STATUS",
    "~HP_CODE~"
),
    "Code Status:",
    "~HP_CODE~"
),

    "Facility-Administered Medications:",
    "~HP_FACMED~"
),
    "Current Outpatient Medications:",
    "~HP_OUTMED~"
),

    "Family History:",
    "~HP_FAMHX~"
),
    "Social History:",
    "~HP_SOCHX~"
),

    "~HP_ADMISSION~",
    CHAR(10) + CHAR(10) +
    "ADMISSION H&P" +
    CHAR(10)
),

    "~HP_CC~",
    CHAR(10) + CHAR(10) +
    "CHIEF COMPLAINT" +
    CHAR(10)
),

    "~HP_HPI~",
    CHAR(10) + CHAR(10) +
    "HISTORY OF PRESENT ILLNESS" +
    CHAR(10)
),

    "~HP_ED~",
    CHAR(10) + CHAR(10) +
    "EMERGENCY DEPARTMENT COURSE" +
    CHAR(10)
),

    "~HP_PMH~",
    CHAR(10) + CHAR(10) +
    "PAST MEDICAL HISTORY" +
    CHAR(10)
),

    "~HP_PSH~",
    CHAR(10) + CHAR(10) +
    "PAST SURGICAL HISTORY" +
    CHAR(10)
),

    "~HP_ALLMED~",
    CHAR(10) + CHAR(10) +
    "ALLERGIES / MEDICATIONS" +
    CHAR(10)
),

    "~HP_ALLERGIES~",
    CHAR(10) + CHAR(10) +
    "ALLERGIES" +
    CHAR(10)
),

    "~HP_MEDS~",
    CHAR(10) + CHAR(10) +
    "MEDICATIONS ON ADMISSION" +
    CHAR(10)
),

    "~HP_FAMSOC~",
    CHAR(10) + CHAR(10) +
    "FAMILY / SOCIAL HISTORY" +
    CHAR(10)
),

    "~HP_ROS~",
    CHAR(10) + CHAR(10) +
    "REVIEW OF SYSTEMS" +
    CHAR(10)
),

    "~HP_PE~",
    CHAR(10) + CHAR(10) +
    "PHYSICAL EXAM" +
    CHAR(10)
),

    "~HP_VITALS~",
    CHAR(10) + CHAR(10) +
    "VITAL SIGNS" +
    CHAR(10)
),

    "~HP_DIAG~",
    CHAR(10) + CHAR(10) +
    "DIAGNOSTIC DATA" +
    CHAR(10)
),

    "~HP_LABS~",
    CHAR(10) + CHAR(10) +
    "LAB RESULTS" +
    CHAR(10)
),

    "~HP_IMAGING~",
    CHAR(10) + CHAR(10) +
    "IMAGING RESULTS" +
    CHAR(10)
),

    "~HP_PROBLEMS~",
    CHAR(10) + CHAR(10) +
    "ACTIVE HOSPITAL PROBLEMS" +
    CHAR(10)
),

    "~HP_AP~",
    CHAR(10) + CHAR(10) +
    "ASSESSMENT & PLAN" +
    CHAR(10)
),

    "~HP_CODE~",
    CHAR(10) + CHAR(10) +
    "CODE STATUS" +
    CHAR(10)
),

    "~HP_FACMED~",
    CHAR(10) + CHAR(10) +
    "FACILITY-ADMINISTERED MEDICATIONS" +
    CHAR(10)
),

    "~HP_OUTMED~",
    CHAR(10) + CHAR(10) +
    "CURRENT OUTPATIENT MEDICATIONS" +
    CHAR(10)
),

    "~HP_FAMHX~",
    CHAR(10) + CHAR(10) +
    "FAMILY HISTORY" +
    CHAR(10)
),

    "~HP_SOCHX~",
    CHAR(10) + CHAR(10) +
    "SOCIAL HISTORY" +
    CHAR(10)
),

    "Location:",
    CHAR(10) +
    "Location: "
),

    "Primary Care Provider:",
    CHAR(10) +
    "Primary Care Provider: "
),

    "Recent Vitals:",
    CHAR(10) +
    "Recent Vitals: "
)
