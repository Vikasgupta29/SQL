SELECT COUNT(*)
FROM (SELECT COUNT(*)
      FROM job_listings
      GROUP BY company_id, title, description
      HAVING count(*)>1) T
