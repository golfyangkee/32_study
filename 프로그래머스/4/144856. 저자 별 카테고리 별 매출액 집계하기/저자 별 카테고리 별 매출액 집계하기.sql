-- 1차
# SELECT AUTHOR_ID, AUTHOR_NAME, CATEGORY, AMOUNT*PRICE AS TOTAL_SALES
# FROM (SELECT BOOK_ID, SUM(SALES) AS AMOUNT
#       FROM BOOK_SALES
#       WHERE SALES_DATE LIKE "2022-01%"
#       GROUP BY BOOK_ID) S
#     JOIN BOOK B USING (BOOK_ID) JOIN AUTHOR A USING(AUTHOR_ID)
# # 다 있을 테니 INNER 조인하든 LEFT 조인하든 상관 없음
# GROUP BY AUTHOR_ID, AUTHOR_NAME, CATEGORY
# ORDER BY AUTHOR_ID, CATEGORY DESC;

-- 2차
SELECT AUTHOR_ID, AUTHOR_NAME, CATEGORY, SUM(SALES*PRICE) AS TOTAL_SALES
FROM BOOK_SALES BS JOIN BOOK B USING (BOOK_ID) JOIN AUTHOR A USING(AUTHOR_ID) # 다 있을 테니 INNER 조인하든 LEFT 조인하든 상관 없음
WHERE SALES_DATE LIKE "2022-01%"
GROUP BY AUTHOR_ID, AUTHOR_NAME, CATEGORY
ORDER BY AUTHOR_ID, CATEGORY DESC;
-- BOOK_ID별 2022년 1월 판매량
# SELECT BOOK_ID, SUM(SALES) AS AMOUNT
# FROM BOOK_SALES
# WHERE SALES_DATE LIKE "2022-01%"
# GROUP BY BOOK_ID

-- BOOK_SALES 확인
# SELECT *, SUM(SALES)
# FROM BOOK_SALES
# WHERE SALES_DATE LIKE "2022-01%" AND BOOK_ID = 1
-- 1, 2022-01-02, 3, 35 SUM을 써서 맨 위 ROW랑 SUM한게 나옴

-- BOOK 확인
# SELECT *
# FROM BOOK
# WHERE BOOK_ID=1
-- 1, 경제, 1, 9000, 2020-01-10

-- AUTHOR 확인
# SELECT *
# FROM AUTHOR
# WHERE AUTHOR_ID =1
-- 1, 홍길동