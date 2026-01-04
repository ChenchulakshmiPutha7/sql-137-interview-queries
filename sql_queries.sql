
-- Q1. Retrieve all records from employees
SELECT * FROM employees;

-- Q2. Retrieve employee names only
SELECT emp_name FROM employees;

-- Q3. Find distinct department IDs
SELECT DISTINCT department_id FROM employees;

-- Q4. Employees with salary greater than 40000
SELECT * FROM employees WHERE salary > 40000;

-- Q5. Employees working in department 10
SELECT * FROM employees WHERE department_id = 10;

-- Q6. Sort employees by salary descending
SELECT * FROM employees ORDER BY salary DESC;

-- Q7. Top 5 highest paid employees
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- Q8. Count total employees
SELECT COUNT(*) AS total_employees FROM employees;

-- Q9. Find minimum salary
SELECT MIN(salary) FROM employees;

-- Q10. Find maximum salary
SELECT MAX(salary) FROM employees;

-- Q11. Find average salary
SELECT AVG(salary) FROM employees;

-- Q12. Total salary payout
SELECT SUM(salary) FROM employees;

-- Q13. Employees with NULL department
SELECT * FROM employees WHERE department_id IS NULL;

-- Q14. Employees whose name starts with A
SELECT * FROM employees WHERE emp_name LIKE 'A%';

-- Q15. Employees whose name contains 'an'
SELECT * FROM employees WHERE emp_name LIKE '%an%';

-- Q16. Employees joined after 2022
SELECT * FROM employees WHERE join_date > '2022-12-31';

-- Q17. Employees with salary between 30000 and 60000
SELECT * FROM employees WHERE salary BETWEEN 30000 AND 60000;

-- Q18. Employees in departments 10,20,30
SELECT * FROM employees WHERE department_id IN (10,20,30);

-- Q19. Rename salary column as monthly_salary
SELECT salary AS monthly_salary FROM employees;

-- Q20. Get current date
SELECT CURRENT_DATE;

-- Q21. Employees joined in current year
SELECT * FROM employees WHERE YEAR(join_date)=YEAR(CURDATE());

-- Q22. Employee count per department
SELECT department_id, COUNT(*) FROM employees GROUP BY department_id;

-- Q23. Departments having more than 5 employees
SELECT department_id FROM employees GROUP BY department_id HAVING COUNT(*)>5;

-- Q24. Highest salary per department
SELECT department_id, MAX(salary) FROM employees GROUP BY department_id;

-- Q25. Lowest salary per department
SELECT department_id, MIN(salary) FROM employees GROUP BY department_id;

-- Q26. Average salary per department
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id;

-- Q27. Departments ordered by employee count
SELECT department_id, COUNT(*) cnt FROM employees GROUP BY department_id ORDER BY cnt DESC;

-- Q28. Employees excluding department 10
SELECT * FROM employees WHERE department_id <> 10;

-- Q29. Count distinct departments
SELECT COUNT(DISTINCT department_id) FROM employees;

-- Q30. Employees ordered by join date
SELECT * FROM employees ORDER BY join_date;

-- Q31. Employees ordered by name
SELECT * FROM employees ORDER BY emp_name;

-- Q32. Employees with salary not null
SELECT * FROM employees WHERE salary IS NOT NULL;

-- Q33. Employees joined before 2020
SELECT * FROM employees WHERE join_date < '2020-01-01';

-- Q34. Display first 10 employees
SELECT * FROM employees LIMIT 10;

-- Q35. Employees with email ending gmail.com
SELECT * FROM employees WHERE email LIKE '%@gmail.com';

-- Q36. Employees with salary >= 50000
SELECT * FROM employees WHERE salary >= 50000;

-- Q37. Employees from HR or IT department
SELECT * FROM employees WHERE department_id IN (1,2);

-- Q38. Employees sorted by department then salary
SELECT * FROM employees ORDER BY department_id, salary DESC;

-- Q39. Total employees per joining year
SELECT YEAR(join_date), COUNT(*) FROM employees GROUP BY YEAR(join_date);

-- Q40. Employee name with department name
SELECT e.emp_name, d.department_name FROM employees e JOIN departments d ON e.department_id=d.department_id;

-- Q41. Employees without department
SELECT e.* FROM employees e LEFT JOIN departments d ON e.department_id=d.department_id WHERE d.department_id IS NULL;

-- Q42. Department-wise employee count
SELECT d.department_name, COUNT(e.emp_id) FROM departments d LEFT JOIN employees e ON d.department_id=e.department_id GROUP BY d.department_name;

