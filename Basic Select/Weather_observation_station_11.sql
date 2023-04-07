SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(UPPER(CITY), 1, 1) NOT IN ('A', 'E', 'I', 'O','U')
OR SUBSTR(UPPER(CITY), LENGTH(CITY), 1) NOT IN ('A', 'E', 'I', 'O','U');