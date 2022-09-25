{{
    config(
        materialized='table'
    )  
}}

with source as (

    select * from {{ source("TPCH_SF1", "REGION") }}
),

staging as (

    select 
        R_REGIONKEY as region_key,
        R_NAME as region_name,
        R_COMMENT as region_comment
    from source
)

select * from staging