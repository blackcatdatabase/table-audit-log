-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-10-24T09:13:35Z)
-- engine: mysql
-- table:  audit_log
ALTER TABLE audit_log ADD CONSTRAINT fk_audit_log_user FOREIGN KEY (changed_by) REFERENCES users(id) ON DELETE SET NULL;
