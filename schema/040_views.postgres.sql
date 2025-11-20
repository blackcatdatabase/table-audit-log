-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  audit_log_activity_daily
-- Daily audit activity split by change type
CREATE OR REPLACE VIEW vw_audit_activity_daily AS
SELECT
  date_trunc(''day'', changed_at) AS day,
  COUNT(*) AS total,
  COUNT(*) FILTER (WHERE change_type=''INSERT'') AS inserts,
  COUNT(*) FILTER (WHERE change_type=''UPDATE'') AS updates,
  COUNT(*) FILTER (WHERE change_type=''DELETE'') AS deletes
FROM audit_log
GROUP BY 1
ORDER BY day DESC;

-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  audit_log
-- Contract view for [audit_log]
-- Omits old_value/new_value JSON; adds ip_bin_hex helper.
CREATE OR REPLACE VIEW vw_audit_log AS
SELECT
  id,
  table_name,
  record_id,
  changed_by,
  change_type,
  changed_at,
  ip_bin AS ip_bin,
  UPPER(encode(ip_bin,'hex')) AS ip_bin_hex,
  user_agent,
  request_id
FROM audit_log;

