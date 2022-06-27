#Synstax to define stored procedure
#we have to have DELIMITER, BIGIN, END.
#CREATE PROCEDURE procedure_name (IN parameter_name type, OUT output_name type )
DELIMITER $$
CREATE PROCEDURE `CustOrderHist`(IN AtCustomerID VARCHAR(5))
BEGIN
   SELECT
      ProductName,
      SUM(Quantity) as TOTAL
   FROM Products
      INNER JOIN OrderDetails USING(ProductID)
      INNER JOIN Orders USING (OrderID)
      INNER JOIN Customers USING (CustomerID)
   WHERE Customers.CustomerID = AtCustomerID
   GROUP BY ProductName;
END $$
DELIMITER ;

#check input parameter
SELECT * FROM Customers LIMIT 10;

#set varialbe with value
SET @CUSTOMER_ID = 'ANTON';

#call stored procedure with CALL keyword
CALL CustOrderHist(@CUSTOMER_ID);

