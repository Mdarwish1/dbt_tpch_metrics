{{ config(materialized = 'table') }}

select *
from {{ metrics.calculate(
    metric('orders_price_by_customer'),
    dimensions=['customer_name'],
    grain='month'
) }}