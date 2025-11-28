-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  audit_log

ALTER TABLE audit_log ADD CONSTRAINT fk_audit_log_user FOREIGN KEY (changed_by) REFERENCES users(id) ON DELETE SET NULL;
