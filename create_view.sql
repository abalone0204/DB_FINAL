CREATE VIEW STANDARD_CREDIT AS
SELECT SUM(credit) as stand_credit, stand_name, category 
       FROM rule 
       GROUP BY stand_name, category;

CREATE VIEW COURSE_CREDIT AS
    SELECT course.c_id, course.credit, name, stand_name, course.category 
        FROM course, rule
        WHERE course.name = rule.c_name
              AND course.credit = rule.credit
              AND course.category = rule.category
              AND course.department = rule.department;

CREATE VIEW PERSONAL_CREDIT AS
    SELECT SUM(COURSE_CREDIT.credit) AS stu_credit,
                performance.stu_id, COURSE_CREDIT.stand_name, category
         FROM performance, COURSE_CREDIT, grad_type
            WHERE performance.c_id = COURSE_CREDIT.c_id
              AND grad_type.stu_id = performance.stu_id
              AND performance.grade >= 60
              AND grad_type.stand_name = COURSE_CREDIT.stand_name 
            GROUP BY stu_id, COURSE_CREDIT.stand_name, category;

CREATE VIEW GRADUATION_SEPERATE AS
SELECT STANDARD_CREDIT.stand_name, STANDARD_CREDIT.category, stu_id, stu_credit, stand_credit, 
        CASE WHEN stu_credit >= stand_credit THEN "YES"
             ELSE "NO" END AS "Complete" 
    FROM  PERSONAL_CREDIT, STANDARD_CREDIT
    WHERE STANDARD_CREDIT.stand_name = PERSONAL_CREDIT.stand_name
          AND STANDARD_CREDIT.category = PERSONAL_CREDIT.category; 


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