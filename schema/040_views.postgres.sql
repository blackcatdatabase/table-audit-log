-- Auto-generated from schema-views-postgres.yaml (map@sha1:A35B3CB52780A1043442511D947A51BA2C27622C)
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
