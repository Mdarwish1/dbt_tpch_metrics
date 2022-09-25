{{
    config(
        materialized='table'
    )  
}}

with source as (

    select * from {{ source("TPCH_SF1", "ORDERS") }}
),

staging as (

    select 
        O_ORDERKEY as order_key,
        O_CUSTKEY as order_customer_key,
        O_ORDERSTATUS as order_status,
        O_TOTALPRICE as order_total_price,
        O_ORDERDATE as order_date,
        O_ORDERPRIORITY as order_priority,
        O_CLERK as order_clerk,
        O_SHIPPRIORITY as order_ship_priority,
        O_COMMENT as order_comment
    from source
)

select * from staging