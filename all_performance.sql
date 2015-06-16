-- 拿出所有的performance
SELECT *
    FROM student, performance ,course 
    WHERE  student.stu_id = performance.stu_id 
            AND performance.c_id = course.c_id;

-- 列特定學生的個人成績單
SELECT course.name, performance.grade, student.name 
    FROM course, performance, student
    WHERE student.stu_id = performance.stu_id 
        AND course.c_id = performance.c_id
        AND student.name = "蔡其展";

SELECT course.name, performance.grade, student.name 
    FROM course, performance, student
    WHERE student.stu_id = performance.stu_id 
        AND course.c_id = performance.c_id
        AND student.name = "林致誠";



-- 個人成績平均
SELECT student.name, AVG(performance.grade)
    FROM performance, student
    WHERE student.stu_id = performance.stu_id 
    GROUP BY student.name;


SELECT student.name, performance.grade, course.category, course.credit
    FROM   student, performance, course
    WHERE  student.stu_id = performance.stu_id 
        AND performance.c_id = course.c_id
        AND student.name = "王致輝" 
        AND performance.grade >= 60
        AND(SELECT category, SUM(credit)
             FROM   course
             Group BY category);

-- 看standard 底下有哪些rule
SELECT course.name, course.department FROM course 
    WHERE course.name 
    IN(SELECT rule.c_name FROM rule 
        WHERE rule.stand_name = "日文輔系"
        );

-- 看學生有修哪些學程

SELECT standard.name, student.name, grad_type.grad_year 
    FROM standard, student, grad_type
    WHERE student.stu_id = grad_type.stu_id AND
            grad_type.stand_name = standard.name;


CREATE VIEW T1 AS           
SELECT student.name, performance.grade, course.category, course.credit
    FROM   student, performance, course
    WHERE  student.stu_id = performance.stu_id 
        AND performance.c_id = course.c_id
        AND student.stu_id = "王致輝";



-- 拿到某系底下所有符合規定的課程id
SELECT course.c_id FROM course 
    WHERE name IN(SELECT c_name
                    FROM rule WHERE stand_name= '統計系');

SELECT course.c_id FROM course 
    WHERE name IN(SELECT c_name
                    FROM rule WHERE stand_name= '日文輔系');

SELECT course.c_id FROM course 
    WHERE name IN(SELECT c_name
                    FROM rule WHERE stand_name= '會計輔系');

-- 拿出在輔系課程中的成績

SELECT student.name, grad_type.stand_name 
    FROM performance, student, grad_type
        WHERE grad_type.stu_id = student.stu_id
            AND performance.c_id IN(
                SELECT course.c_id FROM course 
                    WHERE name IN(
                        SELECT c_name
                            FROM rule WHERE stand_name= '統計系'))
            AND performance.grade >= 60;



CREATE VIEW GRADUATION AS
SELECT student.name, grad_type.stand_name, '是' as 'complete'
    FROM student, grad_type, performance
    WHERE student.stu_id = grad_type.stu_id 
        AND 

CREATE VIEW NOT_GRADUATION AS
SELECT student.name, grad_type.stand_name, '否' as 'complete'
    FROM student, grad_type, performance
    WHERE student.stu_id = grad_type.stu_id 
        AND 

SELECT student.name, grad_type 