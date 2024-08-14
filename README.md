
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
[Uploading QuSELECT 
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

/* QUERY RESULTS:
[
  {
    "job_id": 1399498,
    "job_title": "Business Analyst",
    "job_location": "Santa Clara, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "107590.9375",
    "job_posted_date": "2023-12-05 18:00:42"
  },
  {
    "job_id": 175409,
    "job_title": "Business Analyst",
    "job_location": "Visalia, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100000.0",
    "job_posted_date": "2023-06-07 18:00:49"
  },
  {
    "job_id": 1203821,
    "job_title": "Business Analyst",
    "job_location": "Newport Beach, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "97500.0",
    "job_posted_date": "2023-10-06 17:00:50"
  },
  {
    "job_id": 897636,
    "job_title": "Business Analyst",
    "job_location": "New York, NY",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "97281.0",
    "job_posted_date": "2023-08-20 17:00:02"
  },
  {
    "job_id": 602485,
    "job_title": "Business Analyst",
    "job_location": "New York",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "95000.0",
    "job_posted_date": "2023-09-27 21:00:20"
  },
  {
    "job_id": 203007,
    "job_title": "Business Analyst",
    "job_location": "Atlanta, GA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "95000.0",
    "job_posted_date": "2023-11-28 15:41:22"
  },
  {
    "job_id": 1224185,
    "job_title": "Business Analyst",
    "job_location": "St. Louis, MO",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "92036.234375",
    "job_posted_date": "2023-10-26 15:01:47"
  },
  {
    "job_id": 184896,
    "job_title": "Business Analyst",
    "job_location": "Doral, FL",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "91100.0",
    "job_posted_date": "2023-11-20 21:01:50"
  },
  {
    "job_id": 1094647,
    "job_title": "Business Analyst",
    "job_location": "Torrington, CT",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90000.0",
    "job_posted_date": "2023-08-04 14:00:39"
  },
  {
    "job_id": 488025,
    "job_title": "Business Analyst",
    "job_location": "Oakland, CA",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "90000.0",
    "job_posted_date": "2023-02-23 09:01:18"
  }
]/*ery_1.sql…]()

**Key Insights:**

1. **Top Locations for Business Analyst Positions:**
   - Santa Clara, Visalia, and Newport Beach, CA are consistently among the highest-paying locations for Business Analyst roles, making California a prime region for these positions.

2. **Average Salary Levels:**
   - Business Analysts in top-paying areas earn between $95,000 and $107,590 annually, with some exceeding $100,000, highlighting significant compensation, particularly based on location and employment type.

3. **Employment Type:**
   - Full-time positions generally offer higher pay than contractual roles, though there are exceptions, such as a contractor position in New York.


### 2. Skills for Top-Paid Positions

By matching job roles with required skills, we determined which skills are most valued by employers for high-paying roles.

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
![Results 3](https://github.com/user-attachments/assets/a51a40de-45a7-4f51-9bb4-e6ac6d6e6336)

1. **Excel (1,031 mentions):** The most sought-after skill, Excel is essential for data analysis, reporting, budgeting, and financial modeling.
   
2. **SQL (977 mentions):** Critical for data manipulation and managing large datasets, SQL drives data-informed decision-making.

3. **Tableau (497 mentions) and Power BI (465 mentions):** These tools are key for translating complex data into actionable visual insights, making information accessible to stakeholders.

4. **Python (331 mentions):** Increasingly important for advanced data analysis and automation, reflecting the growing need for sophisticated analytical capabilities.

### 4. Skills Linked to Salary

We assessed average salaries by skill, highlighting the most financially rewarding skills.
![Results 4](https://github.com/user-attachments/assets/f7bc256a-d111-4e3b-9d62-5db55905410a)



### 5. Optimal Skills to Learn

By merging demand and salary data, we identified skills that are both highly sought after and well-compensated, offering strategic guidance for skill development.

![Results 5](https://github.com/user-attachments/assets/6b133c77-2aea-4728-bfab-12b20151323e)


---

