# Employee Benefits Claims & Cost Analysis
**Business question**: Which employee segments and employer groups are driving healthcare cost, and what should be flagged at renewal to manage risk while protecting coverage?

An analysis of employer-sponsored health claims, built with Python for cleaning and enrichment, SQL for investigating cost drivers, and Power BI for reporting.

📊 [Watch the 90-second dashboard walkthrough](https://youtu.be/9Fm_C5hL25s)
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
* [What could be improved](#What-could-be-improved)

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

<img width="2306" height="1328" alt="Screenshot 2026-07-28 055036" src="https://github.com/user-attachments/assets/c8f91273-2ee3-4d6a-8afd-f981d60bff6d" />


---

## Tech Stack
* **Python (pandas):** Cleaning and feature engineering
* **SQL (SQLite):** KPI queries and cost concentration analysis
* **Power BI:** Interactive dashboard and DAX measures
* **Excel:** (pivot table, XLOOKUP) to cross-check the Power BI numbers and sketch a basic renewal cost scenario

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
│   └── cost_validation_and_renewal_scenario.xlsx
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
* **Cross-check in Excel:** rebuilt the cost per employer-group numbers in a pivot table to confirm they matched Power BI,then used XLOOKUP to pull those
    numbers into a small scenario table showing what Employer_15 and Employer_07's cost would look like under a flat 5%, 10%, or 15% renewal increase.

---

## Recommendation
Employer_15 is paying 34% more per employee than Employer_07, and that gap doesn't go away when you look at any single plan tier on its own. So the fix isn't to change what Employer_15's plan covers, since the data shows that wouldn't actually solve the problem.
* Look into why Employer_15's employees cost more in the first place, before deciding on anything. That's an underwriting question (things like age mix, health risk, or job type), not something this dataset alone can answer.
* Pay attention to the top 20% of employees, since they're driving over a third of total cost. Even a small group of high-cost claimants can swing renewal pricing, so this is worth tracking on its own regardless of which employer group they belong to.
  
---

## What could be improved:
* Incorporate actual premium data to calculate a true loss ratio.
* Add historical years of data for multi-year renewal trends.
* Build predictive models to flag high-cost claimants early.
* Add industry/demographic data to explain the Employer_15 vs. Employer_07 cost gap.

---

## Contact
[anandjp2026@gmail.com] · [www.linkedin.com/in/anandjp-05-ens]
