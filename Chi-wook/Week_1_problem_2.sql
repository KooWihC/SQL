-- https://school.programmers.co.kr/learn/courses/30/lessons/301649
SELECT 
    ID, 
    (CASE
        WHEN PERC <= 0.25 THEN 'CRITICAL'
        WHEN PERC <= 0.5 THEN 'HIGH'
        WHEN PERC <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
        END)AS COLONY_NAME
FROM(SELECT 
     ID,
    PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS PERC
    FROM ECOLI_DATA
    ) AS TMP -- 임시로 테이블 만들기
ORDER BY ID;

# SELECT 
#      ID,
#     PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS PERC
# FROM ECOLI_DATA
