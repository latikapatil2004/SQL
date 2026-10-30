mysql> select member_name ,city from members;
+---------------+--------+
| member_name   | city   |
+---------------+--------+
| Amit Sharma   | Pune   |
| Priya Patil   | Mumbai |
| Rahul Verma   | Pune   |
| Sneha Joshi   | Nashik |
| Karan Shah    | Mumbai |
| Neha Kulkarni | Pune   |
+---------------+--------+
6 rows in set (0.01 sec)

mysql> select * from borrowrecords;
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
12 rows in set (0.00 sec)

mysql> select book_name,title from books;
ERROR 1054 (42S22): Unknown column 'title' in 'field list'
mysql> select book_name as title from books;
+-------------------+
| title             |
+-------------------+
| The Alchemist     |
| Wings of Fire     |
| Atomic Habits     |
| Rich Dad Poor Dad |
| Harry Potter      |
| The Hobbit        |
| Ikigai            |
| Clean Code        |
+-------------------+
8 rows in set (0.00 sec)

mysql> select member_name as Member_name from members;
+---------------+
| Member_name   |
+---------------+
| Amit Sharma   |
| Priya Patil   |
| Rahul Verma   |
| Sneha Joshi   |
| Karan Shah    |
| Neha Kulkarni |
+---------------+
6 rows in set (0.00 sec)

mysql> select distinct book_name from books;
+-------------------+
| book_name         |
+-------------------+
| The Alchemist     |
| Wings of Fire     |
| Atomic Habits     |
| Rich Dad Poor Dad |
| Harry Potter      |
| The Hobbit        |
| Ikigai            |
| Clean Code        |
+-------------------+
8 rows in set (0.01 sec)

mysql> select count(book_name) as total count from books;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'count from books' at line 1
mysql> select count(book_name) as total_count from books;
+-------------+
| total_count |
+-------------+
|           8 |
+-------------+
1 row in set (0.01 sec)

mysql> select count(*) as total_count from books;
+-------------+
| total_count |
+-------------+
|           8 |
+-------------+
1 row in set (0.01 sec)

mysql> select count(member_name) as total_count from books;
ERROR 1054 (42S22): Unknown column 'member_name' in 'field list'
mysql> select count(member_name) as total_count from members;
+-------------+
| total_count |
+-------------+
|           6 |
+-------------+
1 row in set (0.00 sec)

mysql> select book_name from books where price>=350;
+---------------+
| book_name     |
+---------------+
| The Alchemist |
| Atomic Habits |
| Harry Potter  |
| The Hobbit    |
| Clean Code    |
+---------------+
5 rows in set (0.01 sec)

mysql> select book_name from books where price<=400;
+-------------------+
| book_name         |
+-------------------+
| The Alchemist     |
| Wings of Fire     |
| Rich Dad Poor Dad |
| The Hobbit        |
| Ikigai            |
+-------------------+
5 rows in set (0.00 sec)

mysql> select book_name from books where price=300;
+-----------+
| book_name |
+-----------+
| Ikigai    |
+-----------+
1 row in set (0.00 sec)

mysql> INSERT INTO BorrowRecords
    -> (borrow_id, member_id, book_id, borrow_date, return_date)
    -> VALUES
    -> (1, 1, 101, '2025-01-05', '2025-01-15'),
    -> (2, 2, 102, '2025-01-10', '2025-01-20'),
    -> (3, 1, 103, '2025-02-01', NULL),
    -> (4, 3, 105, '2025-02-05', '2025-02-18'),
    -> (5, 4, 104, '2025-02-10', NULL),
    -> (6, 2, 101, '2025-02-15', '2025-02-25'),
    -> (7, 5, 106, '2025-03-01', NULL),
    -> (8, 3, 108, '2025-03-05', '2025-03-15'),
    -> (9, 6, 102, '2025-03-10', NULL),
    -> (10, 4, 103, '2025-03-12', NULL),
    -> (11, 1, 105, '2025-03-15', '2025-03-25'),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 14
mysql>
mysql> select book_name from books where price>=300 and price<=500;
+-------------------+
| book_name         |
+-------------------+
| The Alchemist     |
| Atomic Habits     |
| Rich Dad Poor Dad |
| Harry Potter      |
| The Hobbit        |
| Ikigai            |
+-------------------+
6 rows in set (0.00 sec)

mysql> select book_name from books where category='Fantasy';
+--------------+
| book_name    |
+--------------+
| Harry Potter |
| The Hobbit   |
+--------------+
2 rows in set (0.00 sec)

mysql> select book_name from books where category='Fantasy' or category='Fiction';
+---------------+
| book_name     |
+---------------+
| The Alchemist |
| Harry Potter  |
| The Hobbit    |
+---------------+
3 rows in set (0.00 sec)

