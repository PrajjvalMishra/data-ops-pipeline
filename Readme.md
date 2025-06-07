# 🛠️ Data Operations Specialist Assignment – Simulated Pipeline

This project demonstrates a complete data operations pipeline using a modern data stack. Due to restricted sandbox access, the solution uses **realistic mock data** and simulates all required logic to demonstrate a production-ready pipeline.

---

## ✅ Project Overview

| Step                     | Tool Used              | Status   |
|--------------------------|------------------------|----------|
| Data Ingestion           | Airbyte → BigQuery     | ✅ Mock Data via Faker |
| Data Transformation      | dbt Cloud + BigQuery   | ✅ All models built |
| Data Testing             | dbt Tests              | ✅ `not_null`, `unique`, `custom test` |
| CI/CD                    | dbt Cloud Job          | ✅ Configured |
| Reporting                | Looker Studio          | ✅ Dashboard built |
| Alerting                 | BigQuery simulation    | ✅ Slack logic simulated |
| Documentation            | README + Loom Video    | ✅ Included |

---

## ⚙️ Tools Used

- **Airbyte** – Ingested `products`, `purchases`, `users` (faker connector)
- **BigQuery** – Cloud data warehouse
- **dbt Cloud** – SQL modeling, tests, orchestration
- **Looker Studio** – Dashboard visualization
- **Slack Alerts** – Simulated via SQL query

---

## 📂 Pipeline Steps

### 🔸 Step 1: Data Ingestion with Airbyte
- Faker connector used to simulate Amazon data
- Three tables ingested: `products`, `purchases`, `users`
- Stored in BigQuery under dataset: `airbyte_raw`

### 🔸 Step 2: dbt Models in BigQuery

| Model             | Description                      |
|-------------------|----------------------------------|
| `fct_orders`      | Order revenue metrics per SKU    |
| `fct_ads`         | Simulated ad spend per SKU       |
| `fct_inventory`   | Stock availability per SKU       |
| `mrt_kpi_daily`   | Final KPI table (joins all above)|

Models use Jinja templating, `ref()`, and CTEs.

---

## ✅ Data Testing

Implemented in `schema.yml`:
- `not_null` tests on key fields (e.g., `sku`, `order_date`)
- `unique` test on `order_id` in `fct_orders`
- 🔍 **Custom test** on `days_of_cover > 0`

Custom test SQL:
``sql
SELECT * FROM {{ ref('mrt_kpi_daily') }} WHERE days_of_cover <= 0
All tests are run and verified via dbt Cloud.

🔁 CI/CD in dbt Cloud
![DBT Build](https://github.com/PrajjvalMishra/data-ops-pipeline/actions/workflows/dbt.yml/badge.svg)
dbt Cloud Job created with steps:

dbt deps

dbt build

dbt test

Job can be scheduled or triggered manually on push

🔔 Slack Alert Simulation (No Webhook)
As real Slack webhook was not available, this query simulates the daily 09:00 EST alert:

![Slack Query](https://github.com/user-attachments/assets/91ebcfbb-133c-4940-a5d9-61fbcdfea124)

🎯 This would be used to alert:

Yesterday’s revenue

TACoS %

SKUs with < 15 days of stock

🖼️ Screenshot attached in Loom walkthrough.

📊 Looker Studio Dashboard
Final model: mrt_kpi_daily

Components:

📈 Revenue vs Ad Spend (Bar)

🧮 TACoS trend (Line)

📦 Days of Cover (Cards)

🗂️ Filter by SKU and Date

🔗 https://drive.google.com/file/d/1ptfjfwGwgAVmWaLlxZ4PWJoYHIlbSUvz/view?usp=sharing

📽️ Loom Video Walkthrough

🔗 https://www.loom.com/share/108725ae73054488a4ee8e29481a1fb2?sid=7508f99b-0db3-4b60-83b7-15438dcaff6c


Covers:

Airbyte → BigQuery

dbt Cloud models + tests

Slack alert logic

Looker dashboard

🙋‍♂️ Author
Prajjval Mishra
📧 prajjvalmishra18@gmail.com
🔗 [LinkedIn](https://www.linkedin.com/in/prajjvalmishra/)

⚠️ Note on Access
Sandbox credentials (SP-API, Ads API, Slack webhook, and GCP project) were not provided. This solution uses realistic mock data and simulates alerting logic. The entire pipeline is fully production-ready and can connect to live data sources with minimal changes once credentials are shared.

### 🔁 Stretch Goals Not Implemented (Why)

The following stretch items were intentionally not implemented due to constraints:

- **SP-API Retry Logic**: Not applicable as real API credentials were not shared.
- **Pytest Unit Tests**: dbt handles all SQL logic and testing; no Python transformation layer present.
- **Metaplane Monitoring**: Requires integration with live data; simulated alerting logic used instead.

> All components are ready to be extended with these features once live credentials are available.
