{{
    config(
        materialized='table'
    )  
}}

with source as (

    select * from {{ source("TPCH_SF1", "PART") }}
),

staging as (

    select 
        P_PARTKEY as part_key,
        P_NAME as part_name,
        P_MFGR as part_mfgr,
        P_BRAND as part_brand,
        P_TYPE as part_type,
        P_SIZE as part_size,
        P_CONTAINER as part_container,
        P_RETAILPRICE as part_retail_price,
        P_COMMENT as part_comment
    from source
)

select * from staging