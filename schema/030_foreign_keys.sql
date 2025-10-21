-- Auto-generated from schema-map.psd1 @ 1e83bb6 (2025-10-21T10:18:36+02:00)
-- table: audit_log
ALTER TABLE audit_log ADD CONSTRAINT fk_audit_log_user FOREIGN KEY (changed_by) REFERENCES users(id) ON DELETE SET NULL;
