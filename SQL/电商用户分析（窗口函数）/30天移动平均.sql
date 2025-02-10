SELECT order_date,
       amount,
       AVG(amount) OVER (
    	    ORDER BY order_date 
            ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
  	) AS 30d_moving_avg
FROM orders;
