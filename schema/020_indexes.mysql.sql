-- Auto-generated from schema-map-mysql.yaml (map@sha1:B9D3BE28A74392B9B389FDAFB493BD80FA1F6FA4)
-- engine: mysql
-- table:  audit_log

CREATE INDEX idx_audit_table_record ON audit_log (table_name, record_id, changed_at);

CREATE INDEX idx_audit_changed_at   ON audit_log (changed_at);

CREATE INDEX idx_audit_request_id   ON audit_log (request_id);
