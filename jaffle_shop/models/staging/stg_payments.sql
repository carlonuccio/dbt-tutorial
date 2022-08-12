with payments as (

    select *
    from {{ source('stripe', 'payments') }}

),

final as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        created as payment_created_at,
        status as payment_status,
        {{ cents_to_dollars('amount', 4) }} as amount
    from payments

)

select *
from final