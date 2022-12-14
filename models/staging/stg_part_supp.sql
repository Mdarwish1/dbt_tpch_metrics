{{
    config(
        materialized='table'
    )  
}}

with source as (

    select * from {{ source("TPCH_SF1", "PARTSUPP") }}
),

staging as (

    select 
        PS_PARTKEY as part_supplier_part_key,
        PS_SUPPKEY as part_supplier_key,
        PS_AVAILQTY as part_supplier_availability,
        PS_SUPPLYCOST as part_supplier_supply_cost,
        PS_COMMENT as part_supplier_comment
       
    from source
)

select * from staging