-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  audit_log

CREATE INDEX IF NOT EXISTS idx_audit_table_record ON audit_log (table_name, record_id, changed_at);

CREATE INDEX IF NOT EXISTS idx_audit_changed_at   ON audit_log (changed_at);

CREATE INDEX IF NOT EXISTS idx_audit_request_id   ON audit_log (request_id);
