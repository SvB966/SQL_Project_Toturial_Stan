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
ORDER BY
    avg_salary DESC;

/* QUERY RESULTS:
[
  {
    "skill": "shell",
    "avg_salary": "107590.94"
  },
  {
    "skill": "mysql",
    "avg_salary": "107590.94"
  },
  {
    "skill": "unix",
    "avg_salary": "107590.94"
  },
  {
    "skill": "phoenix",
    "avg_salary": "107590.94"
  },
  {
    "skill": "sql server",
    "avg_salary": "107590.94"
  },
  {
    "skill": "aws",
    "avg_salary": "99813.59"
  },
  {
    "skill": "ssrs",
    "avg_salary": "95000.00"
  },
  {
    "skill": "visio",
    "avg_salary": "93260.33"
  },
  {
    "skill": "power bi",
    "avg_salary": "86768.71"
  },
  {
    "skill": "crystal",
    "avg_salary": "85000.00"
  },
  {
    "skill": "flow",
    "avg_salary": "83979.45"
  },
  {
    "skill": "tableau",
    "avg_salary": "83938.10"
  },
  {
    "skill": "oracle",
    "avg_salary": "82030.31"
  },
  {
    "skill": "r",
    "avg_salary": "80550.00"
  },
  {
    "skill": "vba",
    "avg_salary": "77866.67"
  },
  {
    "skill": "python",
    "avg_salary": "76363.33"
  },
  {
    "skill": "sql",
    "avg_salary": "75556.60"
  },
  {
    "skill": "zoom",
    "avg_salary": "75000.00"
  },
  {
    "skill": "slack",
    "avg_salary": "75000.00"
  },
  {
    "skill": "spreadsheet",
    "avg_salary": "74500.00"
  },
  {
    "skill": "excel",
    "avg_salary": "73765.61"
  },
  {
    "skill": "confluence",
    "avg_salary": "69500.00"
  },
  {
    "skill": "powerpoint",
    "avg_salary": "69416.67"
  },
  {
    "skill": "sap",
    "avg_salary": "68000.00"
  },
  {
    "skill": "outlook",
    "avg_salary": "67500.00"
  },
  {
    "skill": "sharepoint",
    "avg_salary": "63750.00"
  },
  {
    "skill": "word",
    "avg_salary": "63000.00"
  },
  {
    "skill": "sheets",
    "avg_salary": "62500.00"
  },
  {
    "skill": "smartsheet",
    "avg_salary": "62500.00"
  },
  {
    "skill": "jira",
    "avg_salary": "54000.00"
  }
]

/*