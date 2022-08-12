with customers as (

    select *
    from {{ source('jaffle_shop', 'customers') }}

),

final as (

    select
        id as customer_id,
        first_name as customer_first_name,
        last_name as customer_last_name,
        first_name || ' ' || last_name as customer_full_name
    from customers

)

select *
from final