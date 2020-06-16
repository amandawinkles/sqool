-- 1. Look at the departments table in the school database provided to you. How many columns does it have and what are the column names?
2 columns: id, name

-- 2. Which column in the departments table is intended to be uniquely identifying?
id is meant to be uniquely identifying

-- 3. Look at the teachers schema. Which column is being used as a foreign key? Why might we be using a foreign key here rather than storing the data directly in this table?
department column is being used as a foreign key

-- 4. Look at the remaining table schemas in this database. Whiteboard each of the 5 tables, representing them as simple spreadsheet like grids, using arrows to indicate where a particular column is referring to data stored in another table.


-- 5. Display the name column for every row in the students table
SELECT name FROM students;

-- 6. Display every column for the teachers table. The department column just contains numbers, what are these numbers referencing?
select * from teachers;
department id

-- 7. Display every column for the teachers table and then every column for the departments table. Just by looking at the tables, what is the name of the department that the teacher beth is a part of?
select * from teachers;
select * from departments;
beth is in the cs dept

-- 8. Display just the name column for all the students whose names are not naomi. (Note, naomi being text, should be placed in single quotes)
select name from students where name != 'naomi';

-- 9. Display the name and department id of teachers whose own id is greater than 2 or whose name is 'fred'
select name, department from teachers where department > 2 OR name = 'fred';

-- 10. Display the id and name of all the students whose names end in 'm'
select name, id from students where name like '%m';

-- 11. Display all columns for students whose names do not contain the letter 'a'. HINT: a more long-winded way to say "includes the letter 'a'" is "includes 0 or more of any letter followed by an 'a' followed by 0 or more of any letter."
select * from students where name not like '%a%';

-- 12. Display just the names of all the teachers whose id is NOT either 1, 2, or 4
SELECT name FROM teachers
  WHERE id NOT IN (1, 2, 4);

-- 13. Display just the names of all the teachers whose department is either 1 or 4
SELECT name FROM teachers
  WHERE department IN (1, 4);

-- 14. Display the name and id of all the teachers in the 'psy' department (should be pamela and sunny, with their respective ids)
select name, id from teachers where department in (2);

-- 15. Display the name of the department that 'sunny' teaches for (should be 'psy')
select name from departments where (select department from teachers where name = 'sunny' AND department = departments.id);

-- 16. Display the name and id of all the teachers in the 'psy' department
SELECT teachers.name, teachers.id FROM teachers, departments WHERE departments.id = 2 AND teachers.department = departments.id;

-- 17. Display the name of the department that 'sunny' teaches for
SELECT departments.name FROM departments, teachers
  WHERE teachers.name = 'sunny' AND teachers.department = departments.id;

-- 18. Display the name and id of all the teachers in the 'psy' department
SELECT teachers.name, teachers.id FROM teachers INNER JOIN departments WHERE departments.id = 2 AND teachers.department = departments.id;

-- 19. Display the name of the department that 'sunny' teaches for
SELECT departments.name FROM teachers INNER JOIN departments
  WHERE teachers.name = 'sunny' AND teachers.department = departments.id;

-- 20. Which classes is 'sam' taking?
SELECT classes.name
FROM classes
INNER JOIN students
INNER JOIN classes_students ON students.name = 'sam' AND classes_students.student_id = students.id AND classes_students.classes_id = classes.id;

-- 21. What are the names of the students in the 'compromise' class?
SELECT students.name
FROM students
INNER JOIN classes
INNER JOIN classes_students ON classes.name = 'compromise' AND classes_students.classes_id = classes.id AND classes_students.student_id = students.id;

-- 22. What are the names of the students taking any class in the 'cs' department?
SELECT students.name
FROM students
INNER JOIN classes
INNER JOIN departments
INNER JOIN classes_students ON departments.name = 'cs' AND classes.department = departments.id AND classes_students.classes_id = classes.id AND classes_students.student_id = students.id;