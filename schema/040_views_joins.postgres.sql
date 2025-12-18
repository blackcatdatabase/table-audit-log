-- Auto-generated from core/joins-postgres.yaml (map@sha1:29CF395A3A4C8964482083733F8E613ABFBEF5CC)
-- engine: postgres
-- view:   audit_activity_daily

-- Daily audit activity split by change type
CREATE OR REPLACE VIEW vw_audit_activity_daily AS
SELECT
  date_trunc($$day$$, changed_at) AS day,
  COUNT(*) AS total,
  COUNT(*) FILTER (WHERE change_type=$$INSERT$$) AS inserts,
  COUNT(*) FILTER (WHERE change_type=$$UPDATE$$) AS updates,
  COUNT(*) FILTER (WHERE change_type=$$DELETE$$) AS deletes
FROM audit_log
GROUP BY 1
ORDER BY day DESC;
