SELECT user_id,
       order_date,
       amount,
       RANK() OVER (
	     PARTITION BY user_id 
	     ORDER BY amount DESC
       ) AS user_rank
FROM orders;
