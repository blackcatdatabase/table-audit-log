-- Auto-generated from schema-views-mysql.yaml (map@94ebe6c)
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
