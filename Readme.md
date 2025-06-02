# Data Ops Pipeline Project

This project demonstrates a complete data operations pipeline using modern data stack tools: Airbyte, dbt, BigQuery, and Looker Studio.

---

## 🚀 Tools Used

- **Airbyte** – for ingesting raw data (products, purchases, users)
- **BigQuery** – as the data warehouse
- **dbt (Cloud)** – for transforming raw data into analytical models
- **Looker Studio** – for building dashboards
- *(Optional)* Slack/Zapier – for alerting

---

## 📂 Pipeline Overview

### 1. **Data Ingestion (Airbyte → BigQuery)**
- Source tables: `products`, `purchases`, `users`
- Destination: `airbyte_raw` dataset in BigQuery

### 2. **Transformations with dbt**
- dbt models:
  - `fct_orders.sql`
  - `fct_ads.sql`
  - `fct_inventory.sql`
  - `dim_sku.sql`
  - `mrt_kpi_daily.sql` – combines all for final KPIs
- Tests: `not_null`, `numeric`, etc. defined in `schema.yml`
- Project folder structure:
models/
└── example/
├── fct_orders.sql
├── fct_ads.sql
├── fct_inventory.sql
├── dim_sku.sql
└── mrt_kpi_daily.sql

markdown
Copy
Edit

### 3. **Testing & Deployment (dbt Cloud)**
- Job created with steps: `dbt deps`, `dbt build`, `dbt test`
- All major tests passed

### 4. **Looker Studio Dashboard**
- Final table: `dbt_pmishra.mrt_kpi_daily`
- KPIs visualized:
- Total Revenue
- Ad Spend
- TACoS
- Days of Cover
- Filters for Date & SKU

---

## ✅ Deliverables

- [x] dbt models and tests
- [x] Airbyte ingestion
- [x] BigQuery transformations
- [x] Dashboard in Looker Studio
- [x] dbt Cloud job with tests

---

## 🔗 Links

- **GitHub Repo**: [data-ops-pipeline](https://github.com/PrajjvalMishra/data-ops-pipeline)
- **Looker Studio Dashboard**: *(Insert link if public)*
- **dbt Cloud Job**: *(Screenshot or name)*

---

## 🙋‍♂️ Author

Prajjval Mishra  
Email: prajjvalmishra18@gmail.com  
LinkedIn: [Connect](https://www.linkedin.com/in/prajjval-mishra)
