-- Auto-generated from joins-mysql.psd1 (map@mtime:2025-11-27T17:49:37Z)
-- engine: mysql
-- view:   audit_log_activity_daily
-- Daily audit activity split by change type
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
