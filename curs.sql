CREATE TABLE Students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    marks INT
);

INSERT INTO Students (name, marks) VALUES
('Alice', 85),
('Bob', 75),
('Charlie', 92);


DELIMITER //

CREATE PROCEDURE PrintStudentNames()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE studentName VARCHAR(100);

    DECLARE cur CURSOR FOR SELECT name FROM Students;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO studentName;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Student: ', studentName) AS name_output;
    END LOOP;

    CLOSE cur;
END;

//
DELIMITER ;

CALL PrintStudentNames();