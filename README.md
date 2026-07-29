# Employee Benefits Claims & Cost Analysis
**Business question**: Which employee segments and employer groups are driving healthcare cost, and what should be flagged at renewal to manage risk while protecting coverage?

An analysis of employer-sponsored health claims, built with Python for cleaning and enrichment, SQL for investigating cost drivers, and Power BI for reporting.

📊 [Watch the 90-second dashboard walkthrough](YOUR_VIDEO_URL_HERE)
📄 [View my resume](YOUR_RESUME_URL_HERE)

---

## Table of Contents
* [Overview](#overview)
* [Key Findings](#key-findings)
* [Dashboard](#dashboard)
* [Tech Stack](#tech-stack)
* [Repo Structure](#repo-structure)
* [Methodology](#methodology)
* [Recommendation](#recommendation)
* [What I'd Do With More Time/Data](#what-id-do-with-more-timedata)

---

## Overview
Public, employer-level benefits data doesn't exist for privacy reasons, so I took a real health insurance claims dataset (4,500 claims from Kaggle), scoped it to the employed population (1,188 claims), and layered on realistic employer-group, plan-tier, and dependent-status fields. 

From there, I investigated cost drivers in SQL and built the Power BI dashboard on top, matching the workflow used on the job.

---

## Key Findings
* **34% cost gap** between the highest and lowest-cost employer groups (Employer_15 at $5,552/employee vs. Employer_07 at $4,154/employee). This holds across every plan tier, pointing to underlying population risk rather than plan design.
* **Top 20% of employees drive 36% of total healthcare spend**, highlighting the need for stop-loss thresholds and high-cost case management.
* **Costs are distributed evenly across claim types** (Inpatient, Outpatient, Routine, and Emergency each sit at 24-26% of spend), shifting focus to employer groups and individual claimants.

---

## Dashboard
Interactive filtering by Employer Group and Plan Tier. For the live interactive version, see the walkthrough video or open `powerbi/dashboard.pbix` in Power BI Desktop.

---

## Tech Stack
* **Python (pandas):** Cleaning and feature engineering
* **SQL (SQLite):** KPI queries and cost concentration analysis
* **Power BI:** Interactive dashboard and DAX measures
* **Excel:** Number validation and renewal projections

---

## Repo Structure
```text
employee-benefits-claims-analysis/
├── README.md
├── data/
│   └── clean_enriched_claims.csv
├── notebooks/
│   ├── 01_clean_enrich_claims.ipynb
│   └── 02_sql_kpi_analysis.ipynb
├── sql/
│   └── kpi_queries.sql
├── excel/
│   └── renewal_projection.xlsx
└── powerbi/
    ├── dashboard.pbix
    └── dashboard_screenshot.png
```
---
## Methodology
* **Clean & Scope:** Filtered to `PatientEmploymentStatus == 'Employed'` relevant to employer-sponsored benefits.
* **Enrich:** Simulated 18 employer groups, three plan tiers, and marital-status-tied dependents.
* **Investigate:** Analyzed group costs, claim type frequency/severity, and employee decile concentration in SQL.
* **Report:** Built interactive DAX KPIs and charts in Power BI.

---

## Recommendation
Based on the finding that Employer_15 costs 34% more per employee than Employer_07 across all plan tiers, the primary driver is underlying population risk rather than plan design. 

**Action items for renewal:**
* **Underwriting Review:** Do not alter plan tiers or increase cost-sharing for Employer_15 as a fix, since Bronze, Silver, and Gold tiers all suffer the same inflation. Instead, review large-claimant activity and chronic condition prevalence.
* **Stop-Loss and Case Management:** Given that the top 20% of employees drive 36% of spend, implement targeted nurse case management for high-risk claimants and evaluate specific stop-loss deductible thresholds to protect the plan from catastrophic volatility.
* **Wellness & Prevention:** Target preventative care initiatives specifically toward higher-cost groups to mitigate avoidable emergency and inpatient claims.

---

## What could be improved:
* Incorporate actual premium data to calculate a true loss ratio.
* Add historical years of data for multi-year renewal trends.
* Build predictive models to flag high-cost claimants early.
* Add industry/demographic data to explain the Employer_15 vs. Employer_07 cost gap.

---

## Contact
Anand [Last Name]  
[email] · [LinkedIn]
