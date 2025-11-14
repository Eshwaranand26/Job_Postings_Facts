-- Analysis Brief (Q5): Skill demand and average salary for remote Data Analyst roles
-- Purpose: Compute demand (count) and average salary per skill for 'Data Analyst' roles (remote), and list top skills.
-- Output: skills, skill_id, avg_salary (rounded), demand_count ordered by demand then avg_salary.
WITH skills_demand AS (
  SELECT
    sd.skill_id,
    sd.skills,
    COUNT(*) AS demand_count
  FROM job_postings_fact jp
  JOIN skills_job_dim sj ON jp.job_id = sj.job_id
  JOIN skills_dim sd ON sj.skill_id = sd.skill_id
  WHERE jp.job_title_short = 'Data Analyst'
    AND jp.job_work_from_home = TRUE
    AND jp.salary_year_avg IS NOT NULL
  GROUP BY sd.skill_id, sd.skills
),
averaged_salary AS (
  SELECT
    sd.skill_id,
    sd.skills,
    ROUND(AVG(jp.salary_year_avg), 0) AS avg_salary
  FROM job_postings_fact jp
  JOIN skills_job_dim sj ON jp.job_id = sj.job_id
  JOIN skills_dim sd ON sj.skill_id = sd.skill_id
  WHERE jp.job_title_short = 'Data Analyst'
    AND jp.salary_year_avg IS NOT NULL
  GROUP BY sd.skill_id, sd.skills
)
SELECT
  sd.skills,
  sd.skill_id,
  a.avg_salary,
  sd.demand_count
FROM skills_demand sd
JOIN averaged_salary a ON sd.skill_id = a.skill_id
ORDER BY sd.demand_count DESC, a.avg_salary DESC
LIMIT 25;

-- Sample Output (JSON) — commented out
/*
[
  {
    "skills": "sql",
    "skill_id": 0,
    "avg_salary": "96435",
    "demand_count": "398"
  },
  {
    "skills": "excel",
    "skill_id": 181,
    "avg_salary": "86419",
    "demand_count": "256"
  },
  {
    "skills": "python",
    "skill_id": 1,
    "avg_salary": "101512",
    "demand_count": "236"
  },
  {
    "skills": "tableau",
    "skill_id": 182,
    "avg_salary": "97978",
    "demand_count": "230"
  },
  {
    "skills": "r",
    "skill_id": 5,
    "avg_salary": "98708",
    "demand_count": "148"
  },
  { 
    "skills": "power bi",
    "skill_id": 183,
    "avg_salary": "92324",
    "demand_count": "110"
  },
  {
    "skills": "sas",
    "skill_id": 186,
    "avg_salary": "93707",
    "demand_count": "63"
  },
  {
    "skills": "sas",
    "skill_id": 7,
    "avg_salary": "93707",
    "demand_count": "63"
  },
  {
    "skills": "powerpoint",
    "skill_id": 196,
    "avg_salary": "88316",
    "demand_count": "58"
  },
  {
    "skills": "looker",
    "skill_id": 185,
    "avg_salary": "103855",
    "demand_count": "49"
  },
  {
    "skills": "word",
    "skill_id": 188,
    "avg_salary": "82941",
    "demand_count": "48"
  },
  {
    "skills": "snowflake",
    "skill_id": 80,
    "avg_salary": "111578",
    "demand_count": "37"
  },
  {
    "skills": "oracle",
    "skill_id": 79,
    "avg_salary": "100964",
    "demand_count": "37"
  },
  {
    "skills": "sql server",
    "skill_id": 61,
    "avg_salary": "96191",
    "demand_count": "35"
  },
  {
    "skills": "azure",
    "skill_id": 74,
    "avg_salary": "105400",
    "demand_count": "34"
  },
  {
    "skills": "aws",
    "skill_id": 76,
    "avg_salary": "106440",
    "demand_count": "32"
  },
  {
    "skills": "sheets",
    "skill_id": 192,
    "avg_salary": "84130",
    "demand_count": "32"
  },
  {
    "skills": "flow",
    "skill_id": 215,
    "avg_salary": "98020",
    "demand_count": "28"
  },
  {
    "skills": "go",
    "skill_id": 8,
    "avg_salary": "97267",
    "demand_count": "27"
  },
  {
    "skills": "vba",
    "skill_id": 22,
    "avg_salary": "93845",
    "demand_count": "24"
  },
  {
    "skills": "spss",
    "skill_id": 199,
    "avg_salary": "85293",
    "demand_count": "24"
  },
  {
    "skills": "hadoop",
    "skill_id": 97,
    "avg_salary": "110888",
    "demand_count": "22"
  },
  {
    "skills": "jira",
    "skill_id": 233,
    "avg_salary": "107931",
    "demand_count": "20"
  },
  {
    "skills": "javascript",
    "skill_id": 9,
    "avg_salary": "91805",
    "demand_count": "20"
  },
  {
    "skills": "sharepoint",
    "skill_id": 195,
    "avg_salary": "89027",
    "demand_count": "18"
  }
]