with orders as (

    select *
    from {{ source('jaffle_shop', 'orders') }}

),

final as (

    select
        orders.id as order_id,
        orders.user_id	as customer_id,
        orders.order_date as order_placed_at,
        orders.status as order_status,
        case
            when status not in ('returned','return_pending')
            then order_date
        end as valid_order_date
    from orders

)

select *
from final