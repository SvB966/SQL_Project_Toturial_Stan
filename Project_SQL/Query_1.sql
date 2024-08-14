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
]/*