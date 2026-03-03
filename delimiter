-- 1. Procedure to find the greatest of three numbers
DELIMITER //

CREATE PROCEDURE gof(
    IN a INT,
    IN b INT,
    IN c INT
)
BEGIN
    DECLARE greatest INT;

    IF a >= b AND a >= c THEN
        SET greatest = a;
    ELSEIF b >= a AND b >= c THEN
        SET greatest = b;
    ELSE
        SET greatest = c;
    END IF;

    SELECT greatest AS greatest_number;
END //

-- 2. Procedure to find factorial of a number
CREATE PROCEDURE find_fact(IN num INT)
BEGIN
    DECLARE fact BIGINT DEFAULT 1;
    DECLARE i INT DEFAULT 1;
    WHILE i <= num DO
        SET fact = fact * i;
        SET i = i + 1;
    END WHILE;
    SELECT fact AS factorial;
END //

-- 3. Procedure to find grade based on marks
CREATE PROCEDURE find_grade(IN mark INT)
BEGIN
    IF mark >= 90 THEN
        SELECT 'grade A' AS grade;
    ELSEIF mark >= 80 THEN
        SELECT 'grade B' AS grade;
    ELSEIF mark >= 70 THEN
        SELECT 'grade C' AS grade;
    ELSEIF mark >= 60 THEN
        SELECT 'grade D' AS grade;
    ELSE
        SELECT 'grade F' AS grade;
    END IF;
END //

-- 4. Procedure to reverse a number
CREATE PROCEDURE reverse_num(IN num INT)
BEGIN
    DECLARE rev INT DEFAULT 0;
    DECLARE remainder INT;
    WHILE num > 0 DO
        SET remainder = num % 10;
        SET rev = rev * 10 + remainder;
        SET num = num DIV 10;
    END WHILE;
    SELECT rev AS reversed_num;
END //

-- 5. Procedure to calculate sum of series from 1 to n
CREATE PROCEDURE sum_series(IN n INT)
BEGIN
    DECLARE total INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    WHILE i <= n DO
        SET total = total + i;
        SET i = i + 1;
    END WHILE;
    SELECT total AS sum_of_series;
END //

-- 6. Function to calculate sum of digits of a number
CREATE FUNCTION sum_of_digits(num INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT DEFAULT 0;
    DECLARE remainder INT;
    WHILE num > 0 DO
        SET remainder = num % 10;
        SET total = total + remainder;
        SET num = num DIV 10;
    END WHILE;
    RETURN total;
END //

-- 7. Table to store account details
CREATE TABLE account(
    account_id INT PRIMARY KEY,
    balance INT
);

-- 8. Procedure to withdraw amount from account
CREATE PROCEDURE withdraw_amount(IN acc_id INT, IN amount INT)
BEGIN
    DECLARE current_balance INT;
    SELECT balance INTO current_balance
    FROM account
    WHERE account_id = acc_id;
    IF current_balance IS NULL THEN
        SELECT 'Account does not exist' AS message;
    ELSEIF current_balance - amount >= 1000 THEN
        UPDATE account
        SET balance = balance - amount
        WHERE account_id = acc_id;
        SELECT 'Withdrawal successful' AS message;
    ELSE
        SELECT 'Minimum balance of 1000 must be maintained' AS message;
    END IF;
END //

-- 9. Table to store employee details
CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT
);

-- 10. Function to get salary of an employee
CREATE FUNCTION get_salary(e_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE emp_salary INT;
    SELECT salary INTO emp_salary FROM employee WHERE emp_id = e_id;
    RETURN emp_salary;
END //

DELIMITER ;
