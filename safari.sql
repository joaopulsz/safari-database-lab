DROP TABLE assignments;
DROP TABLE animals;
DROP TABLE enclosures;
DROP TABLE staff;

CREATE TABLE staff (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   employee_number INT
);

CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closed_for_maintenance BOOLEAN
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);

CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES staff(id),
    enclosure_id INT REFERENCES enclosures(id),
    day VARCHAR(255)
);

INSERT INTO staff (name, employee_number) VALUES ('Bob', 10001);
INSERT INTO staff (name, employee_number) VALUES ('Mary', 20002);
INSERT INTO staff (name, employee_number) VALUES ('John', 30003);
INSERT INTO staff (name, employee_number) VALUES ('Jane', 40004);
INSERT INTO staff (name, employee_number) VALUES ('Alex', 50005);

INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Tigers Den', 5, false);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Boars Cage', 10, true);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Lions Field', 10, false);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Birds Nest', 25, true);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('The Aquarium', 50, false);

INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (1, 2, 'Monday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (2, 5, 'Wednesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (3, 4, 'Saturday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (4, 1, 'Thursday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (5, 3, 'Tuesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (1, 4, 'Sunday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (5, 1, 'Tuesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (3, 2, 'Friday');

INSERT INTO animals ( name, type, age, enclosure_id ) VALUES ('Harry', 'tiger', 82, 1);
INSERT INTO animals ( name, type, age, enclosure_id) VALUES ('Jim', 'boar', 6, 2);
INSERT INTO animals ( name, type, age, enclosure_id) VALUES ('Robert', 'tiger', 15, 1);
INSERT INTO animals ( name, type, age, enclosure_id) VALUES ('Jane', 'lion', 45, 3);
INSERT INTO animals ( name, type, age, enclosure_id) VALUES ('Aaron', 'lion', 4, 3);
INSERT INTO animals ( name, type, age, enclosure_id) VALUES ('Nathan', 'bird', 27, 4);
INSERT INTO animals ( name, type, age, enclosure_id) VALUES ('Foyzur', 'lion', 43, 3);
INSERT INTO animals ( name, type, age, enclosure_id) VALUES ('Billy', 'fish', 10, 5);
INSERT INTO animals ( name, type, age, enclosure_id) VALUES ('Greenwood', 'fish', 6, 5);
INSERT INTO animals ( name, type, age, enclosure_id) VALUES ('Ronaldo', 'bird', 22, 4);
INSERT INTO animals ( name, type, age, enclosure_id) VALUES ('Sancho', 'boar', 9, 2);

SELECT name FROM animals WHERE enclosure_id = 2;
SELECT staff.name FROM staff INNER JOIN assignments ON staff.id = assignments.employee_id INNER JOIN enclosures ON assignments.enclosure_id = enclosures.id WHERE enclosure_id = 3 ;
