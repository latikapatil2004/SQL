mysql> create view MemberBookHistory as
    -> select m.member_name,b.book_name, b.author,br.borrow_date, br.return_date from books join borrowrecords  br on br.book_id=b.book_id  join members m on m.member_id=br.member_id;
ERROR 1054 (42S22): Unknown column 'b.book_name' in 'field list'
mysql> create view MemberBookHistory as
    -> select m.member_name,b.book_name, b.author,br.borrow_date, br.return_date from books b  join borrowrecords  br on br.book_id=b.book_id  join members m on m.member_id=br.member_id;
Query OK, 0 rows affected (0.10 sec)

mysql> select*from MemberBookHistory;
+---------------+-------------------+--------------------+-------------+-------------+
| member_name   | book_name         | author             | borrow_date | return_date |
+---------------+-------------------+--------------------+-------------+-------------+
| Amit Sharma   | The Alchemist     | Paulo Coelho       | 2025-01-05  | 2025-01-15  |
| Priya Patil   | Wings of Fire     | A.P.J. Abdul Kalam | 2025-01-10  | 2025-01-20  |
| Amit Sharma   | Atomic Habits     | James Clear        | 2025-02-01  | NULL        |
| Rahul Verma   | Harry Potter      | J.K. Rowling       | 2025-02-05  | 2025-02-18  |
| Sneha Joshi   | Rich Dad Poor Dad | Robert Kiyosaki    | 2025-02-10  | NULL        |
| Priya Patil   | The Alchemist     | Paulo Coelho       | 2025-02-15  | 2025-02-25  |
| Karan Shah    | The Hobbit        | J.R.R. Tolkien     | 2025-03-01  | NULL        |
| Rahul Verma   | Clean Code        | Robert Martin      | 2025-03-05  | 2025-03-15  |
| Neha Kulkarni | Wings of Fire     | A.P.J. Abdul Kalam | 2025-03-10  | NULL        |
| Sneha Joshi   | Atomic Habits     | James Clear        | 2025-03-12  | NULL        |
| Amit Sharma   | Harry Potter      | J.K. Rowling       | 2025-03-15  | 2025-03-25  |
| Karan Shah    | Ikigai            | Hector Garcia      | 2025-03-20  | NULL        |
+---------------+-------------------+--------------------+-------------+-------------+
12 rows in set (0.19 sec)

mysql> create view UnreturnedBookDetails as
    -> select m.member_id, m.member_name,b.book_name , b.category,br.borrow_date from members m inner join borrowrecords b on b.member_id=m.member_id inner join books b on b.book_id=br.book_id where br.return_date is null;
ERROR 1066 (42000): Not unique table/alias: 'b'
mysql> create view UnreturnedBookDetails as
    -> select m.member_id, m.member_name,b.book_name , b.category,br.borrow_date from members m inner join borrowrecords b on b.member_id=m.member_id inner join books b on b.book_id=br.book_id where br.return_date is null;
ERROR 1066 (42000): Not unique table/alias: 'b'
mysql> create view UnreturnedBookDetails as
    -> select m.member_id, m.member_name,b.book_name , b.category,br.borrow_date from members m inner join borrowrecords br on br.member_id=m.member_id inner join books b on b.book_id=br.book_id where br.return_date is null;
Query OK, 0 rows affected (0.04 sec)

mysql> select*from UnreturnedBookDetails;
+-----------+---------------+-------------------+-----------+-------------+
| member_id | member_name   | book_name         | category  | borrow_date |
+-----------+---------------+-------------------+-----------+-------------+
|         1 | Amit Sharma   | Atomic Habits     | Self Help | 2025-02-01  |
|         4 | Sneha Joshi   | Rich Dad Poor Dad | Finance   | 2025-02-10  |
|         5 | Karan Shah    | The Hobbit        | Fantasy   | 2025-03-01  |
|         6 | Neha Kulkarni | Wings of Fire     | Biography | 2025-03-10  |
|         4 | Sneha Joshi   | Atomic Habits     | Self Help | 2025-03-12  |
|         5 | Karan Shah    | Ikigai            | Self Help | 2025-03-20  |
+-----------+---------------+-------------------+-----------+-------------+
6 rows in set (0.01 sec)

