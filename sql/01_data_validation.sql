-- ============================================
-- SALES PIPELINE ANALYTICS PROJECT
-- DATA VALIDATION
-- ============================================

-- Section A: Check row counts

SELECT COUNT(*) AS accounts_count
FROM accounts;

SELECT COUNT(*) AS products_count
FROM products;

SELECT COUNT(*) AS sales_pipeline_count
FROM sales_pipeline;

SELECT COUNT(*) AS sales_teams_count
FROM sales_teams;


-- Section B: Check primary key uniqueness

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT account) AS unique_accounts
FROM accounts;

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT product) AS unique_products
FROM products;

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT sales_agent) AS unique_agents
FROM sales_teams;

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT opportunity_id) AS unique_opportunities
FROM sales_pipeline;

SELECT COUNT(*) FROM sales_pipeline
WHERE account IS NULL;

-- Section C: Null checks

SELECT COUNT(*) FROM sales_pipeline
WHERE product IS NULL;

SELECT COUNT(*) FROM sales_pipeline
WHERE sales_agent IS NULL;

SELECT COUNT(*) FROM sales_pipeline
WHERE deal_stage IS NULL;

SELECT COUNT(*) FROM sales_pipeline
WHERE close_value IS NULL;

-- Section D: Relationship validation
-- Check for unmatched products
SELECT DISTINCT sp.product
FROM sales_pipeline sp
LEFT JOIN products p
ON sp.product = p.product
WHERE p.product IS NULL;

SELECT DISTINCT p.product
FROM products p
LEFT JOIN sales_pipeline sp
ON sp.product = p.product
WHERE sp.product IS NULL;

-- Check for unmatched accounts
-- Check for unmatched accounts

SELECT DISTINCT sp.account
FROM sales_pipeline sp
LEFT JOIN accounts a
ON sp.account = a.account
WHERE a.account IS NULL;

SELECT DISTINCT a.account
FROM accounts a
LEFT JOIN sales_pipeline sp
ON sp.account = a.account
WHERE sp.account IS NULL;

-- Check for unmatched sales agents

-- Check for unmatched sales agents

SELECT DISTINCT sp.sales_agent
FROM sales_pipeline sp
LEFT JOIN sales_teams st
ON sp.sales_agent = st.sales_agent
WHERE st.sales_agent IS NULL;

-- Check for unmatched sales agents

SELECT DISTINCT st.sales_agent
FROM sales_teams st
LEFT JOIN sales_pipeline sp
ON sp.sales_agent = st.sales_agent
WHERE sp.sales_agent IS NULL;

-- Section E: Validation findings
-- Findings
-- 1 product mismatch found:
-- GTXPro vs GTX Pro

-- No account mismatches found.
-- No sales agent mismatches found.

-- 5 sales agents exist in the sales_teams table 
-- without associated opportunities.