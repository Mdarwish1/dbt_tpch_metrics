{{
    config(
        materialized='view'
    )  
}}

with source as (

    select * from {{ source("TPC-H", "Orders") }}
),

staging as (

    select 
        O_ORDERKEY as order_key,
        O_CUSTKEY as order_customer_key,
        O_ORDERSTATUS as order_status,
        O_TOTALPRICE as order_total_price,
        O_ORDERDATE as order_date,
        "O_ORDER-PRIORITY" as order_priority,
        O_CLERK as order_clerk,
        "O_SHIP-PRIORITY" as order_ship_priority,
        O_COMMENT as order_comment
    from source
)

select * from staging