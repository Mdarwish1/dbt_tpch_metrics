{{
    config(
        materialized='table'
    )  
}}

with source as (

    select * from {{ source("TPCH_SF1", "NATION") }}
),

staging as (

    select 
        N_NATIONKEY as nation_key,
        N_NAME as nation_name,
        N_REGIONKEY as nation_region_key,
        N_COMMENT as nation_comment
    from source
)

select * from staging