-- Q43. Employees in HR department
SELECT e.* FROM employees e JOIN departments d ON e.department_id=d.department_id WHERE d.department_name='HR';

-- Q44. Orders with customer names
SELECT o.order_id, c.customer_name FROM orders o JOIN customers c ON o.customer_id=c.customer_id;

-- Q45. Customers without orders
SELECT c.* FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id WHERE o.order_id IS NULL;

-- Q46. Total orders per customer
SELECT customer_id, COUNT(*) FROM orders GROUP BY customer_id;

-- Q47. Total order amount per customer
SELECT customer_id, SUM(total_amount) FROM orders GROUP BY customer_id;

-- Q48. Customer with highest spending
SELECT customer_id FROM orders GROUP BY customer_id ORDER BY SUM(total_amount) DESC LIMIT 1;

-- Q49. Orders placed in 2024
SELECT * FROM orders WHERE YEAR(order_date)=2024;

-- Q50. Employees and their managers
SELECT e.emp_name, m.emp_name AS manager FROM employees e LEFT JOIN employees m ON e.manager_id=m.emp_id;

-- Q51. Employees working in same department
SELECT e1.emp_name, e2.emp_name FROM employees e1 JOIN employees e2 ON e1.department_id=e2.department_id AND e1.emp_id<>e2.emp_id;

-- Q52. Orders with customer and amount
SELECT o.order_id, c.customer_name, o.total_amount FROM orders o JOIN customers c ON o.customer_id=c.customer_id;

-- Q53. Customers with more than 3 orders
SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(*)>3;

-- Q54. Employees with department location
SELECT e.emp_name, d.location FROM employees e JOIN departments d ON e.department_id=d.department_id;

-- Q55. Departments without employees
SELECT d.* FROM departments d LEFT JOIN employees e ON d.department_id=e.department_id WHERE e.emp_id IS NULL;

-- Q56. Tickets with agent names
SELECT t.ticket_id, e.emp_name FROM tickets t JOIN employees e ON t.agent_id=e.emp_id;

-- Q57. Resolved tickets
SELECT * FROM tickets WHERE status='Resolved';

-- Q58. Unresolved tickets
SELECT * FROM tickets WHERE status<>'Resolved';

-- Q59. Tickets resolved per agent
SELECT agent_id, COUNT(*) FROM tickets WHERE status='Resolved' GROUP BY agent_id;

-- Q60. Agents with no tickets
SELECT e.emp_name FROM employees e LEFT JOIN tickets t ON e.emp_id=t.agent_id WHERE t.ticket_id IS NULL;

-- Q61. Orders with amount greater than average
SELECT * FROM orders WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

-- Q62. Employees in Sales department
SELECT e.* FROM employees e JOIN departments d ON e.department_id=d.department_id WHERE d.department_name='Sales';

-- Q63. Employees and department using RIGHT JOIN
SELECT e.emp_name, d.department_name FROM employees e RIGHT JOIN departments d ON e.department_id=d.department_id;

-- Q64. Orders with customer city
SELECT o.order_id, c.city FROM orders o JOIN customers c ON o.customer_id=c.customer_id;

-- Q65. Customers from India
SELECT * FROM customers WHERE country='India';

-- Q66. Orders count per month
SELECT MONTH(order_date), COUNT(*) FROM orders GROUP BY MONTH(order_date);

-- Q67. Orders revenue per month
SELECT MONTH(order_date), SUM(total_amount) FROM orders GROUP BY MONTH(order_date);

-- Q68. Employees working on projects
SELECT e.emp_name, p.project_name FROM employee_projects ep JOIN employees e ON ep.emp_id=e.emp_id JOIN projects p ON ep.project_id=p.project_id;

-- Q69. Projects with no employees
SELECT p.* FROM projects p LEFT JOIN employee_projects ep ON p.project_id=ep.project_id WHERE ep.emp_id IS NULL;

-- Q70. Employees count per project
SELECT project_id, COUNT(emp_id) FROM employee_projects GROUP BY project_id;

-- Q71. Employees working on multiple projects
SELECT emp_id FROM employee_projects GROUP BY emp_id HAVING COUNT(project_id)>1;

-- Q72. Projects handled by HR department
SELECT p.project_name FROM projects p JOIN employee_projects ep ON p.project_id=ep.project_id JOIN employees e ON ep.emp_id=e.emp_id JOIN departments d ON e.department_id=d.department_id WHERE d.department_name='HR';

