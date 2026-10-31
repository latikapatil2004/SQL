mysql> create procedure A()
    -> begin
    -> select*from members;
    -> end//
Query OK, 0 rows affected (0.14 sec)

mysql> call A();
    -> //
+-----------+---------------+-------------------+--------+
| member_id | member_name   | email             | city   |
+-----------+---------------+-------------------+--------+
|         1 | Amit Sharma   | amit@example.com  | Pune   |
|         2 | Priya Patil   | priya@example.com | Mumbai |
|         3 | Rahul Verma   | rahul@example.com | Pune   |
|         4 | Sneha Joshi   | sneha@example.com | Nashik |
|         5 | Karan Shah    | karan@example.com | Mumbai |
|         6 | Neha Kulkarni | neha@example.com  | Pune   |
+-----------+---------------+-------------------+--------+
6 rows in set (0.11 sec)

Query OK, 0 rows affected (0.15 sec)

mysql> create procedure B()
    -> begin
    -> select*from books;
    -> end;
    -> //
Query OK, 0 rows affected (0.03 sec)

mysql> call B();
    -> //
+---------+-------------------+--------------------+------------+--------+
| book_id | book_name         | author             | category   | price  |
+---------+-------------------+--------------------+------------+--------+
|     101 | The Alchemist     | Paulo Coelho       | Fiction    | 350.00 |
|     102 | Wings of Fire     | A.P.J. Abdul Kalam | Biography  | 280.00 |
|     103 | Atomic Habits     | James Clear        | Self Help  | 450.00 |
|     104 | Rich Dad Poor Dad | Robert Kiyosaki    | Finance    | 320.00 |
|     105 | Harry Potter      | J.K. Rowling       | Fantasy    | 500.00 |
|     106 | The Hobbit        | J.R.R. Tolkien     | Fantasy    | 400.00 |
|     107 | Ikigai            | Hector Garcia      | Self Help  | 300.00 |
|     108 | Clean Code        | Robert Martin      | Technology | 600.00 |
+---------+-------------------+--------------------+------------+--------+
8 rows in set (0.06 sec)

Query OK, 0 rows affected (0.11 sec)

mysql> create procedure c()
    -> begin
    -> select *from borrowrecords;
    -> end;
    -> //
Query OK, 0 rows affected (0.02 sec)

mysql> call c();
    -> //
+-----------+-----------+---------+-------------+-------------+
| borrow_id | member_id | book_id | borrow_date | return_date |
+-----------+-----------+---------+-------------+-------------+
|         1 |         1 |     101 | 2025-01-05  | 2025-01-15  |
|         2 |         2 |     102 | 2025-01-10  | 2025-01-20  |
|         3 |         1 |     103 | 2025-02-01  | NULL        |
|         4 |         3 |     105 | 2025-02-05  | 2025-02-18  |
|         5 |         4 |     104 | 2025-02-10  | NULL        |
|         6 |         2 |     101 | 2025-02-15  | 2025-02-25  |
|         7 |         5 |     106 | 2025-03-01  | NULL        |
|         8 |         3 |     108 | 2025-03-05  | 2025-03-15  |
|         9 |         6 |     102 | 2025-03-10  | NULL        |
|        10 |         4 |     103 | 2025-03-12  | NULL        |
|        11 |         1 |     105 | 2025-03-15  | 2025-03-25  |
|        12 |         5 |     107 | 2025-03-20  | NULL        |
+-----------+-----------+---------+-------------+-------------+
12 rows in set (0.03 sec)

Query OK, 0 rows affected (0.15 sec)



mysql> create procedure E(in cat varchar(50))
    -> begin
    -> select *from books where category=cat;
    -> end;
    -> //
Query OK, 0 rows affected (0.03 sec)

mysql> call E('fantacy');
    -> //
Empty set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call E('fiction');
    -> //
+---------+---------------+--------------+----------+--------+
| book_id | book_name     | author       | category | price  |
+---------+---------------+--------------+----------+--------+
|     101 | The Alchemist | Paulo Coelho | Fiction  | 350.00 |
+---------+---------------+--------------+----------+--------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)




mysql> create procedure F(in cityy varchar(50))
    -> begin
    -> select *from members where city=cityy;
    -> end;
    -> //
Query OK, 0 rows affected (0.02 sec)

mysql> call F('pune');
    -> //
+-----------+---------------+-------------------+------+
| member_id | member_name   | email             | city |
+-----------+---------------+-------------------+------+
|         1 | Amit Sharma   | amit@example.com  | Pune |
|         3 | Rahul Verma   | rahul@example.com | Pune |
|         6 | Neha Kulkarni | neha@example.com  | Pune |
+-----------+---------------+-------------------+------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> create procedure G(in amount int)
    -> begin
    -> select*from books where price>amount;
    -> end;
    -> //
