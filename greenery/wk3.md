PART 1: Create new models to answer the first two questions (answer questions in README file)

Q1: What is our overall conversion rate?
A1:
WITH session_conversions AS (
  SELECT count(distinct(session_id)) as count_sessions,
         SUM(converted) as count_session_conversions
  FROM dbt.dbt_michelle_g.fact_sessions
)

SELECT count_session_conversions/count_sessions as conversion_rate
FROM session_conversions

Our overall conversion rate is 0.625

Q2: What is our conversion rate by product?
A2: 

Q3: Why might certain products be converting at higher/lower rates than others?
A3: Certain products may be converting higher than others because:
- price differences
- popularity of product
- promos on certain products
- time of year (if any plants are seasonal)
- ease of checkout on the product page
- products featured on home page, advertisements, or other pages

PART 2: We’re getting really excited about dbt macros after learning more about them and want to apply them to improve our dbt project.

Q1: Create a macro to simplify part of a model(s).
A1: See session_events macro

PART 3: We’re starting to think about granting permissions to our dbt models in our postgres database so that other roles can have access to them.

Q1: Add a post hook to your project to apply grants to the role “reporting”. Create reporting role first by running CREATE ROLE reporting in your database instance.
A1: See dbt_project.yml

PART 4:  After learning about dbt packages, we want to try one out and apply some macros or tests.

Q1: Install a package (i.e. dbt-utils, dbt-expectations) and apply one or more of the macros to your project
A1: See packages.yml

PART 5: After improving our project with all the things that we have learned about dbt, we want to show off our work!

Q1: Show (using dbt docs and the model DAGs) how you have simplified or improved a DAG using macros and/or dbt packages.
A1: See github/screenshot