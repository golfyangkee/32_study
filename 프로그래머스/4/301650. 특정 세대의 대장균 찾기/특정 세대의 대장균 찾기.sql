-- ECOLI_DATA 테이블 확인
# SELECT *
# FROM ECOLI_DATA;
-- 1,2 는 부모 없고 3~8까지는 부모 있다.

-- 부모 개체 있는 대장균 
# SELECT *
# FROM ECOLI_DATA CHILD LEFT JOIN ECOLI_DATA PARENT ON (CHILD.PARENT_ID = PARENT.ID)
# WHERE CHILD.PARENT_ID IS NOT NULL;
# -- 3,4,5 는 조부모 없고 6,7,8은 조부모 있다.

-- 정답: 조부모의 부모는 없고 조부모까지만 있는 대장균, GRAND.PARENT_ID가 없어야 한다.
# SELECT CHILD.ID AS ID
# FROM ECOLI_DATA CHILD LEFT JOIN ECOLI_DATA PARENT ON (CHILD.PARENT_ID = PARENT.ID) LEFT JOIN ECOLI_DATA GRAND ON (PARENT.PARENT_ID = GRAND.ID)
# WHERE CHILD.PARENT_ID IS NOT NULL 
#     AND PARENT.PARENT_ID IS NOT NULL 
#     AND GRAND.PARENT_ID IS NULL
# ORDER BY 1;

-- RECURSIVE 사용
WITH RECURSIVE CTE AS (
    SELECT ID , PARENT_ID , 1 AS CNT  -- 최초 대장균은 1
    FROM ECOLI_DATA 
    WHERE PARENT_ID IS NULL
    
    UNION ALL
    
    SELECT A.ID , A.PARENT_ID, C.CNT +1 
    FROM ECOLI_DATA A JOIN CTE C ON A.PARENT_ID = C.ID
    )
    
SELECT ID 
FROM CTE 
WHERE CNT = 3 
ORDER BY 1;