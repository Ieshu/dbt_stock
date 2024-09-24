**DBT Sales Project**

This is a data transformation project built using dbt (Data Build Tool) to model and aggregate sales data from the deals_fact table in the stock_warehouse schema. The project focuses on transforming raw data, aggregating it by deal stages, and calculating useful metrics such as deal velocity and total amounts.

**Project Structure**

The project is organized into several key directories:

dbt_sales_proj/
├── models/
│   ├── staging/
│   │   ├── stg_stock.sql        # Staging model for initial data cleaning and transformations
│   │   ├── schema.yml           # Test cases for staging models
│   ├── final/
│   │   ├── final_stock.sql      # Final model for aggregating deal metrics by deal stage
│   │   ├── schema.yml           # Test cases for final models
├── macros/
│   ├── deal_metrics.sql         # Macro for calculating aggregated deal metrics
│   ├── date_utils.sql           # Macro for date difference and date extraction
├── dbt_project.yml              # Main configuration file for the dbt project
└── README.md                    # Project README file

**Key Components**

stg_stock.sql: Staging model that transforms raw data from the deals_fact table.

final_stock.sql: Final model that aggregates the transformed data, providing insights into deal metrics.

Macros: Custom macros for reusable SQL logic, including date calculations and deal metric aggregations.

Schema Tests: Automated tests to ensure data quality and integrity.

**Prerequisites**

Before running the project, ensure the following are installed and configured:

dbt: Install dbt by following the official dbt installation guide.

Database: The project assumes a PostgreSQL database with the following schema and table:

Schema: stock_warehouse
Table: deals_fact
Profiles.yml: Set up your profiles.yml file to connect to your database.

Clone the project:

git clone https://github.com/yourusername/dbt_sales_proj.git

cd dbt_sales_proj

**Install dependencies:**

dbt deps

Set up your database: Make sure you have the deals_fact table in the stock_warehouse schema in your database. Here’s the table schema:

CREATE TABLE stock_warehouse.deals_fact (
  deal_id INT PRIMARY KEY,
  amount DECIMAL,
  deal_stage VARCHAR(50),
  close_date DATE,
  create_date DATE
);

**Running the Project**

Clean the project (removes compiled artifacts):

dbt clean

Run the models: Execute the transformations and create the views/tables:

dbt run

Run the tests: Validate the models with automated tests:

dbt test

**Models and Transformations**

stg_stock.sql:

Source: stock_warehouse.deals_fact
Performs initial transformations such as:

Casting data types

Calculating deal_velocity (time taken to close a deal)

Extracting deal_close_month_year (month and year when the deal closed)

final_stock.sql:

Source: stg_stock
Aggregates the staged data, calculating metrics such as:

Total deals per deal stage

Total amount per deal stage

Earliest and latest deal close dates

**Macros**

deal_metrics.sql:

calculate_deal_metrics(data_table): Aggregates deal metrics such as total deals, total amounts, and min/max close dates.

date_utils.sql:

calculate_date_diff(start_date, end_date): Calculates the difference between two dates (in days).

extract_month_year(date_col): Extracts the month and year from a date.

**Tests**

Schema tests are defined in the schema.yml files to ensure data quality, including:

Not Null: Ensures critical columns like deal_id, deal_stage, deal_amount, and deal_velocity are not null.

Unique: Ensures that deal_id is unique in the data.

Accepted Range: Ensures that deal_amount is a positive value.

