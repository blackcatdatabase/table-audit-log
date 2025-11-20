<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – audit_log

Immutable trail of data changes across tables.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| table_name | VARCHAR(100) | NO | — | Target table name. |  |
| record_id | BIGINT | NO | — | Primary key of the affected record. |  |
| changed_by | BIGINT | YES | — | Actor user id (FK users.id) or NULL for system. |  |
| change_type | TEXT | NO | — | Type of change. | enum: INSERT, UPDATE, DELETE |
| old_value | JSONB | YES | — | JSON snapshot before change. |  |
| new_value | JSONB | YES | — | JSON snapshot after change. |  |
| changed_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | When change occurred (UTC). |  |
| ip_bin | BYTEA | YES | — | Client IP (binary form). | PII: plain |
| user_agent | VARCHAR(1024) | YES | — | Client user agent string. |  |
| request_id | VARCHAR(100) | YES | — | Correlation/request id if available. |  |