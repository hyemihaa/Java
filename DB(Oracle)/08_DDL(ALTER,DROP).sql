-- < ALTER > - 데이터베이스의 객체 구조를 변경해주는 구문
--           EX) 표현법 : ALTER TABLE 테이블명 내용;


CREATE TABLE DDL_ALTER (
	ALTER_ID VARCHAR2(255) PRIMARY KEY,
	ALTER_NAME VARCHAR2(255),
	ALTER_AS VARCHAR2(255)
);


-- 테이블 이름 변경
ALTER TABLE DDL_ALTER RENAME TO DDL_ALTER_TEST;

-- 테이블 구조 변경
ALTER TABLE DDL_ALTER_TEST MODIFY ( 
	ALTER_NAME VARCHAR2(30) NOT NULL,
	ALTER_AS VARCHAR2(30) NOT NULL 
);

-- 테이블 컬럼 변겅
ALTER TABLE DDL_ALTER_TEST RENAME COLUMN ALTER_NAME TO ALTER_NAME_TEST;

-- 테이블 컬럼 삭제
ALTER TABLE DDL_ALTER_TEST DROP COLUMN ALTER_NAME_TEST;

-- 테이터 컬럼 추가
ALTER TABLE DDL_ALTER_TEST ADD ( 
	ALTER_NAME VARCHAR2(30) NOT NULL 
);

SELECT * FROM DDL_ALTER_TEST DAT ;

-- 데이터 제약조건 추가
ALTER TABLE DDL_ALTER_TEST ADD CONSTRAINT ALTER_NAME_UNIQUE UNIQUE(ALTER_NAME);

-- 데이터 제약조건 삭제
ALTER TABLE DDL_ALTER_TEST DROP CONSTRAINT ALTER_NAME_UNIQUE;



-- Q1. 실습 1 ~ 7

CREATE TABLE TEST_EMPLOYEES (
   TE_ID NUMBER PRIMARY KEY,
   TE_FIRST_NAME VARCHAR2(50),
   TE_LAST_NAME VARCHAR2(50),
   TE_SALARY NUMBER,
   TE_DEPARTMENT VARCHAR2(50)
);

SELECT * FROM STAFF;  

--1. EMPLOYEES 테이블의 이름을 "STAFF"로 변경
ALTER TABLE TEST_EMPLOYEES RENAME TO STAFF;

ALTER TABLE STAFF MODIFY (TE_DEPARTMENT VARCHAR2(100));
--2. DEPARTMENT 컬럼의 데이터 형식을 VARCHAR2(100)으로 변경

ALTER TABLE STAFF RENAME COLUMN TE_LAST_NAME TO SURNAME;
--3. LASTNAME 컬럼의 이름을 "SURNAME"으로 변경

--4. FIRSTNAME 컬럼 삭제
ALTER TABLE STAFF DROP COLUMN TE_FIRST_NAME;

--5. HIREDATE라는 DATE 데이터 형식의 새로운 컬럼을 추가
 ALTER TABLE STAFF ADD (HIREDATE DATE);

--6. SALARYCHECK 라는 이름을 가진 UNIQUE 제약 조건을 추가
-- 이 제약 조건은 "TE_SALARY" 컬럼에 적용
ALTER TABLE STAFF ADD CONSTRAINT SALARYCHECK UNIQUE(TE_SALARY); 

--7. 아래 쿼리를 이용하여 PRIMARY KEY 제약조건의 이름을 확인하고 PK_EMPLOYEE로 변경
ALTER TABLE STAFF RENAME CONSTRAINT SYS_C008433 TO PK_EMPLOYEE;

-- 제약조건 조회 user_cons_columns
SELECT * FROM user_cons_columns
WHERE TABLE_NAME = 'STAFF';



--


-- < DROP > - 삭제할 때 사용되는 구문
CREATE TABLE PARENT_TB (
PARENT_ID NUMBER PRIMARY KEY,
PARENT_NAME VARCHAR2(50)
);

CREATE TABLE CHILD_TB (
CHILD_ID NUMBER PRIMARY KEY,
CHILD_NAME VARCHAR2(50),
PARENT_ID NUMBER,
CONSTRAINT FK_PARENT FOREIGN KEY (PARENT_ID) REFERENCES PARENT_TB(PARENT_ID)
);

-- CASCADE CONSTRAINTS
-- 다른 테이블과 제약 조건을 가진 테이블을 삭제 할 때 사용되며, 
-- 부모(PK)와 자식(FK)제약조건을 자동으로 삭제하여 관계를 없앤 후 테이블을 삭제시켜줌

DROP TABLE PARENT_TB CASCADE CONSTRAINTS;

SELECT * FROM CHILD_TB ct ;







