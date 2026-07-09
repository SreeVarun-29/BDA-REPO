CREATE KEYSPACE IF NOT EXISTS student_db
WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': 1
};

USE student_db;

CREATE TABLE IF NOT EXISTS students (
    student_id UUID PRIMARY KEY,
    name TEXT,
    department TEXT,
    year INT,
    marks FLOAT
);

CREATE TABLE IF NOT EXISTS courses (
    course_id UUID PRIMARY KEY,
    course_name TEXT,
    credits INT
);

INSERT INTO courses (course_id, course_name, credits)
VALUES (uuid(), 'Big Data Analytics', 4);

INSERT INTO courses (course_id, course_name, credits)
VALUES (uuid(), 'NoSQL Databases', 3);
