
CREATE DIRECTORY WFMT_OUT AS 'C:\Users\611903295\Downloads\Creating_dumping_archieve_wfmt_records'

SELECT * FROM WFMT_EXT_DUMP

/* HERE CREATING A DUMP FILE TO LOAD THE DATA FROM ORACLE TABLE TO EXTERNAL DATA FILES */


CREATE TABLE WFMT_OUT_EXT
    ORGANIZATION EXTERNAL(
        TYPE ORACLE_DATAPUMP
        DEFAULT DIRECTORY WFMT_OUT
        LOCATION ('WFMT.DMP')--HERE CREATING THE DUMP FILE IN HERE 
     
    )AS SELECT * FROM WFMT_EXT_DUMP


SELECT * FROM WFMT_OUT_EXT