-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  audit_log

CREATE INDEX IF NOT EXISTS idx_audit_table_record ON audit_log (table_name, record_id, changed_at);

CREATE INDEX IF NOT EXISTS idx_audit_changed_at   ON audit_log (changed_at);

CREATE INDEX IF NOT EXISTS idx_audit_request_id   ON audit_log (request_id);
