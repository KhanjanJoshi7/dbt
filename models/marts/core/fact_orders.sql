with orders as(
    select * from {{ ref("stg_orders")}}
),

payments as(
    select * from {{ ref("stg_payments")}}
),

fact_orders as(
    select order_id,
            payment_id,
            amount 

    from orders o
    left join payments p on o.order_id = p.orderid
)

select * from fact_orders