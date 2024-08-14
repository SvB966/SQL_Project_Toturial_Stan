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
