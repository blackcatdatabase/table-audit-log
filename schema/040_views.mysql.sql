-- Auto-generated from schema-views-mysql.psd1 (map@38d5403)
-- engine: mysql
-- table:  audit_log
-- Contract view for [audit_log]
-- Omits old_value/new_value JSON; adds ip_pretty from ip_bin.
CREATE OR REPLACE SQL SECURITY INVOKER VIEW vw_audit_log AS
SELECT
  id,
  table_name,
  record_id,
  changed_by,
  change_type,
  changed_at,
  ip_bin,
  INET6_NTOA(ip_bin) AS ip_pretty,
  user_agent,
  request_id
FROM audit_log;
