# Kasi Mart Data Engineering — Project 1

Loaded and modeled Kasi Mart's customer, product, and order data in Snowflake — includes schema design, CSV ingestion, and SQL queries for revenue analysis by customer and category.

## Overview

This project builds a small relational data warehouse in Snowflake from three source CSVs (customers, products, orders), confirms a successful load, and answers four business questions using SQL joins and aggregations — from raw order-level detail down to a ranked list of top customers.

## Data

|-----------------|-----|-----------|
| File            | Rows| Role      |
|-----------------|-----|-----------|
| `customers.csv` | 50  | Dimension |
| `products.csv`  | 20  | Dimension |
| `orders.csv`    | 150 | Fact      |
|-----------------|-----|-----------|

## Tech Stack

- **Platform:** Snowflake
- **Language:** SQL

## What's in this repo

- `queries.sql` — all four analysis queries
- `load.sql` — table creation and load statements
- `report.md` — full project write-up, results, and explanations
- Source CSVs (`customers.csv`, `products.csv`, `orders.csv`)

## Queries

1. **Order detail join** — every order joined to customer, product, category, and calculated revenue
2. **Revenue per customer** — total spend, ranked highest to lowest
3. **Revenue per category** — total revenue rolled up by product category
4. **Top 5 customers** — highest-spending customers by total revenue


## Author

Theo ML Tshabalala
