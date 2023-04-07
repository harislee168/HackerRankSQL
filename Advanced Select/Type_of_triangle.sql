SELECT 
CASE 
WHEN A+B <= C OR A+C <= B OR B+C <= A THEN 'Not A Triangle'
WHEN (A = B AND A != C) OR (A = C AND B != C) OR (B = C AND A != C)THEN 'Isosceles'
WHEN A = B AND B = C THEN 'Equilateral'
ELSE 'Scalene'
END
FROM TRIANGLES;