(Part 1) Models 

Use your staging models you created in Week 1 to answer their questions:

Q1: What is our user repeat rate?
A1: 
    with user_orders as (
    SELECT user_id,
            count(distinct(order_id)) as orders_count
    FROM dbt.dbt_michelle_g.stg_orders
    GROUP BY user_id
    ),

    user_summary as (
    SELECT 
        sum(CASE WHEN orders_count > 1 THEN 1 ELSE 0 END) as repeat_users,
        count(user_id) as all_users
    FROM user_orders
    )
    
    SELECT 
    CAST(repeat_users AS float)/CAST(all_users AS FLOAT) as repeat_pct
    FROM user_summary;

    Our repeat user rate is 79.8%

Q2: What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
A2: To identify indicators of a user who is likely to purchase again, I would explore:
    1. How long has it been since a user's last purchase? Is there a time window where users are likely to purchase again before dropping off?
    2. What types of products do users with multiple orders purchase, and identify users who had similar products as their first purchase. Similarly, how many items do repeat purchasers order in their first and second orders.
    3. Whether or not promos are applied to repeat purchase orders, and how much the discount is. We may be able to convert potential users to a second order by offering similar promos.
    4. Location - are there any countries, regions, states or cities that have high rate of repeat purchasing as a percent of users in that area?
    5. Has a user returned to the site after making their first purchase? What are they doing on the site? The events could be indicators that they are ready to purchase again.

Q3:More stakeholders are coming to us for data, which is great! But we need to get some more models created before we can help. Create a marts folder, so we can organize our models, with the following subfolders for business units:
Core
Marketing
Product
Within each marts folder, create intermediate models and dimension/fact models.
Explain the marts models you added. Why did you organize the models in the way you did?
A3: I added facts and dims in the 'core' mart that seemed central to the business and would be used by multiple departments.
I added a promos fact table and a user orders fact table to the marketing mart. These can be used by the marketing org to analyze summary information about a user's orders at the user grain, or about total performance of a given promo. 
I added page views and product order fact tables to the product mart. These can be used by the product org to analyze page view performance of each product. The product order facts can also be used by the product team to see total performance of each product.

Q4: Use the dbt docs to visualize your model DAGs to ensure the model layers make sense
A4: Copied DAG from docs

(Part 2) Tests 
Add dbt tests into your dbt project on your existing models from Week 1, and new models from the section above

Q1: What assumptions are you making about each model? (i.e. why are you adding each test?)
A1: For the primary key ID for each model I start out with the assumption that it needs to be unique and not null. Foreign keys need to not be null but can be repeated. Most of the columns need to be not null, but some like promos in orders can be null. All order counts, totals, and prices need to be positive values. All Foreign keys need to relate back to the primary key in the respective dim table.

Q2: Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
A2: All my tests passed, which makes me think I didn't define enough tests :)  I did use distinct for each primary key when selecting my models and am mosting testing for uniqueness, so that makes sense. I would definitely find 'bad' data if I kept building out tests.

Q3: Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
A3: I would store failed test results for each dbt model run and then set up alarms for these tests. I would use the DAG to identify downstream models impacted by each test failure and notify users who query those tables.