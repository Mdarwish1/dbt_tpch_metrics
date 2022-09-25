{{
    config(
        materialized='table'
    )  
}}

with source as (

    select * from {{ source("TPCH_SF1", "SUPPLIER") }}
),

staging as (

    select 
        S_SUPPKEY as supplier_key,
        S_NAME as supplier_name,
        S_ADDRESS as supplier_address,
        S_NATIONKEY as supplier_nation_key,
        S_PHONE as supplier_phone,
        S_ACCTBAL as supplier_account_bal,
        S_COMMENT as supplier_comment
    from source
)

select * from staging