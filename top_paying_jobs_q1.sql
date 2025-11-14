-- Analysis Brief (Q1): Top Paying 'Data Analyst' Roles
-- Purpose: Identify the top 10 highest-paying remote ('Anywhere') Data Analyst job postings and their employer details.
-- Output: job_id, job_title, company_name, job_location, salary_year_avg, posted_date — use to spot high-paying companies and roles.
SELECT
  job_id,
  job_title,
  company_dim.name AS company_name,
  job_location,
  salary_year_avg,
  job_posted_date::DATE AS posted_date

FROM
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
  job_title_short='Data Analyst' AND salary_year_avg IS NOT NULL AND job_location ='Anywhere'
ORDER BY
  salary_year_avg DESC
LIMIT 10;
-- Sample Output (JSON) — commented out
/*
[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "company_name": "Mantys",
    "job_location": "Anywhere",
    "salary_year_avg": "650000.0",
    "posted_date": "2023-02-20"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "company_name": "Meta",
    "job_location": "Anywhere",
    "salary_year_avg": "336500.0",
    "posted_date": "2023-08-23"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "posted_date": "2023-12-05"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "posted_date": "2023-01-17"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "posted_date": "2023-08-09"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "posted_date": "2023-01-05"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "posted_date": "2023-07-11"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "salary_year_avg": "184000.0",
    "posted_date": "2023-06-09"
  }
]
*/