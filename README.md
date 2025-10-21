# 📦 Audit Log

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0%2B-4479A1?logo=mysql&logoColor=white) ![License](https://img.shields.io/badge/license-BlackCat%20Proprietary-red) ![Status](https://img.shields.io/badge/status-stable-informational) ![Generated](https://img.shields.io/badge/generated-from%20schema--map-blue)

> Schema package for table **audit_log** (repo: `audit-log`).

## Files
```
schema/
  001_table.sql
  # (no deferred indexes declared in map)
  030_foreign_keys.sql
```

## Quick apply
```bash
# Apply schema (Linux/macOS):
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/001_table.sql
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < schema/030_foreign_keys.sql
```

```powershell
# Apply schema (Windows PowerShell):
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/001_table.sql
mysql -h $env:DB_HOST -u $env:DB_USER -p$env:DB_PASS $env:DB_NAME < schema/030_foreign_keys.sql
```

## Docker quickstart
```bash
# Spin up a throwaway MySQL and apply just this package:
docker run --rm -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app -p 3307:3306 -d mysql:8
sleep 15
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/001_table.sql
mysql -h 127.0.0.1 -P 3307 -u root -proot app < schema/030_foreign_keys.sql
```

## Columns
| Column | Type | Null | Default | Extra |
|-------:|:-----|:----:|:--------|:------|
| id | BIGINT UNSIGNED | — | — | AUTO_INCREMENT, PK |
| table_name | VARCHAR(100) | NO | — |  |
| record_id | BIGINT UNSIGNED | NO | — |  |
| changed_by | BIGINT UNSIGNED | YES | — |  |
| change_type | ENUM('INSERT','UPDATE','DELETE') | NO | — |  |
| old_value | JSON | YES | — |  |
| new_value | JSON | YES | — |  |
| changed_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) |  |
| ip_bin | VARBINARY(16) | YES | — |  |
| user_agent | VARCHAR(1024) | YES | — |  |
| request_id | VARCHAR(100) | YES | — |  |

## Relationships
- FK → **users** via (changed_by) (ON DELETE SET NULL).

```mermaid
erDiagram
  AUDIT_LOG {
    INT id PK
    VARCHAR table_name
    INT record_id
    INT changed_by
    ENUM change_type
    JSON old_value
    JSON new_value
    DATETIME changed_at
    BLOB ip_bin
    VARCHAR user_agent
    VARCHAR request_id
  }
  AUDIT_LOG }o--|| USERS : "changed_by"
```

## Indexes
- No deferred indexes declared for this table.

## Notes
- Generated from the umbrella repository **blackcat-database** using `scripts/schema-map.psd1`.
- To change the schema, update the map and re-run the generators.

## License
Distributed under the **BlackCat Store Proprietary License v1.0**. See `LICENSE`.

