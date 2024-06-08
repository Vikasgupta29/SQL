SELECT COUNT(*) "policy_holder_count"
FROM (
      SELECT COUNT(case_id)
      FROM callers
      GROUP BY policy_holder_id
      HAVING COUNT(case_id)>2) T
