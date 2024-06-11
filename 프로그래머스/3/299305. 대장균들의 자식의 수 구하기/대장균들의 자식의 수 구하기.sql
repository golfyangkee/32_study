SELECT A.ID, COUNT(B.ID) AS CHILD_COUNT
FROM ECOLI_DATA A LEFT JOIN ECOLI_DATA B ON A.ID = B.PARENT_ID
GROUP BY A.ID
ORDER BY A.ID;