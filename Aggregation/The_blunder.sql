/*
First find the average with 0 AVG(SALARY)
Minus
First must converT the salary to character
Second replace the salary character 0 with ''
Convert back the Salary without 0 to number
Get the average
And use ceil to round up
*/

SELECT CEIL(AVG(SALARY) - AVG(TO_NUMBER(REPLACE(TO_CHAR(Salary), '0', ''))))
FROM EMPLOYEES;