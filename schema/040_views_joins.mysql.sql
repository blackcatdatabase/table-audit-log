-- Auto-generated from joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
-- engine: mysql
-- view:   audit_activity_daily

CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_audit_activity_daily AS
SELECT
  DATE(changed_at) AS day,
  COUNT(*) AS total,
  SUM(CASE WHEN change_type = 'INSERT' THEN 1 ELSE 0 END) AS inserts,
  SUM(CASE WHEN change_type = 'UPDATE' THEN 1 ELSE 0 END) AS updates,
  SUM(CASE WHEN change_type = 'DELETE' THEN 1 ELSE 0 END) AS deletes
FROM audit_log
GROUP BY day
ORDER BY day DESC;
