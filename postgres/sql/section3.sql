CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
);

INSERT INTO users (username) VALUES ('monahan93'), ('pferrer'), ('si93onis'),('99stroman');

SELECT * FROM users;

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id)
);

INSERT INTO photos (url, user_id) VALUES 
('http://one.jpg',4);

SELECT * FROM photos;

INSERT INTO photos (url, user_id ) VALUES
('http://two.jpg', 1),
('http://25.jpg', 1),
('http://36.jpg', 1),
('http://754.jpg', 2),
('http://35.jpg', 3),
('http://256.jpg', 4);

SELECT * FROM photos WHERE user_id = 4;

SELECT url, username FROM photos JOIN users ON users.id = photos.user_id;

INSERT INTO photos (url, user_id) VALUES('http://jpg', 9999);
INSERT INTO photos (url, user_id) VALUES('http://jpg', NULL);

DELETE FROM users WHERE id = 1;

---
DROP TABLE photos;

--- on delete cascade option
CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);
INSERT INTO photos(url, user_id) VALUES
('http:/one.jpg', 4),
('http:/two.jpg', 1),
('http:/25.jpg', 1),
('http:/36.jpg', 1),
('http:/754.jpg', 2),
('http:/35.jpg', 3),
('http:/256.jpg', 4);

DELETE FROM users WHERE id = 1;

SELECT * FROM photos;

-- on delete set null option

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);
INSERT INTO photos(url, user_id) VALUES
('http:/one.jpg', 4),
('http:/754.jpg', 2),
('http:/35.jpg', 3),
('http:/256.jpg', 4);

DELETE FROM users WHERE id = 4;

SELECT * FROM photos;

--- on delete set default with deafult constraints
