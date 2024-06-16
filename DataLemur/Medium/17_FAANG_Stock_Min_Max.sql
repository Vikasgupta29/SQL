with highest as(
    SELECT ticker, TO_CHAR(date, 'Mon-YYYY') as highest_mth, open as highest_open,
    ROW_NUMBER() OVER(PARTITION BY ticker ORDER BY open DESC) AS h_rank
    FROM stock_prices),
   
lowest as (
    SELECT ticker, TO_CHAR(date, 'Mon-YYYY') as lowest_mth, open as lowest_open,
    ROW_NUMBER() OVER(PARTITION BY ticker ORDER BY open ASC) AS l_rank
    FROM stock_prices)

SELECT h.ticker, highest_mth,highest_open,lowest_mth,lowest_open
FROM highest h
JOIN lowest l using(ticker)
WHERE h_rank=1 
AND l_rank=1
