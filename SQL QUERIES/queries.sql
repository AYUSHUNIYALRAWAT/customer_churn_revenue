SELECT 
COUNT(*) AS total_customers,
SUM(churn) AS churned ,
ROUND(AVG(churn)*100,2) AS churn_rate_pct
FROM subscriptions;


--churn rate according contract type
SELECT contract_type,
        COUNT(*) AS customers,
		ROUND(AVG(churn)*100,2) AS CHURN_RATE_PCT
		FROM subscriptions
		GROUP BY contract_type
		ORDER BY CHURN_RATE_PCT DESC;

--revenue loss by contraact_type
SELECT contract_type,
ROUND(SUM(monthly_charges*12)FILTER (WHERE churn = 1)) AS REVENUE_LOSS
FROM subscriptions
GROUP BY contract_type;

-- no of customer churned and churn rate according to city
SELECT c.city,
COUNT(*) AS customer,
ROUND(AVG(s.churn)*100,2) AS churn_rate_pct
FROM customer c
JOIN
subscriptions s 
ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY churn_rate_pct DESC;

--payment status 
SELECT payment_status,
       COUNT(*) AS payments,
       ROUND(COUNT(*)*100.0/SUM(COUNT(*))OVER(), 2 ) AS pct
FROM payment
GROUP BY payment_status
ORDER BY payments DESC;

--CHRUN RATE ACCORDING TO TICKET
WITH t AS (
     SELECT customer_id, COUNT(*) AS tickets
	 FROM support_ticket 
	 GROUP BY customer_id
)
SELECT LEAST(COALESCE(t.tickets,0),4 ) AS tickets,
       COUNT(*) AS customers,
	   ROUND(AVG(S.churn)*100,2) AS churn_rate_pct
FROM subscriptions s
LEFT JOIN t ON s.customer_id = t.customer_id
GROUP BY 1
ORDER BY 1;

--Active customers which are on risk
SELECT
    c.customer_id, c.city,s.contract_type,s.tenure_months,
	s.support_calls_12m,
	ROUND(s.monthly_charges * 12) AS annual_revenue
FROM subscriptions s
JOIN customer c ON c.customer_id = s.customer_id 
WHERE s.churn = 0
  AND s.contract_type = 'Month-to-month'
  AND s.tenure_months <= 12
  AND s.support_calls_12m >= 3
ORDER BY annual_revenue DESC
;


SELECT
    c.customer_id, c.city,s.contract_type,s.tenure_months,
	s.support_calls_12m,
	ROUND(s.monthly_charges * 12) AS annual_revenue
FROM subscriptions s
JOIN customer c ON c.customer_id = s.customer_id 
WHERE s.churn = 0
  AND s.contract_type = 'Month-to-month'
  AND s.tenure_months <= 12
  AND s.support_calls_12m >= 3
ORDER BY annual_revenue DESC
LIMIT 20;