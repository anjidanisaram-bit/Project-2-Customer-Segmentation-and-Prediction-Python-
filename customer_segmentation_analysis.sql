1. Customer Distribution: How many customers belong to each segmentation group?


SELECT
    "Segmentation Group",
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage
FROM public.customer_data
GROUP BY "Segmentation Group"
ORDER BY customer_count DESC;


2. Customer Demographics: What is the average age of customers in each segmentation group?


SELECT
    "Segmentation Group",
    ROUND(AVG("Age")::NUMERIC, 2) AS average_age,
    COUNT(*) AS customer_count
FROM public.customer_data
WHERE "Segmentation Group" IS NOT NULL
  AND "Age" IS NOT NULL
GROUP BY "Segmentation Group"
ORDER BY average_age DESC;


3. Income Analysis: Which customer segment has the highest average income?


SELECT
    "Segmentation Group",
    ROUND(AVG("Income Level")::NUMERIC, 2) AS average_income,
    COUNT(*) AS customer_count
FROM public.customer_data
WHERE "Segmentation Group" IS NOT NULL
  AND "Income Level" IS NOT NULL
GROUP BY "Segmentation Group"
ORDER BY average_income DESC;


4. Premium Analysis: Which customer segment pays the highest average insurance premium?

SELECT
    "Segmentation Group",
    ROUND(AVG("Premium Amount")::NUMERIC, 2) AS average_premium,
    COUNT(*) AS customer_count
FROM public.customer_data
WHERE "Segmentation Group" IS NOT NULL
  AND "Premium Amount" IS NOT NULL
GROUP BY "Segmentation Group"
ORDER BY average_premium DESC;



5. Coverage Analysis: Which customers have the highest insurance coverage amounts?


SELECT
    "Customer ID",
    "Segmentation Group",
    "Insurance Products Owned",
    "Coverage Amount"
FROM public.customer_data
WHERE "Coverage Amount" IS NOT NULL
ORDER BY "Coverage Amount" DESC
LIMIT 10;


6. Product Ownership: Which insurance products are owned by the largest number of customers?


SELECT
    "Insurance Products Owned",
    COUNT(DISTINCT "Customer ID") AS customer_count
FROM public.customer_data
WHERE "Insurance Products Owned" IS NOT NULL
GROUP BY "Insurance Products Owned"
ORDER BY customer_count DESC
LIMIT 10;


7. Policy Analysis: Which policy type is the most popular among customers?


SELECT
    "Policy Type",
    COUNT(DISTINCT "Customer ID") AS customer_count,
    ROUND(
        COUNT(DISTINCT "Customer ID") * 100.0 /
        SUM(COUNT(DISTINCT "Customer ID")) OVER (),
        2
    ) AS customer_percentage
FROM public.customer_data
WHERE "Policy Type" IS NOT NULL
GROUP BY "Policy Type"
ORDER BY customer_count DESC;


8. Purchase Behavior: Which customer segments show the strongest purchasing behavior based on available purchase-history data?

SELECT
    "Segmentation Group",
    COUNT(*) AS total_records,
    COUNT("Purchase History") AS records_with_purchase_history,
    COUNT(DISTINCT "Customer ID") AS total_customers,
    COUNT(DISTINCT "Customer ID") FILTER (
        WHERE "Purchase History" IS NOT NULL
    ) AS customers_with_purchase_history
FROM public.customer_data
WHERE "Segmentation Group" IS NOT NULL
GROUP BY "Segmentation Group"
ORDER BY records_with_purchase_history DESC;



9. Customer Value: Which customers have both high income and high premium amounts?


SELECT
    "Customer ID",
    "Segmentation Group",
    "Income Level",
    "Premium Amount",
    "Policy Type"
FROM public.customer_data
WHERE "Income Level" IS NOT NULL
  AND "Premium Amount" IS NOT NULL
  AND "Income Level" >= (
      SELECT AVG("Income Level")
      FROM public.customer_data
  )
  AND "Premium Amount" >= (
      SELECT AVG("Premium Amount")
      FROM public.customer_data
  )
ORDER BY
    "Income Level" DESC,
    "Premium Amount" DESC;


10. Marketing Strategy: Which customer segment should the business target to increase insurance product sales?


SELECT
    "Segmentation Group",
    COUNT(DISTINCT "Customer ID") AS customer_count,
    ROUND(AVG("Income Level")::NUMERIC, 2) AS average_income,
    ROUND(AVG("Premium Amount")::NUMERIC, 2) AS average_premium,
    COUNT("Purchase History") AS records_with_purchase_history,
    ROUND(
        COUNT("Purchase History") * 100.0 / COUNT(*),
        2
    ) AS purchase_history_percentage
FROM public.customer_data
WHERE "Segmentation Group" IS NOT NULL
GROUP BY "Segmentation Group"
ORDER BY
    average_income DESC,
    average_premium DESC;

