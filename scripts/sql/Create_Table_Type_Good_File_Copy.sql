-------------------create table type to hold good icp file names------------------
CREATE TYPE Good_File_Copy AS TABLE
(PreviousFileName VARCHAR(133), NewFileName VARCHAR(133));
GO