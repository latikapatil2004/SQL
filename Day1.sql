CREATE TABLE course (
    cid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE student (
    sid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    cid INT,
    FOREIGN KEY (cid) REFERENCES course(cid)
);

CREATE TABLE batch (
    bid INT AUTO_INCREMENT PRIMARY KEY,
    bname VARCHAR(100),
    cid INT,
    FOREIGN KEY (cid) REFERENCES course(cid)
);

INSERT INTO course (cid, name)
VALUES
(1, 'Java'),
(2, 'Python'),
(3, 'SQL');

INSERT INTO student (sid, name, cid)
VALUES
(1, 'Rahul', 1),
(2, 'Priya', 2),
(3, 'Amit', 1),
(4, 'Sneha', 3),
(5, 'Rohit', 2);

INSERT INTO batch (bname, cid)
VALUES
('latik', 1),
('vino', 3),
('patil', 3),
('sai', 2);

CREATE TABLE sbjoin (
    sid INT,
    bid INT,
    FOREIGN KEY (sid) REFERENCES student(sid),
    FOREIGN KEY (bid) REFERENCES batch(bid)
);

INSERT INTO sbjoin
VALUES
(1,3),
(3,2),
(2,1),
(5,1);

CREATE TABLE csjoin (
    cid INT,
    sid INT,
    FOREIGN KEY (cid) REFERENCES course(cid),
    FOREIGN KEY (sid) REFERENCES student(sid)
);

INSERT INTO csjoin
VALUES
(1,2),
(2,1),
(3,2),
(2,4);

CREATE TABLE placement (
    pid INT AUTO_INCREMENT PRIMARY KEY,
    pname VARCHAR(100),
    package INT,
    sid INT,
    FOREIGN KEY (sid) REFERENCES student(sid)
);

INSERT INTO placement (pname, package, sid)
VALUES
('bhau', 300000, 3),
('sau', 250000, 2),
('radha', 400000, 5);

select student.name,batch.bname from student 
inner join  sbjoin on student.sid=sbjoin.sid
inner join batch on sbjoin.bid=batch.bid;









CREATE TABLE student (
    sid INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO student VALUES
(1, 'sai'),
(2, 'arti'),
(3, 'mansi'),
(4, 'vinod'),
(5, 'papa');


CREATE TABLE placement (
    id INT,
    pname VARCHAR(100),
    package INT,
    sid INT,
    FOREIGN KEY (sid) REFERENCES student(sid)
);

INSERT INTO placement VALUES
(1, 'tcss', 300000, 1),
(2, 'infoyss', 250000, 2),
(3, 'wipro', 500000, 3);
(4, 'zensar', 800000, 3);
select s.name as student_name,
p.package as package from student s  
left join placement p on 
s.sid=p.sid;