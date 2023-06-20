SELECT D.name AS Department, E.name AS Employee, E.salary AS Salary
FROM Employee AS E 
JOIN Department AS D ON E.departmentId = D.id, 
(
    SELECT E1.id, 
    DENSE_RANK() OVER(PARTITION BY E1.departmentId ORDER BY E1.salary DESC) AS ranking
    FROM Employee AS E1
) AS R
WHERE R.ranking <=3 AND R.id = E.id;