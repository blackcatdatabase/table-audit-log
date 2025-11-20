-- Auto-generated from schema-map-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  audit_log
ALTER TABLE audit_log ADD CONSTRAINT fk_audit_log_user FOREIGN KEY (changed_by) REFERENCES users(id) ON DELETE SET NULL;
