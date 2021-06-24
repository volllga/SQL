## ================================================================================================================================================================= ##
create database stp_i_shop;
use stp_i_shop;

create table author ( author_id INT PRIMARY KEY AUTO_INCREMENT, name_author VARCHAR(50) );

insert into author (name_author) values('Bulgakov');
insert into author (name_author) values('Dostov');
insert into author (name_author) values('Esenin');
insert into author (name_author) values('Pasternak');
insert into author (name_author) values('Lermont');


CREATE TABLE genre ( genre_id INT PRIMARY KEY AUTO_INCREMENT, name_genre VARCHAR(30) );

insert into genre (name_genre) values('Novel');
insert into genre (name_genre) values('Poetry');
insert into genre (name_genre) values('Adventure');

 CREATE TABLE book (
      book_id INT PRIMARY KEY AUTO_INCREMENT, 
      title VARCHAR(50), 
      author_id INT, 
      genre_id INT,
      price DECIMAL(8,2), 
      amount INT, 
      FOREIGN KEY (author_id)  REFERENCES author (author_id) on delete cascade, 
      FOREIGN KEY (genre_id)  REFERENCES genre (genre_id) on delete set null
);

INSERT INTO book (title, author_id, genre_id, price, amount) VALUES ('Master and Margo', 1, 1, 670.99, 3);
INSERT INTO book (title, author_id, genre_id, price, amount) VALUES ('White Guards', 1, 1, 540.50, 5);
INSERT INTO book (title, author_id, genre_id, price, amount) VALUES ('Idiot', 2, 1, 460.00, 10);
INSERT INTO book (title, author_id, genre_id, price, amount) VALUES ('Karamaz Brozs', 2, 1, 799.01, 2);
INSERT INTO book (title, author_id, genre_id, price, amount) VALUES ('Gambler', 2, 1, 480.50, 10);
INSERT INTO book (title, author_id, genre_id, price, amount) VALUES ('Poems and parts', 3, 2, 650.00, 15);
INSERT INTO book (title, author_id, genre_id, price, amount) VALUES ('Black Man', 3, 2, 570.20, 6);
INSERT INTO book (title, author_id, genre_id, price, amount) VALUES ('Lirika', 4, 2, 518.99, 2);

CREATE TABLE city ( city_id INT PRIMARY KEY AUTO_INCREMENT, name_city VARCHAR(30), days_delivery INT );
insert into city (name_city, days_delivery) values('MSK', 5);
insert into city (name_city, days_delivery) values('SPB', 3);
insert into city (name_city, days_delivery) values('VLD', 12);


CREATE TABLE client ( 
	client_id INT PRIMARY KEY AUTO_INCREMENT, 
    name_client VARCHAR(50), 
    city_id INT, 
    email VARCHAR(50), 
    FOREIGN KEY (city_id)  REFERENCES city(city_id) on delete set null
);
INSERT INTO client (name_client, city_id, email) VALUES ('Baranov', 3, 'baranov@tst');
INSERT INTO client (name_client, city_id, email) VALUES ('Abramova', 1, 'abramova@tst');
INSERT INTO client (name_client, city_id, email) VALUES ('Semenov', 2, 'semenov@tst');
INSERT INTO client (name_client, city_id, email) VALUES ('Yakovleva', 1, 'yakovleva@tst');

CREATE TABLE buy ( 
	buy_id INT PRIMARY KEY AUTO_INCREMENT, 
    buy_description VARCHAR(100), 
    client_id INT, 
    FOREIGN KEY (client_id) REFERENCES client(client_id) on delete cascade
);
INSERT INTO buy (buy_description, client_id) VALUES ('Evening delivery only', 1);
INSERT INTO buy (buy_description, client_id) VALUES ('', 3);
INSERT INTO buy (buy_description, client_id) VALUES ('Every book is packed singly', 2);
INSERT INTO buy (buy_description, client_id) VALUES ('', 1);

CREATE TABLE buy_book ( 
	buy_book_id INT PRIMARY KEY AUTO_INCREMENT, 
    buy_id INT, 
    book_id INT, 
    amount INT,
    FOREIGN KEY (buy_id) REFERENCES buy(buy_id) ,
    FOREIGN KEY (book_id) REFERENCES book(book_id) 
);
INSERT INTO buy_book (buy_id, book_id, amount) VALUES (1, 1, 1);
INSERT INTO buy_book (buy_id, book_id, amount) VALUES (1, 7, 2);
INSERT INTO buy_book (buy_id, book_id, amount) VALUES (2, 8, 2);
INSERT INTO buy_book (buy_id, book_id, amount) VALUES (3, 3, 2);
INSERT INTO buy_book (buy_id, book_id, amount) VALUES (3, 2, 1);
INSERT INTO buy_book (buy_id, book_id, amount) VALUES (3, 1, 1);
INSERT INTO buy_book (buy_id, book_id, amount) VALUES (4, 5, 1);


CREATE TABLE step ( 
	step_id INT PRIMARY KEY AUTO_INCREMENT, 
    name_step VARCHAR(30)    
);
INSERT INTO step (name_step) VALUES ("Payment");
INSERT INTO step (name_step) VALUES ("Packing");
INSERT INTO step (name_step) VALUES ("Transfer");
INSERT INTO step (name_step) VALUES ("Delivary");


CREATE TABLE buy_step ( 
	buy_step_id INT PRIMARY KEY AUTO_INCREMENT, 
    buy_id INT, 
    step_id INT, 
    date_step_beg DATE,
    date_step_end DATE,
    FOREIGN KEY (buy_id) REFERENCES buy(buy_id) ,
    FOREIGN KEY (step_id) REFERENCES step(step_id) 
);
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (1, 1, '2020-02-20', '2020-02-20');
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (1, 2, '2020-02-20', '2020-02-21');
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (1, 3, '2020-02-22', '2020-03-07');
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (1, 4, '2020-03-08', '2020-03-08');
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (2, 1, '2020-02-28', '2020-02-28');
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (2, 2, '2020-02-29', '2020-03-01');
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (2, 3, '2020-03-02', null);
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (2, 4, null, null);
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (3, 1, '2020-03-05', '2020-03-05');
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (3, 2, '2020-03-05', '2020-03-06');
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (3, 3, '2020-03-06', '2020-03-10');
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (3, 4, '2020-03-11', null);
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (4, 1, '2020-03-20', null);
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (4, 2, null, null);
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (4, 3, null, null);
INSERT INTO buy_step (buy_id, step_id, date_step_beg, date_step_end) VALUES (4, 4, null, null);













































