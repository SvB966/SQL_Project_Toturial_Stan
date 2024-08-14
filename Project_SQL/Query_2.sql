WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
    WHERE
        job_title = 'Business Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT
    top_paying_jobs.job_id,
    top_paying_jobs.job_title,
    top_paying_jobs.salary_year_avg,
    skills_dim.skills  -- Aangepaste kolomnaam
FROM
    top_paying_jobs
INNER JOIN
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC;

/* QUERY RESULTS:
[
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "skills": "sharepoint"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "skills": "visio"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "skills": "flow"
  },
  {
    "job_id": 1604546,
    "job_title": "Business Analyst",
    "salary_year_avg": "85000.0",
    "skills": "confluence"
  },
  {
    "job_id": 1348933,
    "job_title": "Business Analyst",
    "salary_year_avg": "62500.0",
    "skills": "sql"
  },
  {
    "job_id": 1348933,
    "job_title": "Business Analyst",
    "salary_year_avg": "62500.0",
    "skills": "excel"
  },
  {
    "job_id": 1348933,
    "job_title": "Business Analyst",
    "salary_year_avg": "62500.0",
    "skills": "sheets"
  },
  {
    "job_id": 1348933,
    "job_title": "Business Analyst",
    "salary_year_avg": "62500.0",
    "skills": "smartsheet"
  }
]/*