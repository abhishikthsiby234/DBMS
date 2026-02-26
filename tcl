mysql> create database tcl;
Query OK, 1 row affected (0.03 sec)

mysql> use tcl;
Database changed
mysql> create table orderdetails(orderid int(10),productname varchar(20),orderno int(20),orderdate date);
Query OK, 0 rows affected, 2 warnings (0.05 sec)

mysql> insert into orderdetails values(1,'laptop',234,'2025-03-02');
Query OK, 1 row affected (0.01 sec)

mysql> insert into orderdetails values(2,'desktop',265,'2025-04-02');
Query OK, 1 row affected (0.01 sec)

mysql> insert into orderdetails values(3,'keyboard',305,'2025-05-13');
Query OK, 1 row affected (0.02 sec)

mysql> insert into orderdetails values(4,'mouse',376,'2025-06-3');
Query OK, 1 row affected (0.01 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into orderdetails values(6,'printer',426,'2025-07-12');
Query OK, 1 row affected (0.00 sec)

mysql> insert into orderdetails values(7,'scanner',766,'2025-08-12');
Query OK, 1 row affected (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.02 sec)

mysql> delete from orderdetails where orderid in(4,5);
Query OK, 1 row affected (0.00 sec)

mysql> select*from orderdetails;
+---------+-------------+---------+------------+
| orderid | productname | orderno | orderdate  |
+---------+-------------+---------+------------+
|       1 | laptop      |     234 | 2025-03-02 |
|       2 | desktop     |     265 | 2025-04-02 |
|       3 | keyboard    |     305 | 2025-05-13 |
|       6 | printer     |     426 | 2025-07-12 |
|       7 | scanner     |     766 | 2025-08-12 |
+---------+-------------+---------+------------+
5 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.03 sec)

mysql> select*from orderdetails;
+---------+-------------+---------+------------+
| orderid | productname | orderno | orderdate  |
+---------+-------------+---------+------------+
|       1 | laptop      |     234 | 2025-03-02 |
|       2 | desktop     |     265 | 2025-04-02 |
|       3 | keyboard    |     305 | 2025-05-13 |
|       6 | printer     |     426 | 2025-07-12 |
|       7 | scanner     |     766 | 2025-08-12 |
+---------+-------------+---------+------------+
5 rows in set (0.01 sec)

mysql> SAVEPOINT p_update;
Query OK, 0 rows affected (0.00 sec)

mysql> update orderdetails set productname='gaming keyboard' where orderno=305;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from orderdetails;
+---------+-----------------+---------+------------+
| orderid | productname     | orderno | orderdate  |
+---------+-----------------+---------+------------+
|       1 | laptop          |     234 | 2025-03-02 |
|       2 | desktop         |     265 | 2025-04-02 |
|       3 | gaming keyboard |     305 | 2025-05-13 |
|       6 | printer         |     426 | 2025-07-12 |
|       7 | scanner         |     766 | 2025-08-12 |
+---------+-----------------+---------+------------+
5 rows in set (0.00 sec)

mysql> insert into orderdetails values(8,'phone',789,'2025-09-02');
Query OK, 1 row affected (0.03 sec)

mysql> insert into orderdetails values(9,'smartwatch',809,'2025-09-22');
Query OK, 1 row affected (0.03 sec)

mysql> SAVEPOINT delt;
Query OK, 0 rows affected (0.00 sec)

mysql> delete from orderdetails where productname='desktop';
Query OK, 1 row affected (0.01 sec)

mysql> select*from orderdetails;
+---------+-----------------+---------+------------+
| orderid | productname     | orderno | orderdate  |
+---------+-----------------+---------+------------+
|       1 | laptop          |     234 | 2025-03-02 |
|       3 | gaming keyboard |     305 | 2025-05-13 |
|       6 | printer         |     426 | 2025-07-12 |
|       7 | scanner         |     766 | 2025-08-12 |
|       8 | phone           |     789 | 2025-09-02 |
|       9 | smartwatch      |     809 | 2025-09-22 |
+---------+-----------------+---------+------------+
6 rows in set (0.00 sec)


mysql> set autocommit=0;
Query OK, 0 rows affected (0.00 sec)

mysql> SAVEPOINT delt;
Query OK, 0 rows affected (0.00 sec)

mysql> update orderdetails set productname='gaming keyboard' where orderno=305;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 1  Changed: 0  Warnings: 0

mysql> ROLLBACK TO delt;
Query OK, 0 rows affected (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> set autocommit=1;
Query OK, 0 rows affected (0.00 sec)

mysql> 

