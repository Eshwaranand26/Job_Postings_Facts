-- Analysis Brief (Q2): Skills for Top Paying Data Analyst Jobs
-- Purpose: For the top 10 highest-paying 'Data Analyst' roles (location='Anywhere'), list the required skills and their types.
-- Output: All top job fields plus skill name and skill type for each matching job.
WITH top_jobs AS (
  SELECT
    jp.job_id,
    jp.job_title,
    c.name AS company_name,
    jp.job_location,
    jp.salary_year_avg,
    jp.job_posted_date::DATE AS posted_date
  FROM job_postings_fact jp
  LEFT JOIN company_dim c ON jp.company_id = c.company_id
  WHERE jp.job_title_short = 'Data Analyst'
    AND jp.salary_year_avg IS NOT NULL
    AND jp.job_location = 'Anywhere'
  ORDER BY jp.salary_year_avg DESC
  LIMIT 10
)
SELECT
  tj.*,
  sd.skills AS skills_required,
  sd.type AS skill_type
FROM top_jobs tj
INNER JOIN skills_job_dim sj ON tj.job_id = sj.job_id
INNER JOIN skills_dim sd ON sj.skill_id = sd.skill_id
ORDER BY tj.salary_year_avg DESC
 

-- Sample Output (JSON) — commented out
/*
[
{
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "r",
    "skill_type": "programming"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "azure",
    "skill_type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "databricks",
    "skill_type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "aws",
    "skill_type": "cloud"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "pandas",
    "skill_type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "pyspark",
    "skill_type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "jupyter",
    "skill_type": "libraries"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "excel",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "power bi",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "posted_date": "2023-06-18",
    "skills_required": "powerpoint",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "posted_date": "2023-12-05",
    "skills_required": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "posted_date": "2023-12-05",
    "skills_required": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "posted_date": "2023-12-05",
    "skills_required": "r",
    "skill_type": "programming"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "posted_date": "2023-12-05",
    "skills_required": "hadoop",
    "skill_type": "libraries"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "posted_date": "2023-12-05",
    "skills_required": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "posted_date": "2023-01-17",
    "skills_required": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "posted_date": "2023-01-17",
    "skills_required": "crystal",
    "skill_type": "programming"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "posted_date": "2023-01-17",
    "skills_required": "oracle",
    "skill_type": "cloud"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "posted_date": "2023-01-17",
    "skills_required": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "posted_date": "2023-01-17",
    "skills_required": "flow",
    "skill_type": "other"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "posted_date": "2023-08-09",
    "skills_required": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "posted_date": "2023-08-09",
    "skills_required": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "posted_date": "2023-08-09",
    "skills_required": "go",
    "skill_type": "programming"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "posted_date": "2023-08-09",
    "skills_required": "snowflake",
    "skill_type": "cloud"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "posted_date": "2023-08-09",
    "skills_required": "pandas",
    "skill_type": "libraries"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "posted_date": "2023-08-09",
    "skills_required": "numpy",
    "skill_type": "libraries"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "posted_date": "2023-08-09",
    "skills_required": "excel",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "posted_date": "2023-08-09",
    "skills_required": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "posted_date": "2023-08-09",
    "skills_required": "gitlab",
    "skill_type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "azure",
    "skill_type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "aws",
    "skill_type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "oracle",
    "skill_type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "snowflake",
    "skill_type": "cloud"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "power bi",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "sap",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "jenkins",
    "skill_type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "bitbucket",
    "skill_type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "atlassian",
    "skill_type": "other"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "jira",
    "skill_type": "async"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "posted_date": "2023-12-07",
    "skills_required": "confluence",
    "skill_type": "async"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "posted_date": "2023-01-05",
    "skills_required": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "posted_date": "2023-01-05",
    "skills_required": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "posted_date": "2023-01-05",
    "skills_required": "r",
    "skill_type": "programming"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "posted_date": "2023-01-05",
    "skills_required": "git",
    "skill_type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "posted_date": "2023-01-05",
    "skills_required": "bitbucket",
    "skill_type": "other"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "posted_date": "2023-01-05",
    "skills_required": "atlassian",
    "skill_type": "other"   
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "posted_date": "2023-01-05",
    "skills_required": "jira",
    "skill_type": "async"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "posted_date": "2023-01-05",
    "skills_required": "confluence",
    "skill_type": "async"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "posted_date": "2023-07-11",
    "skills_required": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "posted_date": "2023-07-11",
    "skills_required": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "posted_date": "2023-07-11",
    "skills_required": "go",
    "skill_type": "programming"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "posted_date": "2023-07-11",
    "skills_required": "snowflake",
    "skill_type": "cloud"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "posted_date": "2023-07-11",
    "skills_required": "pandas",
    "skill_type": "libraries"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "posted_date": "2023-07-11",
    "skills_required": "numpy",
    "skill_type": "libraries"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "posted_date": "2023-07-11",
    "skills_required": "excel",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "posted_date": "2023-07-11",
    "skills_required": "tableau",
    "skill_type": "analyst_tools"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "posted_date": "2023-07-11",
    "skills_required": "gitlab",
    "skill_type": "other"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "salary_year_avg": "184000.0",
    "posted_date": "2023-06-09",
    "skills_required": "sql",
    "skill_type": "programming"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "salary_year_avg": "184000.0",
    "posted_date": "2023-06-09",
    "skills_required": "python",
    "skill_type": "programming"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "salary_year_avg": "184000.0",
    "posted_date": "2023-06-09",
    "skills_required": "r",
    "skill_type": "programming"
  }
]
*/