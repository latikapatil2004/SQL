bmysql> create view borrow_datails  as
    -> select borrow_id,member_name,book_name,borrow_date from borowrecords join  members on members.member_id =borrowrecords.member_id join books on books.book_id=borrowrecords.book_id;
ERROR 1146 (42S02): Table 'test.borowrecords' doesn't exist
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

mysql>