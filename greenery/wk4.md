Part 1. dbt Snapshots

Q1: Create a snapshot model using the orders source in the /snapshots/ directory of our dbt project that monitors the status column. 
A1: See orders_snapshot.sql

Q2: Run the snapshot model to create it in our database (dbt snapshot)
A2: Done

Q3: Run the following queries using pgui.
A3: Done, and I see two new entries in the snapshot

Part 2. Modeling challenge
Let’s say that the Director of Product at greenery comes to us (the head Analytics Engineer) and asks some questions:
- How are our users moving through the product funnel?
100% of users make it to the page view, 81% add to cart, and 62% check out, which seems pretty high.

- Which steps in the funnel have largest drop off points?
The drop off points between page view and add to cart, and add to cart from checkout are both 19% of the total. Checkout has a higher drop off as a percentage of the previus step in the funnel.

Part 3: Reflection questions -- please answer 3A or 3B, or both!

Q3A. dbt next steps for you 
Reflecting on your learning in this class...
    if your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?
        - dbt provides tooling, structure, and organization that is foundational for analytics. Rather than create ad-hoc queries, investing in dbt and analytics engineering allows analysts and data scientists to move faster using a common set of models/data so that they can focus on the analytics.
    if your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?
        -NA
    if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?
        - Building engineering skills to combine with analytical skills in order to build and manage dbt models. Dbt jargon and how to put a project together. Good refresher on data modeling.
3B. Setting up for production / scheduled dbt run of your project And finally, before you fly free into the dbt night, we will take a step back and reflect: after learning about the various options for dbt deployment and seeing your final dbt project, how would you go about setting up a production/scheduled dbt run of your project in an ideal state? You don’t have to actually set anything up - just jot down what you would do and why and post in a README file.
        - I'd be interested in using either dbt cloud or dagster. Schedules would be daily which could support the majority of analytics. I would definitely build tests for all models and use the outputs of tests to alert data engineers and downstream users.