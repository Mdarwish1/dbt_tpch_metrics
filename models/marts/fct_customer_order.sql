{{
    config(
        materialized='table'
    )  
}}

with customers as (

    select * from {{ ref("stg_customer") }}
),

orders as (

    select * from {{ ref("stg_order") }}
),

joined as (

    select 
        customers.customer_key,
        customers.customer_name,
        orders.order_key,
        orders.order_status,
        orders.order_date,
        orders.order_total_price
    from orders
    left join customers
    on orders.order_customer_key = customers.customer_key
)

select * from joined