mysql> select book_name from books where category!='Fantasy';
+-------------------+
| book_name         |
+-------------------+
| The Alchemist     |
| Wings of Fire     |
| Atomic Habits     |
| Rich Dad Poor Dad |
| Ikigai            |
| Clean Code        |
+-------------------+
6 rows in set (0.00 sec)

mysql> select book_name from books where author='James Clear';
+---------------+
| book_name     |
+---------------+
| Atomic Habits |
+---------------+
1 row in set (0.00 sec)

mysql> select book_name from books where book_name like 'the%';
+---------------+
| book_name     |
+---------------+
| The Alchemist |
| The Hobbit    |
+---------------+
2 rows in set (0.01 sec)

mysql> select book_name from books where book_name like '%Code';
+------------+
| book_name  |
+------------+
| Clean Code |
+------------+
1 row in set (0.00 sec)

mysql> select book_name from books where book_name like '%Dad%';
+-------------------+
| book_name         |
+-------------------+
| Rich Dad Poor Dad |
+-------------------+
1 row in set (0.00 sec)

mysql> select member_name from members where city='pune';
+---------------+
| member_name   |
+---------------+
| Amit Sharma   |
| Rahul Verma   |
| Neha Kulkarni |
+---------------+
3 rows in set (0.00 sec)



mysql> create view Book_details
    -> as
    -> select book_name,author,price from
    -> book;
ERROR 1146 (42S02): Table 'test.book' doesn't exist
mysql> create view Book_details
    -> as
    -> select book_name,author,price from
    -> books;
Query OK, 0 rows affected (0.03 sec)

mysql> select*from Book_deTails;
+-------------------+--------------------+--------+
| book_name         | author             | price  |
+-------------------+--------------------+--------+
| The Alchemist     | Paulo Coelho       | 350.00 |
| Wings of Fire     | A.P.J. Abdul Kalam | 280.00 |
| Atomic Habits     | James Clear        | 450.00 |
| Rich Dad Poor Dad | Robert Kiyosaki    | 320.00 |
| Harry Potter      | J.K. Rowling       | 500.00 |
| The Hobbit        | J.R.R. Tolkien     | 400.00 |
| Ikigai            | Hector Garcia      | 300.00 |
| Clean Code        | Robert Martin      | 600.00 |
+-------------------+--------------------+--------+
8 rows in set (0.00 sec)

mysql> create view fiction_books
    -> select book_name from books
    -> where category='Fiction';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select book_name from books
where category='Fiction'' at line 2
mysql> create view fiction_books
    -> as
    -> select book_name from books
    -> where category='Fiction';
Query OK, 0 rows affected (0.03 sec)

mysql> select *from fiction_books;
+---------------+
| book_name     |
+---------------+
| The Alchemist |
+---------------+
1 row in set (0.01 sec)

mysql> create view expensive_books
    -> as
    -> select book_name from books
    -> where price >400;
Query OK, 0 rows affected (0.03 sec)

mysql> select*from expensive_books;
+---------------+
| book_name     |
+---------------+
| Atomic Habits |
| Harry Potter  |
| Clean Code    |
+---------------+
3 rows in set (0.00 sec)

mysql> create view member_view as
    -> select member_name,
    -> email,
    -> city
    -> from
    -> members ;
Query OK, 0 rows affected (0.02 sec)

mysql> select *from member_view;
+---------------+-------------------+--------+
| member_name   | email             | city   |
+---------------+-------------------+--------+
| Amit Sharma   | amit@example.com  | Pune   |
| Priya Patil   | priya@example.com | Mumbai |
| Rahul Verma   | rahul@example.com | Pune   |
| Sneha Joshi   | sneha@example.com | Nashik |
| Karan Shah    | karan@example.com | Mumbai |
| Neha Kulkarni | neha@example.com  | Pune   |
+---------------+-------------------+--------+
6 rows in set (0.00 sec)

mysql> create view pune_members as
    -> select member_name
    -> from memberss
    -> where city='pune';
ERROR 1146 (42S02): Table 'test.memberss' doesn't exist
mysql> create view pune_members as
    -> select member_name
    -> from members
    -> where city='pune';
Query OK, 0 rows affected (0.02 sec)

mysql> select*from puNE_MEmbers;
+---------------+
| member_name   |
+---------------+
| Amit Sharma   |
| Rahul Verma   |
| Neha Kulkarni |
+---------------+
3 rows in set (0.00 sec)

mysql> create view fantasy_books as
    -> select *from books
    -> where category='fantasy';
Query OK, 0 rows affected (0.02 sec)

mysql> select*from fantasy_books;
+---------+--------------+----------------+----------+--------+
| book_id | book_name    | author         | category | price  |
+---------+--------------+----------------+----------+--------+
|     105 | Harry Potter | J.K. Rowling   | Fantasy  | 500.00 |
|     106 | The Hobbit   | J.R.R. Tolkien | Fantasy  | 400.00 |
+---------+--------------+----------------+----------+--------+
2 rows in set (0.00 sec)

