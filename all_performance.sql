
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
SELECT course.c_id FROM course, rule
    WHERE (name IN(SELECT c_name
                    FROM rule WHERE stand_name= '統計系'))
                AND course.category = rule.category
                AND course.department = rule.department
                AND course.credit = rule.credit;

SELECT course.c_id FROM course, rule
    WHERE name IN(SELECT c_name
                    FROM rule WHERE stand_name= '日文輔系')
               AND course.category = rule.category
               AND course.department = rule.department
               AND course.credit = rule.credit;

SELECT course.c_id FROM course, rule 
    WHERE name IN(SELECT c_name
                    FROM rule WHERE stand_name= '會計輔系');
               AND course.category = rule.category
               AND course.department = rule.department
               AND course.credit = rule.credit;

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



-- FINAL QUERY


-- 各系必修
CREATE VIEW STANDARD_CREDIT AS
SELECT SUM(credit) as stand_credit, stand_name, category FROM rule 
    GROUP BY stand_name, category;

-- 各學生有修過

CREATE VIEW COURSE_CREDIT AS
SELECT course.c_id, course.credit, name, stand_name, course.category FROM course, rule
    WHERE course.name = rule.c_name;

CREATE VIEW PERSONAL_CREDIT AS
SELECT SUM(COURSE_CREDIT.credit) AS stu_credit,
            performance.stu_id, stand_name, category
     FROM performance, COURSE_CREDIT
        WHERE performance.c_id = COURSE_CREDIT.c_id
          AND performance.grade >= 60
        GROUP BY stu_id, stand_name, category;



CREATE VIEW GRADUATION_SEPERATE AS
SELECT STANDARD_CREDIT.stand_name, STANDARD_CREDIT.category, stu_id, stu_credit, stand_credit, 
        CASE WHEN stu_credit >= stand_credit THEN "YES"
             ELSE "NO" END AS "Complete" 
    FROM  PERSONAL_CREDIT, STANDARD_CREDIT
    WHERE STANDARD_CREDIT.stand_name = PERSONAL_CREDIT.stand_name
          AND STANDARD_CREDIT.category = PERSONAL_CREDIT.category; 

CREATE VIEW GRADUATE AS
SELECT stu_id, stand_name, complete from GRADUATION_SEPERATE
    GROUP BY stu_id, stand_name
    HAVING complete = "YES"
    ORDER BY stu_id;

CREATE VIEW GRADUATE_FAIL AS
SELECT stu_id, stand_name, complete from GRADUATION_SEPERATE
    GROUP BY stu_id, stand_name
    HAVING complete = "NO"
    ORDER BY stu_id;