-- Auto-generated from schema-map-postgres.yaml (map@74ce4f4)
-- engine: postgres
-- table:  audit_log

CREATE INDEX IF NOT EXISTS idx_audit_table_record ON audit_log (table_name, record_id, changed_at);

CREATE INDEX IF NOT EXISTS idx_audit_changed_at   ON audit_log (changed_at);

CREATE INDEX IF NOT EXISTS idx_audit_request_id   ON audit_log (request_id);
