/*KPI 1: Calculate the total cost, headcount, and average cost per employee 
    for each employer group (fair per-capita comparison)*/
SELECT
    EmployerGroup,
    COUNT(DISTINCT PatientID) AS employees_covered,
    COUNT(*) AS total_claims,
    ROUND(SUM(ClaimAmount), 2) AS total_cost,
    ROUND(SUM(ClaimAmount) * 1.0 / COUNT(DISTINCT PatientID), 2) AS cost_per_employee
FROM claims
GROUP BY EmployerGroup
ORDER BY cost_per_employee DESC


/*KPI 2: Frequency vs. severity by claim type :
(this tells us why costs are high ,lots of small claims, or a few huge ones)*/
SELECT
    ClaimType,
    COUNT(*) AS claim_count,
    ROUND(AVG(ClaimAmount), 2) AS avg_claim_amount,
    ROUND(SUM(ClaimAmount), 2) AS total_cost,
    ROUND(SUM(ClaimAmount) * 100.0 / (SELECT SUM(ClaimAmount) FROM claims), 1) AS pct_of_total_cost
FROM claims
GROUP BY ClaimType
ORDER BY total_cost DESC


/*KPI 3: High-cost claimant concentration*/
WITH patient_totals AS (
    SELECT
        PatientID,
        SUM(ClaimAmount) AS patient_total_cost
    FROM claims
    GROUP BY PatientID
),
ranked AS (
    SELECT
        *,
        NTILE(10) OVER (ORDER BY patient_total_cost DESC) AS decile
    FROM patient_totals
)
SELECT
    decile,
    COUNT(*) AS num_patients,
    ROUND(SUM(patient_total_cost), 2) AS decile_total_cost,
    ROUND(SUM(patient_total_cost) * 100.0 / (SELECT SUM(patient_total_cost) FROM patient_totals), 1) AS pct_of_total_cost
FROM ranked
GROUP BY decile
ORDER BY decile


/*
Checking the  cost gap between the highest-cost 
group (Employer_15) and lowest-cost group (Employer_07) by 
comparing their plan tier mix and average claim amounts.
*/

SELECT
    EmployerGroup,
    PlanTier,
    COUNT(*) AS claims,
    ROUND(AVG(ClaimAmount), 2) AS avg_claim_amount
FROM claims
WHERE EmployerGroup IN ('Employer_15', 'Employer_07')
GROUP BY EmployerGroup, PlanTier
ORDER BY EmployerGroup, PlanTier