-- Q73. Total salary per department
SELECT department_id, SUM(salary) FROM employees GROUP BY department_id;

-- Q74. Department with highest total salary
SELECT department_id FROM employees GROUP BY department_id ORDER BY SUM(salary) DESC LIMIT 1;

-- Q75. Orders and customers including unmatched
SELECT o.order_id, c.customer_name FROM orders o FULL JOIN customers c ON o.customer_id=c.customer_id;

-- Q76. Employees with duplicate names
SELECT emp_name FROM employees GROUP BY emp_name HAVING COUNT(*)>1;

-- Q77. Customers who placed orders in 2023
SELECT DISTINCT customer_id FROM orders WHERE YEAR(order_date)=2023;

-- Q78. Employees earning more than average salary
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

-- Q79. Second highest salary
SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);

-- Q80. Third highest salary
SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));

-- Q81. Employees in department with highest average salary
SELECT * FROM employees WHERE department_id=(SELECT department_id FROM employees GROUP BY department_id ORDER BY AVG(salary) DESC LIMIT 1);

-- Q82. Employees with same salary
SELECT salary FROM employees GROUP BY salary HAVING COUNT(*)>1;

-- Q83. Employees not in HR department
SELECT * FROM employees WHERE department_id NOT IN (SELECT department_id FROM departments WHERE department_name='HR');

-- Q84. Customers who never placed an order
SELECT * FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders);

-- Q85. Employees whose salary is above department average
SELECT * FROM employees e WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id=e.department_id);

-- Q86. Highest salary in each department
SELECT * FROM employees e WHERE salary=(SELECT MAX(salary) FROM employees WHERE department_id=e.department_id);

-- Q87. Employees hired earliest
SELECT * FROM employees WHERE join_date=(SELECT MIN(join_date) FROM employees);

-- Q88. Latest order
SELECT * FROM orders WHERE order_date=(SELECT MAX(order_date) FROM orders);

-- Q89. Customers with highest order amount
SELECT * FROM customers WHERE customer_id=(SELECT customer_id FROM orders ORDER BY total_amount DESC LIMIT 1);

-- Q90. Employees who are managers
SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL;

-- Q91. Employees without subordinates
SELECT * FROM employees WHERE emp_id NOT IN (SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL);

-- Q92. Departments with more than average employees
SELECT department_id FROM employees GROUP BY department_id HAVING COUNT(*) > (SELECT COUNT(*)/COUNT(DISTINCT department_id) FROM employees);

-- Q93. Orders placed on weekends
SELECT * FROM orders WHERE DAYOFWEEK(order_date) IN (1,7);

-- Q94. Customers with orders above 10000
SELECT DISTINCT customer_id FROM orders WHERE total_amount>10000;

-- Q95. Employees with longest tenure
SELECT * FROM employees ORDER BY join_date LIMIT 1;

-- Q96. Most recent hire
SELECT * FROM employees ORDER BY join_date DESC LIMIT 1;

-- Q97. Department with least employees
SELECT department_id FROM employees GROUP BY department_id ORDER BY COUNT(*) ASC LIMIT 1;

-- Q98. Employees earning median salary
SELECT * FROM employees WHERE salary=(SELECT AVG(salary) FROM (SELECT salary FROM employees ORDER BY salary LIMIT 2) t);

-- Q99. Orders with duplicate amounts
SELECT total_amount FROM orders GROUP BY total_amount HAVING COUNT(*)>1;

-- Q100. Employees with odd IDs
SELECT * FROM employees WHERE emp_id % 2 = 1;

-- Q101. Employees with even IDs
SELECT * FROM employees WHERE emp_id % 2 = 0;

-- Q102. Customers who placed more than average orders
SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(*) > (SELECT AVG(cnt) FROM (SELECT COUNT(*) cnt FROM orders GROUP BY customer_id) t);

-- Q103. Departments where avg salary > 50000
SELECT department_id FROM employees GROUP BY department_id HAVING AVG(salary)>50000;

-- Q104. Employees whose email is duplicate
SELECT email FROM employees GROUP BY email HAVING COUNT(*)>1;

-- Q105. Tickets resolved late
SELECT * FROM tickets WHERE DATEDIFF(resolved_date, created_date) > 3;

-- Q106. Agents with fastest resolution
SELECT agent_id FROM tickets GROUP BY agent_id ORDER BY AVG(DATEDIFF(resolved_date, created_date)) ASC LIMIT 1;

