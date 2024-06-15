SELECT measurement_time::DATE "measurement_day",
        SUM(measurement_value) FILTER(WHERE row_num%2!=0) "odd_sum",
        SUM(measurement_value) FILTER(WHERE row_num%2=0) "even_sum"
FROM(SELECT measurement_id, measurement_value, measurement_time,
            ROW_NUMBER() OVER(PARTITION BY TO_CHAR(measurement_time,'DD/MM/YYYY')
                              ORDER BY measurement_time) "row_num"
    FROM measurements) T
GROUP BY measurement_day
ORDER BY measurement_day
