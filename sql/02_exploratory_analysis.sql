-- Deal stages

SELECT deal_stage,
COUNT(opportunity_id) AS num_opportunities
FROM sales_pipeline
GROUP BY deal_stage;

-- Total number of sales agents in organization

SELECT COUNT(DISTINCT sales_agent) AS total_sales_agents
FROM sales_teams;

-- Number of sales agents with opportunities

SELECT COUNT(DISTINCT sales_agent) AS total_sales_agents
FROM sales_pipeline;

-- Accounts by sector

SELECT sector, COUNT(account) AS num_accounts
FROM accounts
GROUP BY sector
ORDER BY num_accounts DESC;

-- Products

SELECT product,
sales_price
FROM products
ORDER BY sales_price DESC;

-- Regional office distribution

SELECT regional_office,
COUNT(sales_agent) AS num_sales_agents
FROM sales_teams
GROUP BY regional_office;

-- Percentage of opportunities by deal stage

SELECT deal_stage,
COUNT(opportunity_id) AS opportunities,
ROUND(100 * COUNT(opportunity_id)/ 
(SELECT COUNT(opportunity_id) FROM sales_pipeline), 2)
AS pct_of_total
FROM sales_pipeline
GROUP BY deal_stage;

-- Average won deal size

SELECT ROUND(AVG(close_value),2) AS avg_won_deal_size
FROM sales_pipeline
WHERE deal_stage = 'Won';