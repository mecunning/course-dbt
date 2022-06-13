Question 1: How many users do we have?

Answer 1: 
    SELECT count(distinct(user_id)) FROM dbt.dbt_michelle_g.stg_users;

    
We have 130 unique users.

Question 2: On average, how many orders do we receive per hour?

Answer 2:
with hourly_orders as (
  SELECT count(order_id) as order_count,
         date_trunc('hour', created_at_utc) as order_hour_utc
  FROM dbt.dbt_michelle_g.stg_orders
    GROUP BY order_hour_utc
  )
  
SELECT avg(order_count)
FROM hourly_orders

We receive an average of 7.5208333333333333 orders per hour.

Question 3: On average, how long does an order take from being placed to being delivered?

Answer 3:
with delivery_time as (
  SELECT order_id,
         delivered_at_utc - created_at_utc as delivery_time
  FROM dbt.dbt_michelle_g.stg_orders
    WHERE delivered_at_utc IS NOT NULL
  )
  
SELECT avg(delivery_time)
FROM delivery_time

The average time from order placement to order delivery is 3 days 21:24:11.803279

Question 4: How many users have only made one purchase? Two purchases? Three+ purchases? Note: you should consider a purchase to be a single order. In other words, if a user places one order for 3 products, they are considered to have made 1 purchase.

Answer 4:
  SELECT user_id,
         count(order_id) as order_count
  FROM dbt.dbt_michelle_g.stg_orders
    GROUP BY user_id
  )
  
SELECT count(user_id) as user_count,
       order_count
FROM customer_orders
  GROUP BY order_count
  ORDER BY order_count asc

25 users have made only one purchase, 28 have made 2 purchases, and 71 have 3 or more purchases.

Question 5: On average, how many unique sessions do we have per hour?

Answer 5: 
with hourly_sessions as (
  SELECT count(distinct(session_id)) as session_count,
         date_trunc('hour', created_at_utc) as session_hour_utc
  FROM dbt.dbt_michelle_g.stg_events
  GROUP BY session_hour_utc
  )
  
SELECT avg(session_count) as avg_session 
FROM hourly_sessions

On average we have 16.3275862068965517 unique sessions per hour.