mysql> select*from book_details;
+-------------------+--------------------+--------+
| book_name         | author             | price  |
+-------------------+--------------------+--------+
| The Alchemist     | Paulo Coelho       | 350.00 |
| Wings of Fire     | A.P.J. Abdul Kalam | 280.00 |
| Atomic Habits     | James Clear        | 450.00 |
| Rich Dad Poor Dad | Robert Kiyosaki    | 320.00 |
| Harry Potter      | J.K. Rowling       | 500.00 |
| The Hobbit        | J.R.R. Tolkien     | 400.00 |
| Ikigai            | Hector Garcia      | 300.00 |
| Clean Code        | Robert Martin      | 600.00 |
+-------------------+--------------------+--------+
8 rows in set (0.00 sec)




mysql> create view affordable_books as
    -> select*from books
    -> where price<400;
Query OK, 0 rows affected (0.02 sec)

mysql> select*from affordable_books;
+---------+-------------------+--------------------+-----------+--------+
| book_id | book_name         | author             | category  | price  |
+---------+-------------------+--------------------+-----------+--------+
|     101 | The Alchemist     | Paulo Coelho       | Fiction   | 350.00 |
|     102 | Wings of Fire     | A.P.J. Abdul Kalam | Biography | 280.00 |
|     104 | Rich Dad Poor Dad | Robert Kiyosaki    | Finance   | 320.00 |
|     107 | Ikigai            | Hector Garcia      | Self Help | 300.00 |
+---------+-------------------+--------------------+-----------+--------+
4 rows in set (0.00 sec)

mysql> create view self_help_books as
    -> select*from books
    -> where category='self help';
Query OK, 0 rows affected (0.02 sec)

mysql> select*from self_helP;
ERROR 1146 (42S02): Table 'test.self_help' doesn't exist
mysql> select*from self_helP_books;
+---------+---------------+---------------+-----------+--------+
| book_id | book_name     | author        | category  | price  |
+---------+---------------+---------------+-----------+--------+
|     103 | Atomic Habits | James Clear   | Self Help | 450.00 |
|     107 | Ikigai        | Hector Garcia | Self Help | 300.00 |
+---------+---------------+---------------+-----------+--------+
2 rows in set (0.00 sec)





mysql>  create view CurrentBorrowed as
    -> select m.member_name, b.book_name,b1.borrow_date
    -> from members m
    -> inner join borrowrecords b1 on b1.member_id=m.member_id
    -> inner join books b on b.book_id=b1.book_id
    -> where b1.return_date is null;
Query OK, 0 rows affected (0.04 sec)

mysql> select*from CurrentBorrowed;
+---------------+-------------------+-------------+
| member_name   | book_name         | borrow_date |
+---------------+-------------------+-------------+
| Amit Sharma   | Atomic Habits     | 2025-02-01  |
| Sneha Joshi   | Rich Dad Poor Dad | 2025-02-10  |
| Karan Shah    | The Hobbit        | 2025-03-01  |
| Neha Kulkarni | Wings of Fire     | 2025-03-10  |
| Sneha Joshi   | Atomic Habits     | 2025-03-12  |
| Karan Shah    | Ikigai            | 2025-03-20  |
+---------------+-------------------+-------------+
6 rows in set (0.03 sec)

mysql> create view borrow_datails  as
    -> select borrow_id,member_name,book_name,borrow_date from    borrowrecords join  members on members.member_id =borrowrecords.member_id join books on books.book_id=borrowrecords.book_id;
Query OK, 0 rows affected (0.03 sec)

mysql> select*from borrow_datails;
+-----------+---------------+-------------------+-------------+
| borrow_id | member_name   | book_name         | borrow_date |
+-----------+---------------+-------------------+-------------+
|         1 | Amit Sharma   | The Alchemist     | 2025-01-05  |
|         3 | Amit Sharma   | Atomic Habits     | 2025-02-01  |
|        11 | Amit Sharma   | Harry Potter      | 2025-03-15  |
|         2 | Priya Patil   | Wings of Fire     | 2025-01-10  |
|         6 | Priya Patil   | The Alchemist     | 2025-02-15  |
|         4 | Rahul Verma   | Harry Potter      | 2025-02-05  |
|         8 | Rahul Verma   | Clean Code        | 2025-03-05  |
|         5 | Sneha Joshi   | Rich Dad Poor Dad | 2025-02-10  |
|        10 | Sneha Joshi   | Atomic Habits     | 2025-03-12  |
|         7 | Karan Shah    | The Hobbit        | 2025-03-01  |
|        12 | Karan Shah    | Ikigai            | 2025-03-20  |
|         9 | Neha Kulkarni | Wings of Fire     | 2025-03-10  |
+-----------+---------------+-------------------+-------------+
12 rows in set (0.00 sec)
















