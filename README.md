
# Business Analyst Job Market Analysis

## Overview

This project delivers detailed insights into the Business Analyst job market, highlighting top-paying positions, in-demand skills, and the most lucrative skills. We utilize SQL to identify key market trends.

## Objective

The goal is to guide professionals in identifying skills that lead to higher-paying Business Analyst roles. The analysis covers job titles, salaries, locations, and required skills.

## Research Questions

1. What are the highest-paying Business Analyst positions?
2. Which skills are essential for these top-paying roles?
3. What are the most in-demand skills for Business Analysts?
4. Which skills are linked to higher salaries?
5. What are the most valuable skills to learn?

## Tools Used

- **SQL**: For extracting key insights from the database.
- **PostgreSQL**: Database management for processing job posting data.
- **Visual Studio Code**: For database management and SQL execution.
- **Git & GitHub**: For version control and collaboration on SQL scripts and analyses.

## Analysis and Results

### 1. Top-Paid Business Analyst Positions

We identified the top 10 highest-paid positions, focusing on average salaries and remote roles, revealing the most lucrative opportunities.


```sql
SELECT 
    job_id, 
    job_title, 
    job_location, 
    job_schedule_type, 
    salary_year_avg, 
    job_posted_date
FROM 
    job_postings_fact
WHERE 
    job_title = 'Business Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```

**Key Insights:**

1. **Top Locations for Business Analyst Positions:**
   - Santa Clara, Visalia, and Newport Beach, CA are consistently among the highest-paying locations for Business Analyst roles, making California a prime region for these positions.

2. **Average Salary Levels:**
   - Business Analysts in top-paying areas earn between $95,000 and $107,590 annually, with some exceeding $100,000, highlighting significant compensation, particularly based on location and employment type.

3. **Employment Type:**
   - Full-time positions generally offer higher pay than contractual roles, though there are exceptions, such as a contractor position in New York.

### 2. Skills for Top-Paid Positions

By matching job roles with required skills, we determined which skills are most valued by employers for high-paying roles.
```sql
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
    skills_dim.skills
FROM
    top_paying_jobs
INNER JOIN
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC;

```


![Results 2](https://github.com/user-attachments/assets/6d08982e-4046-44a3-8c10-791c70e96d62)

1. **Key Insights:**
   - **Diverse Skill Set:** High-paying Business Analyst roles demand a broad range of skills, particularly in software and tools like SharePoint, PowerPoint, Visio, Flow, and Confluence.
   - **Collaboration Focus:** Many required skills revolve around collaboration and project management tools, highlighting the crucial role of teamwork in Business Analyst positions.
   - **Microsoft Office Proficiency:** Proficiency in Microsoft Office Suite is frequently emphasized, indicating its importance in securing well-compensated roles in this field.

2. **Contextual Insights:**
   - **Collaboration is Critical:** The emphasis on tools like SharePoint and Confluence reflects the necessity for Business Analysts to effectively collaborate and share information across teams.
   - **Data Presentation Skills:** High demand for tools like PowerPoint and Visio suggests that presenting and visualizing complex data is vital for conveying insights and recommendations to stakeholders.

**Additional Observations:**
   - **Standardized Skill Profile:** The consistent mention of specific tools indicates a standardized skill set for top-tier Business Analyst positions.
   - **Tool-Specific Importance:** Frequent references to SharePoint, PowerPoint, and Visio underscore their significance in the role.

### 3. Most In-Demand Skills

This analysis pinpointed the skills most frequently requested in job postings, identifying the most crucial skills in the market.

```sql
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

```

![Results 3](https://github.com/user-attachments/assets/a51a40de-45a7-4f51-9bb4-e6ac6d6e6336)

1. **Excel (1,031 mentions):** The most sought-after skill, Excel is essential for data analysis, reporting, budgeting, and financial modeling.
   
2. **SQL (977 mentions):** Critical for data manipulation and managing large datasets, SQL drives data-informed decision-making.

3. **Tableau (497 mentions) and Power BI (465 mentions):** These tools are key for translating complex data into actionable visual insights, making information accessible to stakeholders.

4. **Python (331 mentions):** Increasingly important for advanced data analysis and automation, reflecting the growing need for sophisticated analytical capabilities.

### 4. Skills Linked to Salary

We assessed average salaries by skill, highlighting the most financially rewarding skills.

```sql
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

```

![Results 4](https://github.com/user-attachments/assets/f7bc256a-d111-4e3b-9d62-5db55905410a)

1. **Top Earning Skills for Business Analysts:**
   - **High-Paying Skills:** Shell, MySQL, Unix, Phoenix, and SQL Server are among the highest-paying skills for Business Analysts, with an average salary of $107,590.94. These technical skills, particularly in databases and operating systems, are highly valued.
   - **Technical Proficiency:** Expertise in Shell scripting, Unix systems, and databases like MySQL and SQL Server significantly boosts earning potential. These skills are crucial for managing automated processes, handling large datasets, and optimizing data-driven decision-making.
   - **Specialized Knowledge:** Mastery of niche technologies, such as Phoenix, also contributes to higher salaries, especially in organizations that rely on specific frameworks.

### Data Visualization Summary:
- **Top Skills:** The highest average salaries for Business Analysts are associated with proficiency in Shell, MySQL, Unix, Phoenix, and SQL Server.
- **Strategic Focus:** Developing technical skills in databases and operating systems is a key strategy for professionals aiming to increase their earnings.


### 5. Optimal Skills to Learn

By merging demand and salary data, we identified skills that are both highly sought after and well-compensated, offering strategic guidance for skill development.

```sql
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

```

![Results 5](https://github.com/user-attachments/assets/6b133c77-2aea-4728-bfab-12b20151323e)

1. **In-Demand Skills and Corresponding Salaries:**
   - **Excel and SQL:** These foundational tools lead in demand, with 1,031 and 977 mentions, respectively. However, their average salaries are slightly lower, at $73,766 and $75,557.
   - **Tableau and Power BI:** These data visualization tools not only have high demand but also command higher salaries, averaging $83,938 for Tableau and $86,769 for Power BI. This indicates the significant market value of expertise in data visualization.
   - **Python:** Mentioned 331 times, Python is a versatile programming language with a competitive average salary of $76,363, highlighting its growing importance in data analysis and automation.


---

