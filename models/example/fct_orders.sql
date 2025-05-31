SELECT
  id AS order_id,
  name AS customer_name,
  CURRENT_DATE() AS order_date,
  'SKU001' AS sku,
  1 AS quantity,
  100.0 AS item_price,
  10.0 AS item_tax,
  110.0 AS revenue
FROM `airbyte-demo-461419.airbyte_raw.users`