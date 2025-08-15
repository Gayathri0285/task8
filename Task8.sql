use student
DELIMITER $$

CREATE PROCEDURE GetStudentsByAge1(IN min_age INT)
BEGIN
    SELECT rollno,name,department,age
    FROM student
    WHERE age >= min_age;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetResult2(IN student_id INT)
BEGIN
    DECLARE avg_marks FLOAT;
    SELECT AVG(marks) INTO avg_marks 
    FROM marks 
    WHERE student_id = student_id;

    IF avg_marks >= 50 THEN
        SELECT 'PASS' AS Result;
    ELSE
        SELECT 'FAIL' AS Result;
    END IF;
END$$
DELIMITER ;
 SELECT * from marks;
 CALL GetResult1(2)

DELIMITER $$
CREATE FUNCTION TotalMarks(student_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT SUM(marks) INTO total 
    FROM marks 
    WHERE student_id = student_id;
    RETURN total;
END$$
DELIMITER ;

select TotalMarks(1);