-- Auto-generated from schema-map-mysql.yaml (map@sha1:09DF9CA612D1573E058190CC207FA257C05AEC1F)
-- engine: mysql
-- table:  audit_log

CREATE INDEX idx_audit_table_record ON audit_log (table_name, record_id, changed_at);

CREATE INDEX idx_audit_changed_at   ON audit_log (changed_at);

CREATE INDEX idx_audit_request_id   ON audit_log (request_id);
