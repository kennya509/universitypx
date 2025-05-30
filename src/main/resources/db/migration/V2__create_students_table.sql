CREATE TABLE students (
                          id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
                          first_name VARCHAR(255),
                          last_name VARCHAR(255),
                          email VARCHAR(255),
                          group_name VARCHAR(255),
                          faculty_id BIGINT,
                          FOREIGN KEY (faculty_id) REFERENCES faculties(id)
);