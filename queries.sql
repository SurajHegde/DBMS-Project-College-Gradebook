-- Switch to Database : gradebook
USE gradebook;

-- Query 1 : Get the names of the students and their instructors along with their respective course numbers of the courses which relate them.

SELECT s.name as 'Student Name' ,i.name as 'Instructor Name', s.cnum as 'Course Number'
FROM
	(SELECT concat(p.first_name,' ',p.last_name) AS name,t.Course_number AS cnum
		FROM teaches t
		INNER JOIN person p
		ON p.Person_id = t.Person_id
	) i
INNER JOIN
      	(
		SELECT concat(p.first_name,' ',p.last_name) AS name, s.Course_number AS cnum
		FROM student s
		INNER JOIN person p
		ON p.Person_id = s.Person_id
	) s
ON s.cnum =i.cnum;

-- Query 2 : Get the names and the number of courses taught by instructors mentoring more than 1 instructor

SELECT concat(p.first_name,' ',p.last_name) AS Name,f.count AS 'Number of Courses'
FROM
(
SELECT i.Person_id, Count(i.Person_id) AS count
FROM instructor i
INNER JOIN
	(SELECT Mentor_id AS Instructor_id
		FROM instructor
		GROUP BY Mentor_id
		HAVING Count(Mentor_id) > 1
	) m
ON i.Instructor_id = m.Instructor_id
INNER JOIN teaches t
ON i.Instructor_id = t.Instructor_id
GROUP BY i.Person_id
) f
INNER JOIN person p
ON f.Person_id = p.Person_id;

-- Query 3 : List the instructors names and their cities who are not from Yakima

SELECT concat(p.first_name,' ',p.last_name) AS Name, p.City
FROM person p
INNER JOIN instructor i
ON i.Person_id = p.Person_id
WHERE p.city != 'Yakima';

-- Query 4 : List the names of the Students who have taken a course during Spring

SELECT concat(p.first_name,' ',p.last_name) AS Name
FROM person p
INNER JOIN
      (SELECT s.Person_id
      	      FROM student s
      	      INNER JOIN course c
	      ON c.Course_Number = s.Course_Number
      	      WHERE c.Term = 'Spring'
      ) s
ON s.Person_id = p.Person_id;

-- Query 5 : List the Names of the Books recommended by the instructors who teach more than one Course

SELECT b1.Book_name
FROM book b1
INNER JOIN
      (SELECT Book_id
      	      FROM recommends
      	      INNER JOIN
              (SELECT Instructor_id
	      	      FROM teaches
	    	      GROUP BY Instructor_id
	    	      HAVING Count(Instructor_id)>1
	      ) t
	      ON t.Instructor_id = recommends.Instructor_id
      ) b2
ON b1.Book_id = b2.Book_id;

-- Query 6 : List the exam having the maximum weitage for each courses

SELECT t1.Course_Number,t1.Exam_title,t1.Exam_weight
FROM grading_component t1
INNER JOIN
(
SELECT Max(Exam_weight) AS Exam_weight,Course_Number 
FROM grading_component
GROUP BY Course_Number
) t2
ON
t1.Course_Number = t2.Course_Number AND t1.Exam_weight = t2.Exam_weight;
