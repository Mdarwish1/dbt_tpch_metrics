{{
    config(
        materialized='view'
    )  
}}

with source as (

    select * from {{ source("TPC-H", "Region") }}
),

staging as (

    select 
        R_REGIONKEY as region_key,
        R_NAME as region_name,
        R_COMMENT as region_comment
    from source
)

select * from staging