mysql> create view MemberBorrowingDetails as
    -> select m.member_name,m.city,b.book_name , b.category,b.price from  members m inner join borrowrecords br on br.member_id=m.member_id inner join books b on b.book_id=br.book_id where br.borrow_id is not null;
Query OK, 0 rows affected (0.03 sec)

mysql> select*from MemberBorrowingDetails;
+---------------+--------+-------------------+------------+--------+
| member_name   | city   | book_name         | category   | price  |
+---------------+--------+-------------------+------------+--------+
| Amit Sharma   | Pune   | The Alchemist     | Fiction    | 350.00 |
| Amit Sharma   | Pune   | Atomic Habits     | Self Help  | 450.00 |
| Amit Sharma   | Pune   | Harry Potter      | Fantasy    | 500.00 |
| Priya Patil   | Mumbai | Wings of Fire     | Biography  | 280.00 |
| Priya Patil   | Mumbai | The Alchemist     | Fiction    | 350.00 |
| Rahul Verma   | Pune   | Harry Potter      | Fantasy    | 500.00 |
| Rahul Verma   | Pune   | Clean Code        | Technology | 600.00 |
| Sneha Joshi   | Nashik | Rich Dad Poor Dad | Finance    | 320.00 |
| Sneha Joshi   | Nashik | Atomic Habits     | Self Help  | 450.00 |
| Karan Shah    | Mumbai | The Hobbit        | Fantasy    | 400.00 |
| Karan Shah    | Mumbai | Ikigai            | Self Help  | 300.00 |
| Neha Kulkarni | Pune   | Wings of Fire     | Biography  | 280.00 |
+---------------+--------+-------------------+------------+--------+
12 rows in set (0.01 sec)

mysql> create view  PuneMemberBorrowing as
    -> select m.member_name,m.email,b.book_name , br.borrow_date from  members m inner join borrowrecords br on br.member_id=m.member_id inner join books b on b.book_id=br.book_id where m.city='pune;;
    '> ;
    '> ^C
mysql> create view  PuneMemberBorrowing as
    -> select m.member_name,m.email,b.book_name , br.borrow_date from  members m inner join borrowrecords br on br.member_id=m.member_id inner join books b on b.book_id=br.book_id where m.city='pune';
Query OK, 0 rows affected (0.05 sec)

mysql> select* from PuneMemberBorrowing;
+---------------+-------------------+---------------+-------------+
| member_name   | email             | book_name     | borrow_date |
+---------------+-------------------+---------------+-------------+
| Amit Sharma   | amit@example.com  | The Alchemist | 2025-01-05  |
| Amit Sharma   | amit@example.com  | Atomic Habits | 2025-02-01  |
| Amit Sharma   | amit@example.com  | Harry Potter  | 2025-03-15  |
| Rahul Verma   | rahul@example.com | Harry Potter  | 2025-02-05  |
| Rahul Verma   | rahul@example.com | Clean Code    | 2025-03-05  |
| Neha Kulkarni | neha@example.com  | Wings of Fire | 2025-03-10  |
+---------------+-------------------+---------------+-------------+
6 rows in set (0.01 sec)

mysql> create view  ExpensiveBookBorrowers as
    -> select m.member_name,b.book_name ,b.author,b.price  from  books b inner join books b on b.book_id=br.book_id where b.price>350;
ERROR 1054 (42S22): Unknown column 'm.member_name' in 'field list'
mysql> create view  ExpensiveBookBorrowers as
    -> select m.member_name,b.book_name ,b.author,b.price  from  books b inner join books b on b.book_id=br.book_id inner join members m  br.member_id=m.memberid where b.price>350;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'br.member_id=m.memberid where b.price>350' at line 2
mysql> create view  ExpensiveBookBorrowers as
    -> select m.member_name,b.book_name ,b.author,b.price  from  books b inner join books b on b.book_id=br.book_id inner join members m  br.member_id=m.member_id where b.price>350;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'br.member_id=m.member_id where b.price>350' at line 2
mysql> create view  ExpensiveBookBorrowers as
    -> select m.member_name,b.book_name ,b.author,b.price  from  books b inner join borrowrecords br on b.book_id=br.book_id inner join members m  br.member_id=m.member_id where b.price>350;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'br.member_id=m.member_id where b.price>350' at line 2
