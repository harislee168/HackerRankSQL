SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(UPPER(CITY), LENGTH(CITY), 1) NOT IN ('A', 'E', 'I', 'O','U');