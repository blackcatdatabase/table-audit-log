# Definition – audit_log

Immutable trail of data changes across tables.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT UNSIGNED | — | — | Surrogate primary key. |  |
| table_name | VARCHAR(100) | NO | — | Target table name. |  |
| record_id | BIGINT UNSIGNED | NO | — | Primary key of the affected record. |  |
| changed_by | BIGINT UNSIGNED | YES | — | Actor user id (FK users.id) or NULL for system. |  |
| change_type | ENUM('INSERT','UPDATE','DELETE') | NO | — | Type of change. | enum: INSERT, UPDATE, DELETE |
| old_value | JSON | YES | — | JSON snapshot before change. |  |
| new_value | JSON | YES | — | JSON snapshot after change. |  |
| changed_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | When change occurred (UTC). |  |
| ip_bin | VARBINARY(16) | YES | — | Client IP (binary form). |  |
| user_agent | VARCHAR(1024) | YES | — | Client user agent string. |  |
| request_id | VARCHAR(100) | YES | — | Correlation/request id if available. |  |
