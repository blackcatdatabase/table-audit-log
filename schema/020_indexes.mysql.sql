-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  audit_log

CREATE INDEX idx_audit_table_record ON audit_log (table_name, record_id, changed_at);

CREATE INDEX idx_audit_changed_at   ON audit_log (changed_at);

CREATE INDEX idx_audit_request_id   ON audit_log (request_id);
