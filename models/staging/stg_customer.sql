{{
    config(
        materialized='table'
    )  
}}

with source as (

    select * from {{ source("TPCH_SF1", "CUSTOMER") }}
),

staging as (

    select 
        C_CUSTKEY as customer_key,
        C_NAME as customer_name,
        C_ADDRESS as customer_address,
        C_NATIONKEY as customer_nation_key,
        C_PHONE as customer_phone,
        C_ACCTBAL as customer_account_bal,
        C_MKTSEGMENT as customer_mkt_segment,
        C_COMMENT as customer_comment
    from source
)

select * from staging