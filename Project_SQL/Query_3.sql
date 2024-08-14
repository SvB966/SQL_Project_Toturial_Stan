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
ORDER BY
    demand_count DESC
LIMIT 5;

/* QUERY RESULTS:
[
  {
    "skill": "excel",
    "demand_count": "1031"
  },
  {
    "skill": "sql",
    "demand_count": "977"
  },
  {
    "skill": "tableau",
    "demand_count": "497"
  },
  {
    "skill": "power bi",
    "demand_count": "465"
  },
  {
    "skill": "python",
    "demand_count": "331"
  }

/*