Query OK, 0 rows affected (0.03 sec)

mysql> call G(200);
    -> //
+---------+-------------------+--------------------+------------+--------+
| book_id | book_name         | author             | category   | price  |
+---------+-------------------+--------------------+------------+--------+
|     101 | The Alchemist     | Paulo Coelho       | Fiction    | 350.00 |
|     102 | Wings of Fire     | A.P.J. Abdul Kalam | Biography  | 280.00 |
|     103 | Atomic Habits     | James Clear        | Self Help  | 450.00 |
|     104 | Rich Dad Poor Dad | Robert Kiyosaki    | Finance    | 320.00 |
|     105 | Harry Potter      | J.K. Rowling       | Fantasy    | 500.00 |
|     106 | The Hobbit        | J.R.R. Tolkien     | Fantasy    | 400.00 |
|     107 | Ikigai            | Hector Garcia      | Self Help  | 300.00 |
|     108 | Clean Code        | Robert Martin      | Technology | 600.00 |
+---------+-------------------+--------------------+------------+--------+
8 rows in set (0.01 sec)

Query OK, 0 rows affected (0.04 sec)

mysql> create procedure H(in author varchar(50))
    -> begin
    -> select *from books where author=author;
    -> end;
    -> //
Query OK, 0 rows affected (0.02 sec)

mysql> call H(Paulo Coelho);
    -> //
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Coelho)' at line 1
mysql> call H('Paulo Coelho');
    -> //
+---------+-------------------+--------------------+------------+--------+
| book_id | book_name         | author             | category   | price  |
+---------+-------------------+--------------------+------------+--------+
|     101 | The Alchemist     | Paulo Coelho       | Fiction    | 350.00 |
|     102 | Wings of Fire     | A.P.J. Abdul Kalam | Biography  | 280.00 |
|     103 | Atomic Habits     | James Clear        | Self Help  | 450.00 |
|     104 | Rich Dad Poor Dad | Robert Kiyosaki    | Finance    | 320.00 |
|     105 | Harry Potter      | J.K. Rowling       | Fantasy    | 500.00 |
|     106 | The Hobbit        | J.R.R. Tolkien     | Fantasy    | 400.00 |
|     107 | Ikigai            | Hector Garcia      | Self Help  | 300.00 |
|     108 | Clean Code        | Robert Martin      | Technology | 600.00 |
+---------+-------------------+--------------------+------------+--------+
8 rows in set (0.00 sec)

Query OK, 0 rows affected (0.04 sec)

mysql> create procedure F(in cityy varchar(50))
    -> begin
    -> select *from members where city=cityy;
    -> end;
    -> //
Query OK, 0 rows affected (0.02 sec)

mysql> call F('pune');
    -> //
+-----------+---------------+-------------------+------+
| member_id | member_name   | email             | city |
+-----------+---------------+-------------------+------+
|         1 | Amit Sharma   | amit@example.com  | Pune |
|         3 | Rahul Verma   | rahul@example.com | Pune |
|         6 | Neha Kulkarni | neha@example.com  | Pune |
+-----------+---------------+-------------------+------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> create procedure G(in amount int)
    -> begin
    -> select*from books where price>amount;
    -> end;
    -> //
Query OK, 0 rows affected (0.03 sec)

mysql> call G(200);
    -> //
+---------+-------------------+--------------------+------------+--------+
| book_id | book_name         | author             | category   | price  |
+---------+-------------------+--------------------+------------+--------+
|     101 | The Alchemist     | Paulo Coelho       | Fiction    | 350.00 |
|     102 | Wings of Fire     | A.P.J. Abdul Kalam | Biography  | 280.00 |
|     103 | Atomic Habits     | James Clear        | Self Help  | 450.00 |
|     104 | Rich Dad Poor Dad | Robert Kiyosaki    | Finance    | 320.00 |
|     105 | Harry Potter      | J.K. Rowling       | Fantasy    | 500.00 |
|     106 | The Hobbit        | J.R.R. Tolkien     | Fantasy    | 400.00 |
|     107 | Ikigai            | Hector Garcia      | Self Help  | 300.00 |
|     108 | Clean Code        | Robert Martin      | Technology | 600.00 |
+---------+-------------------+--------------------+------------+--------+
8 rows in set (0.01 sec)

Query OK, 0 rows affected (0.04 sec)

mysql> create procedure H(in author varchar(50))
    -> begin
    -> select *from books where author=author;
    -> end;
    -> //
Query OK, 0 rows affected (0.02 sec)

mysql> call H(Paulo Coelho);
    -> //
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Coelho)' at line 1
mysql> call H('Paulo Coelho');
    -> //
