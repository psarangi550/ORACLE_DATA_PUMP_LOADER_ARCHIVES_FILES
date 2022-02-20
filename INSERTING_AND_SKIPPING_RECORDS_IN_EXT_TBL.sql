CREATE OR REPLACE  DIRECTORY wfmt_dumps AS 'C:\Users\611903295\Downloads\Creating_dumping_archieve_wfmt_records';

DROP TABLE WFMT_DUMP_EXT

GRANT CREATE 

/*CREATING THE EXTERNAL TABLE USING THE ORACLE LOADER */

CREATE TABLE WFMT_EXT_DUMP(
        EQUIPMENT CHAR(10),
        CP_NUMBER CHAR(20),
        SCHEME CHAR(20)
)
ORGANIZATION EXTERNAL
(
TYPE ORACLE_LOADER
DEFAULT DIRECTORY "wfmt_dumps"
ACCESS PARAMETERS
(
RECORDS DELIMITED BY NEWLINE
FIELDS TERMINATED BY ','
REJECT ROWS WITH ALL NULL VALUES
MISSING FIELDS VALUES ARE NULL
(
    EQUIPMENT CHAR(10),
    CP_NUMBER CHAR(10),
    SCHEME CHAR(10)
)
)
LOCATION('wfmt.txt')
);


SELECT * FROM ALL_EXTERNAL_TABLES;

DESC WFMT_DUMP_EXT

SELECT * FROM WFMT_DUMP_EXT;

ALTER SESSION SET nls_date_format='MM-DD-YYYY'

SELECT * FROM SALES;

CREATE DIRECTORY ext_tab_dir AS 'C:\Users\611903295\Downloads\Creating_dumping_archieve_wfmt_records';

DROP TABLE emp_load

CREATE TABLE emp_load
      (employee_number      CHAR(5),
       employee_dob         CHAR(20),
       employee_last_name   CHAR(20),
       employee_first_name  CHAR(15),
       employee_middle_name CHAR(15),
     employee_hire_date   DATE)
   ORGANIZATION EXTERNAL
     (TYPE ORACLE_LOADER
      DEFAULT DIRECTORY ext_tab_dir
      ACCESS PARAMETERS
        (RECORDS DELIMITED BY NEWLINE
         FIELDS (employee_number      CHAR(2),
                 employee_dob         CHAR(20),
                 employee_last_name   CHAR(18),
                 employee_first_name  CHAR(11),
                 employee_middle_name CHAR(11),
                 employee_hire_date   CHAR(10) date_format DATE mask "mm/dd/yyyy"
                )
        )
      LOCATION ('info.dat')
     );
     
SELECT * FROM emp_load




