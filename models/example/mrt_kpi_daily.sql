WITH orders AS (
  SELECT order_date AS date, sku, SUM(revenue) AS revenue
  FROM {{ ref('fct_orders') }}
  GROUP BY date, sku
),
ads AS (
  SELECT ad_date AS date, sku, SUM(ad_spend) AS ad_spend
  FROM {{ ref('fct_ads') }}
  GROUP BY date, sku
),
inventory AS (
  SELECT snapshot_date AS date, sku, MAX(afn_fulfillable_quantity) AS stock
  FROM {{ ref('fct_inventory') }}
  GROUP BY date, sku
)

SELECT
  o.date,
  o.sku,
  o.revenue,
  a.ad_spend,
  ROUND(100 * a.ad_spend / NULLIF(o.revenue, 0), 2) AS tacos,
  i.stock,
  ROUND(i.stock / NULLIF(SUM(o.revenue / 30), 0), 2) AS days_of_cover
FROM orders o
LEFT JOIN ads a ON o.date = a.date AND o.sku = a.sku
LEFT JOIN inventory i ON o.date = i.date AND o.sku = i.sku