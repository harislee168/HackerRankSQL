SELECT N, 'Root'
FROM BST
WHERE P IS NULL
UNION
SELECT N, 'Inner'
FROM BST
WHERE N IN (SELECT DISTINCT P FROM BST) AND P IS NOT NULL
UNION
SELECT N, 'Leaf'
FROM BST
WHERE N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL)
ORDER BY N;
