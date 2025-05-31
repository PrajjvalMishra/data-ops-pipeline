SELECT
  id AS product_id,
  updated_at AS snapshot_date,
  'SKU001' AS sku,
  CAST(price AS INT64) AS afn_inventory_quantity,
  CAST(price AS INT64) AS afn_fulfillable_quantity
FROM `airbyte-demo-461419.airbyte_raw.products`