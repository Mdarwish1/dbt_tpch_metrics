{{
    config(
        materialized='table'
    )  
}}

with source as (

    select * from {{ source("TPCH_SF1", "LINEITEM") }}
),

staging as (

    select 
        L_ORDERKEY as line_order_key,
        L_PARTKEY as line_part_key, 
        L_SUPPKEY as line_supp_key,
        L_LINENUMBER as line_number, 
        L_QUANTITY as line_quantity, 
        L_EXTENDEDPRICE as line_extended_price, 
        L_DISCOUNT as line_discount, 
        L_TAX as line_tax, 
        L_RETURNFLAG as line_return_flag, 
        L_LINESTATUS as line_line_status, 
        L_SHIPDATE as line_ship_date, 
        L_COMMITDATE as line_commit_date, 
        L_RECEIPTDATE as line_receipt_date, 
        L_SHIPINSTRUCT as line_ship_in_struct, 
        L_SHIPMODE as line_ship_mode, 
        L_COMMENT as line_comment 
    from source
)

select * from staging