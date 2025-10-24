-- Auto-generated from schema-views-mysql.psd1 (map@mtime:2025-10-24T09:19:46Z)
-- engine: mysql
-- table:  audit_log
-- Contract view for [audit_log]
-- Omits old_value/new_value JSON to reduce payload and potential leakage.
CREATE OR REPLACE VIEW vw_audit_log AS
SELECT
  id,
  table_name,
  record_id,
  changed_by,
  change_type,
  changed_at,
  ip_bin,
  user_agent,
  request_id
FROM audit_log;
