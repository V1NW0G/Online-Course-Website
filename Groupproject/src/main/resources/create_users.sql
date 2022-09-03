CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    phone VARCHAR(8) NOT NULL,
    address VARCHAR(50) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE user_roles (
    user_role_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_role_id),
    FOREIGN KEY (username) REFERENCES users(username)
);


CREATE TABLE ticket (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    body VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE attachment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    filename VARCHAR(255) DEFAULT NULL,
    content_type VARCHAR(255) DEFAULT NULL,
    content BLOB DEFAULT NULL,
    ticket_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE polling (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    question VARCHAR(255) NOT NULL,
    select1 VARCHAR(255) NOT NULL,
    select2 VARCHAR(255) NOT NULL,
    select3 VARCHAR(255) NOT NULL,
    select4 VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);


INSERT INTO users VALUES ('keith', '{noop}keithpw', 'keith', '12345678', 'HongKong');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_ADMIN');
INSERT INTO ticket(name, subject, body) VALUES ('keith', '380F', 'Overview of Web Applications, JavaEE Server, Web Container, HTML5, CSS, JavaScript');
INSERT INTO ticket(name, subject, body) VALUES ('keith', '380F', 'Group Project (15%): ▪ Submission deadline: April 24, 2022 (Sun) (tentative)');

INSERT INTO users VALUES ('john', '{noop}johnpw', 'john', '12345678', 'HongKong');
INSERT INTO user_roles(username, role) VALUES ('john', 'ROLE_ADMIN');
INSERT INTO ticket(name, subject, body) VALUES ('john', '313F', 'Overview of React Native');

INSERT INTO users VALUES ('mary', '{noop}marypw', 'mary', '12345678', 'HongKong');
INSERT INTO user_roles(username, role) VALUES ('mary', 'ROLE_USER');

INSERT INTO users VALUES ('tom', '{noop}tompw', 'tom', '12345678', 'U.S');
INSERT INTO user_roles(username, role) VALUES ('tom', 'ROLE_USER');