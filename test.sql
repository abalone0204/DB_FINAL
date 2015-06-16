-- 放測試用sql

-- 檢驗單一學生所修過的學分
SELECT SUM(credit) FROM performance, course
    WHERE performance.c_id = course.c_id 
        AND performance.stu_id = 99207342;

SELECT course.name, course.credit FROM performance, course
    WHERE performance.c_id = course.c_id 
        AND performance.stu_id = 99207342;

SELECT SUM(credit) FROM rule
    WHERE stand_name = "統計系";