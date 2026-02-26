CREATE USER 'user'@'localhost' IDENTIFIED BY 'password123';

GRANT ALL PRIVILEGES 
ON tcl.order_details 
TO 'user'@'localhost';

REVOKE DELETE 
ON tcl.order_details 
FROM 'user'@'localhost';

-- Check privileges
SHOW GRANTS FOR 'user'@'localhost';