+---------+-------------------+--------------------+------------+--------+
| book_id | book_name         | author             | category   | price  |
+---------+-------------------+--------------------+------------+--------+
|     101 | The Alchemist     | Paulo Coelho       | Fiction    | 350.00 |
|     102 | Wings of Fire     | A.P.J. Abdul Kalam | Biography  | 280.00 |
|     103 | Atomic Habits     | James Clear        | Self Help  | 450.00 |
|     104 | Rich Dad Poor Dad | Robert Kiyosaki    | Finance    | 320.00 |
|     105 | Harry Potter      | J.K. Rowling       | Fantasy    | 500.00 |
|     106 | The Hobbit        | J.R.R. Tolkien     | Fantasy    | 400.00 |
|     107 | Ikigai            | Hector Garcia      | Self Help  | 300.00 |
|     108 | Clean Code        | Robert Martin      | Technology | 600.00 |
+---------+-------------------+--------------------+------------+--------+
8 rows in set (0.00 sec)

Query OK, 0 rows affected (0.04 sec)

mysql> create procedure I(in authr varchar(50)))
    -> ;
    -> //
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> create procedure I(in mid int)
    -> begin
    -> select *from members where member_id=mid;
    -> end;
    -> //
Query OK, 0 rows affected (0.03 sec)

mysql> call I(3);
    -> //
+-----------+-------------+-------------------+------+
| member_id | member_name | email             | city |
+-----------+-------------+-------------------+------+
|         3 | Rahul Verma | rahul@example.com | Pune |
+-----------+-------------+-------------------+------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> create procedure J(in authorname varchar(50))
    -> begin
    -> select*from books where author=authorname;
    -> end;
    -> //
Query OK, 0 rows affected (0.02 sec)

mysql> call J('J.R.R. Tolkien');
    -> //
+---------+------------+----------------+----------+--------+
| book_id | book_name  | author         | category | price  |
+---------+------------+----------------+----------+--------+
|     106 | The Hobbit | J.R.R. Tolkien | Fantasy  | 400.00 |
+---------+------------+----------------+----------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> create procedure K(in mid int)
    -> begin
    -> select *from members where member_id=mid;
    -> end;
    -> //
Query OK, 0 rows affected (0.03 sec)

mysql> call K(4);
    -> //
+-----------+-------------+-------------------+--------+
| member_id | member_name | email             | city   |
+-----------+-------------+-------------------+--------+
|         4 | Sneha Joshi | sneha@example.com | Nashik |
+-----------+-------------+-------------------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> create procedure L(in book_id int)
    -> begin
    -> select*from books where book_id=book_id;
    -> end;
    -> //
Query OK, 0 rows affected (0.02 sec)

mysql> call L(3);
    -> //
+---------+-------------------+--------------------+------------+--------+
| book_id | book_name         | author             | category   | price  |
+---------+-------------------+--------------------+------------+--------+
|     101 | The Alchemist     | Paulo Coelho       | Fiction    | 350.00 |
|     102 | Wings of Fire     | A.P.J. Abdul Kalam | Biography  | 280.00 |
|     103 | Atomic Habits     | James Clear        | Self Help  | 450.00 |
|     104 | Rich Dad Poor Dad | Robert Kiyosaki    | Finance    | 320.00 |
|     105 | Harry Potter      | J.K. Rowling       | Fantasy    | 500.00 |
|     106 | The Hobbit        | J.R.R. Tolkien     | Fantasy    | 400.00 |
|     107 | Ikigai            | Hector Garcia      | Self Help  | 300.00 |
|     108 | Clean Code        | Robert Martin      | Technology | 600.00 |
+---------+-------------------+--------------------+------------+--------+
8 rows in set (0.01 sec)

Query OK, 0 rows affected (0.05 sec)

mysql> call L(103);
    -> //
+---------+-------------------+--------------------+------------+--------+
| book_id | book_name         | author             | category   | price  |
+---------+-------------------+--------------------+------------+--------+
|     101 | The Alchemist     | Paulo Coelho       | Fiction    | 350.00 |
|     102 | Wings of Fire     | A.P.J. Abdul Kalam | Biography  | 280.00 |
|     103 | Atomic Habits     | James Clear        | Self Help  | 450.00 |
|     104 | Rich Dad Poor Dad | Robert Kiyosaki    | Finance    | 320.00 |
|     105 | Harry Potter      | J.K. Rowling       | Fantasy    | 500.00 |
|     106 | The Hobbit        | J.R.R. Tolkien     | Fantasy    | 400.00 |
|     107 | Ikigai            | Hector Garcia      | Self Help  | 300.00 |
|     108 | Clean Code        | Robert Martin      | Technology | 600.00 |
+---------+-------------------+--------------------+------------+--------+
8 rows in set (0.00 sec)

Query OK, 0 rows affected (0.04 sec)

mysql>




































































































































































































































































































