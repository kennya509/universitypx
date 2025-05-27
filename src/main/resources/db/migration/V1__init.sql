CREATE TABLE faculty (
                         id SERIAL PRIMARY KEY,
                         name VARCHAR(100) NOT NULL
);

CREATE TABLE student (
                         id SERIAL PRIMARY KEY,
                         name VARCHAR(100) NOT NULL,
                         faculty_id INT NOT NULL,
                         CONSTRAINT fk_faculty FOREIGN KEY(faculty_id) REFERENCES faculty(id)
);