mysql> create view  ExpensiveBookBorrowers as
    -> select m.member_name,b.book_name ,b.author,b.price  from  books b inner join borrowrecords br on b.book_id=br.book_id inner join members m  br.member_id=m.member_id where b.price>350;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'br.member_id=m.member_id where b.price>350' at line 2
mysql> create view  ExpensiveBookBorrowers as
    -> select m.member_name,b.book_name ,b.author,b.price  from  books b inner join borrowrecords br on b.book_id=br.book_id inner join members m  br.member_id=m.member_id where b.price>350;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'br.member_id=m.member_id where b.price>350' at line 2
mysql> create view  ExpensiveBookBorrowers as
    -> select m.member_name,b.book_name ,b.author,b.price  from  books b inner join borrowrecords br on b.book_id=br.book_id inner join members m  on br.member_id=m.member_id where b.price>350;
Query OK, 0 rows affected (0.04 sec)

mysql> select *from ExpensiveBookBorrowers;
+-------------+---------------+----------------+--------+
| member_name | book_name     | author         | price  |
+-------------+---------------+----------------+--------+
| Amit Sharma | Atomic Habits | James Clear    | 450.00 |
| Sneha Joshi | Atomic Habits | James Clear    | 450.00 |
| Rahul Verma | Harry Potter  | J.K. Rowling   | 500.00 |
| Amit Sharma | Harry Potter  | J.K. Rowling   | 500.00 |
| Karan Shah  | The Hobbit    | J.R.R. Tolkien | 400.00 |
| Rahul Verma | Clean Code    | Robert Martin  | 600.00 |
+-------------+---------------+----------------+--------+
6 rows in set (0.01 sec)

mysql> create view MemberTotalSpending as select m.meber_id , m.member_name , sum(b.price) from members m inner join borrowrecords on m.member_id=br.member_id inner join books b on b.book_id = br.  book_id group by  m.meber_id , m.member_name , sum(b.price)  ;
ERROR 1054 (42S22): Unknown column 'm.meber_id' in 'field list'
mysql> create view MemberTotalSpending as select m.member_id , m.member_name , sum(b.price) from members m inner join borrowrecords on m.member_id=br.member_id inner join books b on b.book_id = br.  book_id group by  m.meber_id , m.member_name , sum(b.price)  ;
ERROR 1054 (42S22): Unknown column 'br.book_id' in 'on clause'
mysql> create view MemberTotalSpending as select m.member_id , m.member_name , sum(b.price) from members m inner join borrowrecords br  on m.member_id=br.member_id inner join books b on b.book_id = br.book_id group by  m.meber_id , m.member_name , sum(b.price)  ;
ERROR 1054 (42S22): Unknown column 'm.meber_id' in 'group statement'
mysql>  create view MemberTotalSpending as select m.member_id,m.member_name , sum(b.price) from members m inner join borrowrecords  br on m.member_id=br.member_id inner join books b on b.book_id = br.book_id group by  m.member_id , m.member_name , sum(b.price);
ERROR 1056 (42000): Can't group on 'sum(b.price)'
mysql>  create view MemberTotalSpending as select m.member_id,m.member_name , sum(b.price) from members m inner join borrowrecords  br on m.member_id=br.member_id inner join books b on b.book_id = br.book_id group by  m.member_id , m.member_name;
Query OK, 0 rows affected (0.02 sec)

mysql> select*from  create view MemberTotalSpending as select m.member_id , m.member_name , sum(b.price) from members m inner join borrowrecords br  on m.member_id=br.member_id inner join books b on b.book_id = br.book_id group by  m.meber_id , m.member_name , sum(b.price);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'create view MemberTotalSpending as select m.member_id , m.member_name , sum(b.pr' at line 1
mysql> select *from MemberTotalSpending;
+-----------+---------------+--------------+
| member_id | member_name   | sum(b.price) |
+-----------+---------------+--------------+
|         1 | Amit Sharma   |      1300.00 |
|         2 | Priya Patil   |       630.00 |
|         3 | Rahul Verma   |      1100.00 |
|         4 | Sneha Joshi   |       770.00 |
|         5 | Karan Shah    |       700.00 |
|         6 | Neha Kulkarni |       280.00 |
+-----------+---------------+--------------+
6 rows in set (0.03 sec)

