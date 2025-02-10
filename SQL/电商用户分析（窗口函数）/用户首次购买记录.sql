SELECT  user_id,
  	order_date,
  	CASE 
    	   WHEN ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY order_date) = 1 
           THEN '首单' 
           ELSE '复购' 
        END AS order_type
FROM orders;
