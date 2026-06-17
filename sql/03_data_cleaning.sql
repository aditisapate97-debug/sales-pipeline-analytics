CREATE VIEW sales_pipeline_cleaned AS
SELECT
opportunity_id,
sales_agent,
CASE WHEN product = 'GTXPro'
THEN 'GTX Pro'
ELSE product
END AS product,
account,
deal_stage,
engage_date,
close_date,
close_value
FROM sales_pipeline;