mysql> create view CategoryBorrowingStats as  select b.book_category,count(br.book_id)as total_books from books inner join bookrecords br on br.book_id=b.book_id ;
ERROR 1146 (42S02): Table 'test.bookrecords' doesn't exist
mysql> create view CategoryBorrowingStats as  select b.book_category,count(br.book_id)as total_books from books inner join borrowrecords br on br.book_id=b.book_id ;
ERROR 1054 (42S22): Unknown column 'b.book_category' in 'field list'
mysql> create view CategoryBorrowingStats as  select b.category,count(br.book_id)as total_books from books inner join borrowrecords br on br.book_id=b.book_id;
ERROR 1054 (42S22): Unknown column 'b.category' in 'field list'
mysql> create view CategoryBorrowingStats as  select b.category,count(br.book_id)as total_books from books inner join borrowrecords br on br.book_id=b.book_id;
ERROR 1054 (42S22): Unknown column 'b.category' in 'field list'
mysql> select*from books;
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

mysql> create view CategoryBorrowingStats as  select b.category,count(br.book_id)as total_books from books b inner join borrowrecords br on br.book_id=b.book_id;
Query OK, 0 rows affected (0.03 sec)

mysql> select * CategoryBorrowingStats;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CategoryBorrowingStats' at line 1
mysql> select * from CategoryBorrowingStats;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'test.b.category'; this is incompatible with sql_mode=only_full_group_by
mysql> create view CategoryBorrowingStats as  select b.category,count(br.book_id)as total_books from books inner join borrowrecords br on br.book_id=b.book_id group by b.category;
ERROR 1054 (42S22): Unknown column 'b.category' in 'field list'
mysql> create view CategoryBorrowingStats as  select b.category,count(br.book_id)as total_books from books b inner join borrowrecords br on br.book_id=b.book_id group by b.category;
ERROR 1050 (42S01): Table 'CategoryBorrowingStats' already exists
mysql> create view CategoryBorrowingStat as  select b.category,count(br.book_id)as total_books from books b inner join borrowrecords br on br.book_id=b.book_id group by b.category;
Query OK, 0 rows affected (0.03 sec)

mysql> select *from CategoryBorrowingStat;
+------------+-------------+
| category   | total_books |
+------------+-------------+
| Fiction    |           2 |
| Biography  |           2 |
| Self Help  |           3 |
| Finance    |           1 |
| Fantasy    |           3 |
| Technology |           1 |
+------------+-------------+
6 rows in set (0.00 sec)

mysql> create view MemberAverageBookPrice  as
    -> select m.member_name,avg(b.price) as AvgBookPrice from member m inner join borrowrecords br on m.member_id =br.member_id inner join books b  on b.book_id=br.book_id group by m.member_id;
ERROR 1146 (42S02): Table 'test.member' doesn't exist
mysql> select m.member_name,avg(b.price) as AvgBookPrice from members m inner join borrowrecords br on m.member_id =br.member_id inner join books b  on b.book_id=br.book_id group by m.member_id;
+---------------+--------------+
| member_name   | AvgBookPrice |
+---------------+--------------+
| Amit Sharma   |   433.333333 |
| Priya Patil   |   315.000000 |
| Rahul Verma   |   550.000000 |
| Sneha Joshi   |   385.000000 |
| Karan Shah    |   350.000000 |
| Neha Kulkarni |   280.000000 |
+---------------+--------------+
6 rows in set (0.01 sec)

mysql> create view most as select m.member_name,avg(b.price) as AvgBookPrice from members m inner join borrowrecords br on m.member_id =br.member_id inner join books b  on b.book_id=br.book_id group by m.member_id;
Query OK, 0 rows affected (0.03 sec)

mysql> select*from most ;
+---------------+--------------+
| member_name   | AvgBookPrice |
+---------------+--------------+
| Amit Sharma   |   433.333333 |
| Priya Patil   |   315.000000 |
| Rahul Verma   |   550.000000 |
| Sneha Joshi   |   385.000000 |
| Karan Shah    |   350.000000 |
| Neha Kulkarni |   280.000000 |
+---------------+--------------+
6 rows in set (0.00 sec)
