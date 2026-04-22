with orders as(
    select * from {{ ref("stg_orders")}}
),

payment as(
    select * from {{ ref("stg_payment")}}
),

fact_orders as(
    select order_id,
            payment_id,
            amount 

    from orders o
    left join payment p on o.order_id = p.orderid
)

select * from fact_orders