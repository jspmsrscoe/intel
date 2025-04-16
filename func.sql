CREATE FUNCTION function_name (param1 TYPE, param2 TYPE, ...)
RETURNS return_type
DETERMINISTIC
BEGIN
    -- Function logic
    RETURN some_value;
END;

DELIMITER //
CREATE FUNCTION AddTwoNumbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a + b;
END;
//
DELIMITER ;

SELECT AddTwoNumbers(5, 10);  -- Output: 15

DELIMITER //
CREATE FUNCTION GetGrade(marks INT)
RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(2);

    IF marks >= 90 THEN
        SET grade = 'A';
    ELSEIF marks >= 75 THEN
        SET grade = 'B';
    ELSEIF marks >= 60 THEN
        SET grade = 'C';
    ELSE
        SET grade = 'F';
    END IF;

    RETURN grade;
END;
//
DELIMITER ;


SELECT name, marks, GetGrade(marks) AS grade
FROM Students;