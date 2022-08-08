with payments as (

    select *
    from {{ source('stripe', 'payments') }}

),

final as (
    select
        id as payment_id,
        orderid as order_id,
        created as payment_created_at,
        status as payment_status,
        round(amount / 100.0, 2) as payment_amount
    from payments

)

select *
from final