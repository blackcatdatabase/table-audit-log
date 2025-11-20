-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  audit_log_activity_daily
-- Daily audit activity split by change type
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_audit_activity_daily AS
SELECT
  DATE(changed_at) AS day,
  COUNT(*) AS total,
  SUM(CASE WHEN change_type = 'INSERT' THEN 1 ELSE 0 END) AS inserts,
  SUM(CASE WHEN change_type = 'UPDATE' THEN 1 ELSE 0 END) AS updates,
  SUM(CASE WHEN change_type = 'DELETE' THEN 1 ELSE 0 END) AS deletes
FROM audit_log
GROUP BY day
ORDER BY day DESC;

-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  audit_log
-- Contract view for [audit_log]
-- Omits old_value/new_value JSON; adds ip_pretty from ip_bin.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_audit_log AS
SELECT
  id,
  table_name,
  record_id,
  changed_by,
  change_type,
  changed_at,
  ip_bin,
  CAST(LPAD(HEX(ip_bin), 32, '0') AS CHAR(32)) AS ip_bin_hex,
  CAST(INET6_NTOA(ip_bin) AS CHAR(39)) AS ip_pretty,
  user_agent,
  request_id
FROM audit_log;

