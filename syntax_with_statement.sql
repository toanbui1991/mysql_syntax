
#Example of using WITH statements to build temporary table    
WITH temporaryTable(averageValue) as
    (SELECT avg(Salary)
    from Employee)
        SELECT EmployeeID,Name, Salary 
        FROM Employee, temporaryTable 
        WHERE Employee.Salary > temporaryTable.averageValue;

#Example of using WITH statement with multiple temporary table and then using those temporary table        
WITH totalSalary(Airline, total) AS
    (SELECT Airline, sum(Salary)
    FROM Pilot
    GROUP BY Airline),
    ##############################
    airlineAverage(avgSalary) AS 
    (SELECT avg(Salary)
    FROM Pilot )
    ##############################
    SELECT Airline
    FROM totalSalary, airlineAverage
    WHERE totalSalary.total > airlineAverage.avgSalary;
    
#WITH statement without specified column name
#this example is from this link: https://www.tutorialspoint.com/mysql/mysql_with.htm#:~:text=A%20common%20table%20expression%20in,or%20more%20comms%2Dseparated%20subclauses.
WITH
   exp1 AS (SELECT ID, FIRST_NAME, LAST_NAME FROM EMPLOYEE),
   exp2 AS (SELECT EMAIL, PHONE FROM CONTACT)
SELECT * FROM exp1 JOIN exp2;

