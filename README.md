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
