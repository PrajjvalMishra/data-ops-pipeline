SELECT
  id AS ad_id,
  created_at AS ad_date,
  'SKU001' AS sku,
  10 AS clicks,
  25.5 AS ad_spend
FROM `airbyte-demo-461419.airbyte_raw.purchases`