-- Auto-generated from schema-map-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  audit_log
CREATE INDEX idx_audit_table_record ON audit_log (table_name, record_id, changed_at);

CREATE INDEX idx_audit_changed_at   ON audit_log (changed_at);

CREATE INDEX idx_audit_request_id   ON audit_log (request_id);
