# audit_log

Immutable trail of data changes across tables.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| change_type | TEXT | NO |  | Type of change. (enum: INSERT, UPDATE, DELETE) |
| changed_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | When change occurred (UTC). |
| changed_by | BIGINT | YES |  | Actor user id (FK users.id) or NULL for system. |
| id | BIGINT | NO |  | Surrogate primary key. |
| ip_bin | BYTEA | YES |  | Client IP (binary form). |
| new_value | JSONB | YES |  | JSON snapshot after change. |
| old_value | JSONB | YES |  | JSON snapshot before change. |
| record_id | BIGINT | NO |  | Primary key of the affected record. |
| request_id | VARCHAR(100) | YES |  | Correlation/request id if available. |
| table_name | VARCHAR(100) | NO |  | Target table name. |
| user_agent | VARCHAR(1024) | YES |  | Client user agent string. |

## Engine Details

### mysql

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_audit_changed_at | changed_at | CREATE INDEX idx_audit_changed_at   ON audit_log (changed_at) |
| idx_audit_request_id | request_id | CREATE INDEX idx_audit_request_id   ON audit_log (request_id) |
| idx_audit_table_record | table_name,record_id,changed_at | CREATE INDEX idx_audit_table_record ON audit_log (table_name, record_id, changed_at) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_audit_log_user | changed_by | users(id) | ON DELETE SET |

### postgres

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_audit_changed_at | changed_at | CREATE INDEX IF NOT EXISTS idx_audit_changed_at   ON audit_log (changed_at) |
| idx_audit_request_id | request_id | CREATE INDEX IF NOT EXISTS idx_audit_request_id   ON audit_log (request_id) |
| idx_audit_table_record | table_name,record_id,changed_at | CREATE INDEX IF NOT EXISTS idx_audit_table_record ON audit_log (table_name, record_id, changed_at) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_audit_log_user | changed_by | users(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_audit_activity_daily | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\audit-log\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/audit-log/schema/040_views_joins.mysql.sql) |
| vw_audit_log | mysql | algorithm=MERGE, security=INVOKER | [packages\audit-log\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/audit-log/schema/040_views.mysql.sql) |
| vw_audit_activity_daily | postgres |  | [packages\audit-log\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/audit-log/schema/040_views_joins.postgres.sql) |
| vw_audit_log | postgres |  | [packages\audit-log\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/audit-log/schema/040_views.postgres.sql) |
