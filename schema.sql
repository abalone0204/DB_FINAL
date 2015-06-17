CREATE TABLE IF NOT EXISTS Student(
    STU_ID int NOT NULL PRIMARY KEY,
    NAME varchar(30) NOT NULL);

CREATE TABLE IF NOT EXISTS Course(
    C_ID varchar(20) NOT NULL PRIMARY KEY,
    NAME varchar(40) NOT NULL,
    CREDIT INT NOT NULL,
    CATEGORY varchar(30) not null,
    TEACHER varchar(20),
    DEPARTMENT varchar(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Performance(
    C_ID varchar(20) NOT NULL,
    STU_ID int NOT NULL,
    GRADE int,
    UNIQUE KEY PERFORM(STU_ID, C_ID),
    FOREIGN KEY (STU_ID) REFERENCES Student(STU_ID),
    FOREIGN KEY (C_ID) REFERENCES Course(C_ID)
);

CREATE TABLE IF NOT EXISTS Standard(
    GRAD_YEAR year not null,
    TYPE varchar(15) not null,
    NAME varchar(30) not null,
    DEPARTMENT varchar(40) not null,
    UNIQUE KEY STAND_KEY(NAME, GRAD_YEAR)
);

CREATE TABLE IF NOT EXISTS Rule(
    STAND_NAME varchar(30) not null,
    C_NAME varchar(40) not null,
    GRAD_YEAR year not null,
    CATEGORY varchar(30) not null,
    DEPARTMENT varchar(40),
    CREDIT INT not null,
    FOREIGN KEY (STAND_NAME, GRAD_YEAR) REFERENCES STANDARD(NAME, GRAD_YEAR)
);

CREATE TABLE IF NOT EXISTS Grad_type(
    STU_ID int not null,
    STAND_NAME varchar(30) not null,
    GRAD_YEAR year not null,
    FOREIGN KEY(STU_ID) REFERENCES STUDENT(STU_ID),
    FOREIGN KEY(STAND_NAME, GRAD_YEAR) REFERENCES STANDARD(NAME, GRAD_YEAR)
);

