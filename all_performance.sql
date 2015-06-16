
-- DEMO 1: 列特定學生的個人成績單
SELECT course.name, performance.grade, student.name 
    FROM course, performance, student
    WHERE student.stu_id = performance.stu_id 
        AND course.c_id = performance.c_id
        AND student.name = "古宗禎";

SELECT course.name, performance.grade, student.name 
    FROM course, performance, student
    WHERE student.stu_id = performance.stu_id 
        AND course.c_id = performance.c_id
        AND student.name = "林致誠";



-- DEMO 2: 個人成績平均
SELECT student.name, AVG(performance.grade)
    FROM performance, student
    WHERE student.stu_id = performance.stu_id 
    GROUP BY student.name;


-- DEMO 3: 看standard 底下有哪些rule
SELECT course.name, course.department FROM course 
    WHERE course.name 
    IN(SELECT rule.c_name FROM rule 
        WHERE rule.stand_name = "日文輔系"
        );

-- DEMO 4: 看學生有修哪些學程

SELECT standard.name, student.stu_id, 
       student.name AS stu_name, grad_type.grad_year 
    FROM standard, student, grad_type
    WHERE student.stu_id = grad_type.stu_id AND
            grad_type.stand_name = standard.name
    ORDER BY standard.name DESC;



-- DEMO 5: 畢業審查
-- 各系必修學分數（以修別來分類）
CREATE VIEW STANDARD_CREDIT AS
SELECT SUM(credit) as stand_credit, stand_name, category 
       FROM rule 
       GROUP BY stand_name, category;

SELECT * FROM STANDARD_CREDIT;


-- 課程代號以及其課程所對應到的審查標準
CREATE VIEW COURSE_CREDIT AS
    SELECT course.c_id, course.credit, name, stand_name, course.category 
        FROM course, rule
        WHERE course.name = rule.c_name;

-- 一個學生所對應到的審查學分，如果他沒有申請輔系的話，
-- 系統不會自動幫他計算
-- 這裏tricky的地方是要group by COURSE_CREDIT的stand_name
-- 否則會以每個學生所修的總學分數計算
-- 但是為了讓系統不計算沒申請輔系
-- （也就是grad_type中沒有對應到stu_id和stand_name，那麼對應的stand_name就不會計算）
-- 要再加上這一行：grad_type.stand_name = COURSE_CREDIT.stand_name 
CREATE VIEW PERSONAL_CREDIT AS
    SELECT SUM(COURSE_CREDIT.credit) AS stu_credit,
                performance.stu_id, COURSE_CREDIT.stand_name, category
         FROM performance, COURSE_CREDIT, grad_type
            WHERE performance.c_id = COURSE_CREDIT.c_id
              AND grad_type.stu_id = performance.stu_id
              AND performance.grade >= 60
              AND grad_type.stand_name = COURSE_CREDIT.stand_name 
            GROUP BY stu_id, COURSE_CREDIT.stand_name, category;

SELECT * FROM PERSONAL_CREDIT;


-- 各個必修
CREATE VIEW GRADUATION_SEPERATE AS
SELECT STANDARD_CREDIT.stand_name, STANDARD_CREDIT.category, stu_id, stu_credit, stand_credit, 
        CASE WHEN stu_credit >= stand_credit THEN "YES"
             ELSE "NO" END AS "Complete" 
    FROM  PERSONAL_CREDIT, STANDARD_CREDIT
    WHERE STANDARD_CREDIT.stand_name = PERSONAL_CREDIT.stand_name
          AND STANDARD_CREDIT.category = PERSONAL_CREDIT.category; 
SELECT * FROM GRADUATION_SEPERATE;

-- 就是簡單的把可以畢業的人拿出來
CREATE VIEW GRADUATE AS
SELECT stu_id, stand_name, complete FROM GRADUATION_SEPERATE
    GROUP BY stu_id, stand_name
    HAVING complete = "YES"
    ORDER BY stu_id;
SELECT * FROM GRADUATE;

-- 就是簡單的把無法成功畢業或得到輔系的人拿出來
CREATE VIEW GRADUATE_FAIL AS
SELECT stu_id, stand_name, complete FROM GRADUATION_SEPERATE
    GROUP BY stu_id, stand_name
    HAVING complete = "NO"
    ORDER BY stu_id;

SELECT * FROM GRADUATE_FAIL;

-- 只指定畢業或者是輔系

SELECT stu_id, stand_name, complete FROM GRADUATION_SEPERATE
    WHERE stand_name IN(SELECT name FROM standard WHERE TYPE= "畢業")
    GROUP BY stu_id, stand_name
    HAVING complete = "YES"
    ORDER BY stu_id;

SELECT stu_id, stand_name, complete FROM GRADUATION_SEPERATE
    WHERE stand_name IN(SELECT name FROM standard WHERE TYPE= "畢業")
    GROUP BY stu_id, stand_name
    HAVING complete = "NO"
    ORDER BY stu_id;


SELECT stu_id, stand_name, complete FROM GRADUATION_SEPERATE
    WHERE stand_name IN(SELECT name FROM standard WHERE TYPE= "輔系")
    GROUP BY stu_id, stand_name
    HAVING complete = "NO"
    ORDER BY stu_id;
