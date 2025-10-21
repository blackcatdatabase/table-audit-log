-- Auto-generated from schema-map.psd1 on 2025-10-21T02:32:05
-- table: audit_log
ALTER TABLE audit_log ADD CONSTRAINT fk_audit_log_user FOREIGN KEY (changed_by) REFERENCES users(id) ON DELETE SET NULL;
