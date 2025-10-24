-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-10-24T09:46:38Z)
-- engine: postgres
-- table:  audit_log
ALTER TABLE audit_log ADD CONSTRAINT fk_audit_log_user FOREIGN KEY (changed_by) REFERENCES users(id) ON DELETE SET NULL;
