WITH skills_demand AS (
    SELECT
        skills_dim.skills AS skill,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM
        job_postings_fact
    INNER JOIN
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title = 'Business Analyst'
    GROUP BY
        skills_dim.skills
),
average_salary AS (
    SELECT
        skills_dim.skills AS skill,
        ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title = 'Business Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skills
)
SELECT
    skills_demand.skill,
    skills_demand.demand_count,
    average_salary.avg_salary
FROM
    skills_demand
INNER JOIN
    average_salary ON skills_demand.skill = average_salary.skill
ORDER BY
    demand_count DESC, avg_salary DESC
LIMIT 10;


/* QUERY RESULTS:
[
  {
    "skill": "excel",
    "demand_count": "1031",
    "avg_salary": "73765.61"
  },
  {
    "skill": "sql",
    "demand_count": "977",
    "avg_salary": "75556.60"
  },
  {
    "skill": "tableau",
    "demand_count": "497",
    "avg_salary": "83938.10"
  },
  {
    "skill": "power bi",
    "demand_count": "465",
    "avg_salary": "86768.71"
  },
  {
    "skill": "python",
    "demand_count": "331",
    "avg_salary": "76363.33"
  },
  {
    "skill": "powerpoint",
    "demand_count": "302",
    "avg_salary": "69416.67"
  },
  {
    "skill": "word",
    "demand_count": "236",
    "avg_salary": "63000.00"
  },
  {
    "skill": "r",
    "demand_count": "206",
    "avg_salary": "80550.00"
  },
  {
    "skill": "jira",
    "demand_count": "195",
    "avg_salary": "54000.00"
  },
  {
    "skill": "flow",
    "demand_count": "170",
    "avg_salary": "83979.45"
  }
]
/*
