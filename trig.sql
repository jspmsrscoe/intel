CREATE TABLE StudentLogs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    name_logged VARCHAR(100),
    action_time DATETIME
);

DELIMITER //
CREATE TRIGGER AfterStudentInsert
AFTER INSERT ON Students
FOR EACH ROW
BEGIN
    INSERT INTO StudentLogs (name_logged, action_time)
    VALUES (NEW.name, NOW());
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeMarksUpdate
BEFORE UPDATE ON Students
FOR EACH ROW
BEGIN
    IF NEW.marks < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Marks cannot be negative';
    END IF;
END;
//
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_name;