-- Q107. Orders with max quantity
SELECT * FROM orders ORDER BY quantity DESC LIMIT 1;

-- Q108. Employees with salary in top 10%
SELECT * FROM employees WHERE salary >= (SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY salary) FROM employees);

-- Q109. Customers active in last 30 days
SELECT DISTINCT customer_id FROM orders WHERE order_date >= CURDATE()-INTERVAL 30 DAY;

-- Q110. Employees with no email
SELECT * FROM employees WHERE email IS NULL;

-- Q111. Rank employees by salary
SELECT emp_name, salary, RANK() OVER(ORDER BY salary DESC) FROM employees;

-- Q112. Dense rank by department
SELECT emp_name, department_id, salary, DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) FROM employees;

-- Q113. Row number by joining date
SELECT emp_name, ROW_NUMBER() OVER(ORDER BY join_date) FROM employees;

-- Q114. Top 3 salaries using window function
SELECT * FROM (SELECT emp_name, salary, DENSE_RANK() OVER(ORDER BY salary DESC) rnk FROM employees) t WHERE rnk<=3;

-- Q115. Running total of salaries
SELECT emp_name, salary, SUM(salary) OVER(ORDER BY join_date) FROM employees;

-- Q116. Previous employee salary
SELECT emp_name, salary, LAG(salary) OVER(ORDER BY join_date) FROM employees;

-- Q117. Next employee salary
SELECT emp_name, salary, LEAD(salary) OVER(ORDER BY join_date) FROM employees;

-- Q118. Salary difference from previous
SELECT emp_name, salary, salary-LAG(salary) OVER(ORDER BY join_date) FROM employees;

-- Q119. Average salary per department using window
SELECT emp_name, AVG(salary) OVER(PARTITION BY department_id) FROM employees;

-- Q120. Max salary per department using window
SELECT emp_name, MAX(salary) OVER(PARTITION BY department_id) FROM employees;

-- Q121. Employee count per department using window
SELECT emp_name, COUNT(*) OVER(PARTITION BY department_id) FROM employees;

-- Q122. Cumulative orders amount
SELECT order_date, SUM(total_amount) OVER(ORDER BY order_date) FROM orders;

-- Q123. Monthly order rank
SELECT order_id, RANK() OVER(PARTITION BY MONTH(order_date) ORDER BY total_amount DESC) FROM orders;

-- Q124. Lag order amount
SELECT order_id, total_amount, LAG(total_amount) OVER(ORDER BY order_date) FROM orders;

-- Q125. Lead order amount
SELECT order_id, total_amount, LEAD(total_amount) OVER(ORDER BY order_date) FROM orders;

-- Q126. Difference between current and previous order
SELECT order_id, total_amount-total_amount FROM orders;

-- Q127. Ticket resolution rank
SELECT ticket_id, RANK() OVER(ORDER BY DATEDIFF(resolved_date,created_date)) FROM tickets;

-- Q128. Fastest resolved ticket
SELECT * FROM (SELECT ticket_id, DATEDIFF(resolved_date,created_date) d, RANK() OVER(ORDER BY d) r FROM tickets) t WHERE r=1;

-- Q129. Slowest resolved ticket
SELECT * FROM (SELECT ticket_id, DATEDIFF(resolved_date,created_date) d, RANK() OVER(ORDER BY d DESC) r FROM tickets) t WHERE r=1;

-- Q130. Employee salary percentile
SELECT emp_name, NTILE(4) OVER(ORDER BY salary) FROM employees;

-- Q131. Orders grouped into quartiles
SELECT order_id, NTILE(4) OVER(ORDER BY total_amount) FROM orders;

-- Q132. Employee salary compared to dept avg
SELECT emp_name, salary, salary-AVG(salary) OVER(PARTITION BY department_id) FROM employees;

-- Q133. Top salary per department using row_number
SELECT * FROM (SELECT emp_name, department_id, salary, ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) r FROM employees) t WHERE r=1;

-- Q134. Second highest salary per department
SELECT * FROM (SELECT emp_name, department_id, salary, DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) r FROM employees) t WHERE r=2;

-- Q135. Employees above department median
SELECT * FROM employees WHERE salary > (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary) FROM employees);

-- Q136. Orders moving average
SELECT order_date, AVG(total_amount) OVER(ORDER BY order_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) FROM orders;

-- Q137. Employee join gap
SELECT emp_name, DATEDIFF(join_date, LAG(join_date) OVER(ORDER BY join_date)) FROM employees;
