------- DDL commands on the Database -------

create database org;
show databases;
use org;

create table worker(
    worker_id int not null key auto_increment,
    first_name char(25),
    last_name char(25),
    salary int(15),
    joining_date datetime,
    department char(25)
);

insert into worker (worker_id, first_name, last_name, salary, joining_date, department) 
values
(001, 'sameer', 'bagul', '1200000', '14-02-20 09.00.00', 'HR'),
(001, 'yash', 'chavan', '1200000', '14-02-20 09.00.00', 'HR'),
(001, 'sumit', 'chavan', '1200000', '14-02-20 09.00.00', 'HR');

create table bonus (
    worker_ref_id int, 
    bonus_amount int(10), 
    bonus_date datetime,
    foreign key (worker_ref_id) references worker(worker_id) on delete cascade
);

insert into bonus (worker_ref_id ,bonus_amount ,bonus_date ) 
values
('001', '2000', '16-02-20'),
('002', '200', '16-02-20'),
('003', '20', '16-02-20'); 

create table title (
    worker_ref_id int ,
    worker_title char(25),
    affected_from datetime, 
    foreign key (worker_id) references worker(worker_id) on delete cascade
);

insert into title (worker_ref_id, worker_title ,affected_from)
values 
('001', 'manager', '2016-02-20 00:00:00'),
('002', 'manager', '2016-02-20 00:00:00'),
('003', 'manager', '2016-02-20 00:00:00'),

-- in workbench we can see automatically generated ER - moodel diagram 

-- Databses -> reverse engineer  -> select instance -> select db -> continue

------- DQL commands on the DAtabase -------
