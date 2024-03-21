/*
use  master
go
drop database IIEXCinema
go
create database IIEXCinema
go 
use IIEXCinema 
go
*/

/*==============================================================*/
/* Table: BOOKING                                               */
/*==============================================================*/
create table BOOKING (
   ID                   int                  identity,
   STAFF_ID             int                  null,
   CLIENT_ID            int                  null,
   CREATED_AT           datetime             null,
   FOODPRICE            float                null,
   TICKETPRICE          float                null,
   PROMOTION_ID         int                  null,
   constraint PK_BOOKING primary key (ID)
)
go

/*==============================================================*/
/* Index: CLIENT_BOOKING_FK                                     */
/*==============================================================*/




create nonclustered index CLIENT_BOOKING_FK on BOOKING (CLIENT_ID ASC)
go

/*==============================================================*/
/* Index: STAFF_BOOKING_FK                                      */
/*==============================================================*/




create nonclustered index STAFF_BOOKING_FK on BOOKING (STAFF_ID ASC)
go
/*==============================================================*/
/* Table: FOODCOMBO                                             */
/*==============================================================*/
create table FOODCOMBO (
   ID                   int                  identity,
   NAME                 nvarchar(255)        null,
   PRICE                float                null,
   IMAGE                text                 null,
   constraint PK_FOODCOMBO primary key (ID)
)
go

/*==============================================================*/
/* Table: FOOD_BOOKING                                          */
/*==============================================================*/
create table FOOD_BOOKING (
   FOOD_ID              int                  not null,
   BOOKING_ID           int                  not null,
   QUANTITY             int                  null,
   constraint PK_FOOD_BOOKING primary key (FOOD_ID, BOOKING_ID)
)
go

/*==============================================================*/
/* Index: FOOD_BOOKING_FK                                       */
/*==============================================================*/




create nonclustered index FOOD_BOOKING_FK on FOOD_BOOKING (FOOD_ID ASC)
go

/*==============================================================*/
/* Index: FOOD_BOOKING_FK2                                      */
/*==============================================================*/




create nonclustered index FOOD_BOOKING_FK2 on FOOD_BOOKING (BOOKING_ID ASC)
go

/*==============================================================*/
/* Table: MOVIE                                                 */
/*==============================================================*/
create table MOVIE (
   ID                   int                  identity,
   TITLE                ntext                null,
   GENRE                nvarchar(50)         null,
   DURATION             int                  null,
   RATING               float                null,
   STORY                ntext                null,
   POSTER               text                 null,
   OPENING_DAY          datetime             null,
   CLOSING_DAY          datetime             null,
   constraint PK_MOVIE primary key (ID)
)
go

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT (
   ID                   int                  identity,
   NAME                 nvarchar(50)         null,
   TYPE                 nvarchar(20)         null,
   PRICE                float                null,
   QUANTITY             int                  null,
   EXPIRY_DATE          datetime             null,
   LAST_ORDER             int                  null,
   constraint PK_PRODUCT primary key (ID)
)
go


/*==============================================================*/
/* Table: PRODUCT_BOOKING                                       */
/*==============================================================*/
create table PRODUCT_BOOKING (
   PRODUCT_ID           int                  not null,
   BOOKING_ID           int                  not null,
   QUANTITY             int                  null,
   constraint PK_PRODUCT_BOOKING primary key (PRODUCT_ID, BOOKING_ID)
)
go

/*==============================================================*/
/* Index: FOOD_BOOKING_FK                                       */
/*==============================================================*/




create nonclustered index FOOD_BOOKING_FK on PRODUCT_BOOKING (PRODUCT_ID ASC)
go

/*==============================================================*/
/* Index: FOOD_BOOKING_FK2                                      */
/*==============================================================*/




create nonclustered index FOOD_BOOKING_FK2 on PRODUCT_BOOKING (BOOKING_ID ASC)
go

/*==============================================================*/
/* Table: PRODUCT_FCB                                           */
/*==============================================================*/
create table PRODUCT_FCB (
   PRODUCT_ID           int                  not null,
   FCB_ID               int                  not null,
   QUANTITY             int                  null,
   constraint PK_PRODUCT_FCB primary key (PRODUCT_ID, FCB_ID)
)
go

/*==============================================================*/
/* Index: FOOD_FCB_FK                                           */
/*==============================================================*/




create nonclustered index FOOD_FCB_FK on PRODUCT_FCB (PRODUCT_ID ASC)
go

/*==============================================================*/
/* Index: FOOD_FCB_FK2                                          */
/*==============================================================*/




create nonclustered index FOOD_FCB_FK2 on PRODUCT_FCB (FCB_ID ASC)
go

/*==============================================================*/
/* Table: PROMOTION                                             */
/*==============================================================*/
create table PROMOTION (
   ID                   int                  identity,
   CODE                 varchar(5)           null,
   DISCOUNT             float                null,
   STATUS               nvarchar(20)         null,
   NOTE                 nvarchar(255)        null,
   constraint PK_PROMOTION primary key (ID)
)
go

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE (
   ID                   int                  identity,
   NAME                 varchar(50)          null,
   constraint PK_ROLE primary key (ID)
)
go

/*==============================================================*/
/* Table: SCHEDULE                                              */
/*==============================================================*/
create table SCHEDULE (
   ID                   int                  identity,
   SHOWROOM_ID          int                  not null,
   MOVIE_ID             int                  not null,
   STARTTIME            datetime             null,
   ENDTIME              datetime             null,
   PRICE                float                null,
   constraint PK_SCHEDULE primary key (ID)
)
go

/*==============================================================*/
/* Index: MOVIE_SCHEDULE_FK                                     */
/*==============================================================*/




create nonclustered index MOVIE_SCHEDULE_FK on SCHEDULE (MOVIE_ID ASC)
go

/*==============================================================*/
/* Index: CINEMA_SCHEDULE_FK                                    */
/*==============================================================*/




create nonclustered index CINEMA_SCHEDULE_FK on SCHEDULE (SHOWROOM_ID ASC)
go

/*==============================================================*/
/* Table: SEAT                                                  */
/*==============================================================*/
create table SEAT (
   ID                   int                  identity,
   SHOWROOM_ID          int                  not null,
   SEATNUMBER           varchar(5)           null,
   SEATTYPE             varchar(20)          null,
   constraint PK_SEAT primary key (ID)
)
go

/*==============================================================*/
/* Index: THEATER_SEAT_FK                                       */
/*==============================================================*/




create nonclustered index THEATER_SEAT_FK on SEAT (SHOWROOM_ID ASC)
go

/*==============================================================*/
/* Table: SHOWROOM                                              */
/*==============================================================*/
create table SHOWROOM (
   ID                   int                  identity,
   SHOWROOMNUMBER       int                  null,
   constraint PK_SHOWROOM primary key (ID)
)
go

/*==============================================================*/
/* Table: STAFF                                                 */
/*==============================================================*/
create table STAFF (
   ID                   int                  identity,
   EMAIL                varchar(50)          null,
   PASSWORD             varchar(50)          null,
   FIRSTNAME            nvarchar(50)         null,
   LASTNAME             nvarchar(20)         null,
   SEX                  nvarchar(5)          null,
   BIRTHDAY             datetime             null,
   PHONE                char(15)             null,
   ADDRESS              nvarchar(255)        null,
   SALARY               float                null,
   ROLE_ID              int                  null,
   constraint PK_STAFF primary key (ID)
)
go

/*==============================================================*/
/* Table: STATITICS                                             */
/*==============================================================*/
create table STATITICS (
   ID                   int                  identity,
   STAFF_ID             int                  null,
   TOTAL_PRICE          float                null,
   TOTAL_CASH           float                null,
   CREATED_AT           datetime             null,
   STATUS               nvarchar(20)         null,
   NOTE                 nvarchar(255)        null,
   constraint PK_STATITICS primary key (ID)
)
go


/*==============================================================*/
/* Table: TICKET                                                */
/*==============================================================*/
create table TICKET (
   ID                   int                  identity,
   BOOKING_ID           int                  null,
   PRICE                float                null,
   SCHEDULE_ID          int                  null,
   SEAT_ID              int                  null,
   constraint PK_TICKET primary key (ID)
)
go

/*==============================================================*/
/* Index: TICKET_BOOKING_FK                                     */
/*==============================================================*/




create nonclustered index TICKET_BOOKING_FK on TICKET (BOOKING_ID ASC)
go

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" (
   ID                   int                  identity,
   USERNAME             varchar(50)          null,
   PASSWORD             varchar(50)          null,
   NAME                 nvarchar(50)         null,
   PHONE                char(15)             null,
   ADDRESS              nvarchar(255)        null,
   constraint PK_USER primary key (ID)
)
go
/*==============================================================*/
/* Table: "City"                                                */
/*==============================================================*/
CREATE TABLE City (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255)
);
go
/*==============================================================*/
/* Table: "GENRE"                                                */
/*==============================================================*/
CREATE TABLE GENRE (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255)
);
go
/*==============================================================*/
/* Table: "ProductType"                                         */
/*==============================================================*/
CREATE TABLE ProductType (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(255)
);
go


alter table BOOKING
   add constraint FK_BOOKING_REF_PROMOTIO foreign key (PROMOTION_ID)
      references PROMOTION (ID)
         on update cascade
go
alter table STATITICS
   add constraint FK_STATITIC_REF_STAFF foreign key (STAFF_ID)
      references STAFF (ID)
         on update cascade
go
alter table BOOKING
   add constraint FK_BOOKING_CLIENT foreign key (CLIENT_ID)
      references "USER" (ID)
         on update cascade
go

alter table BOOKING
   add constraint FK_BOOKING_STAFF foreign key (STAFF_ID)
      references STAFF (ID)
      on update cascade
go

alter table FOOD_BOOKING
   add constraint FK_FCB_BOOKING foreign key (BOOKING_ID)
      references BOOKING (ID)
      on update cascade
go

alter table FOOD_BOOKING
   add constraint FK_Booking_FCB foreign key (FOOD_ID)
      references FOODCOMBO (ID)
      on update cascade
go

alter table PRODUCT_BOOKING
   add constraint FK_PRODUCT_BOOKING__REF_BOOKING foreign key (BOOKING_ID)
      references BOOKING (ID)
      on update cascade
go

alter table PRODUCT_BOOKING
   add constraint FK_PRODUCT_BOOKING__REF_PRODUCT foreign key (PRODUCT_ID)
      references PRODUCT (ID)
      on update cascade
go

alter table PRODUCT_FCB
   add constraint FK_FCB_PRODUCT foreign key (FCB_ID)
      references FOODCOMBO (ID)
         on update cascade  on delete cascade        
go

alter table PRODUCT_FCB
   add constraint FK_PRODUCT_FCB foreign key (PRODUCT_ID)
      references PRODUCT (ID)
         on update cascade 
go

alter table SCHEDULE
   add constraint FK_SCHEDULE_MOVIE foreign key (MOVIE_ID)
      references MOVIE (ID)
         on update cascade on delete cascade
go

alter table SCHEDULE
   add constraint FK_SCHEDULE_SHOWROOM foreign key (SHOWROOM_ID)
      references SHOWROOM (ID)
         on update cascade on delete cascade
go

alter table SEAT
   add constraint FK_SEAT_SHOWROOM foreign key (SHOWROOM_ID)
      references SHOWROOM (ID)
         on update cascade on delete cascade
go

alter table STAFF
   add constraint FK_STAFF_REF_ROLE foreign key (ROLE_ID)
      references ROLE (ID)
         on update cascade on delete set null
go

alter table TICKET
   add constraint FK_TICKET_REF_SCHEDULE foreign key (SCHEDULE_ID)
      references SCHEDULE (ID)
      on update cascade
go

alter table TICKET
   add constraint FK_TICKET_REF_SEAT foreign key (SEAT_ID)
      references SEAT (ID)
go

alter table TICKET
   add constraint FK_TICKET_BOOKING foreign key (BOOKING_ID)
      references BOOKING (ID)
      on update cascade
go

/*==============================================================*/
/*                        Proc                                  */
/*==============================================================*/
CREATE PROCEDURE [dbo].[search_promotion_by_code]
    @code NVARCHAR(50)
AS
BEGIN
    SELECT [ID], [CODE], [DISCOUNT], [STATUS], [NOTE]
    FROM [dbo].[PROMOTION]
    WHERE LOWER([CODE]) like '%' +  LOWER(@code) +  '%' 
END;
go
----------------------------------------------------- Tìm kiếm sản phẩm
CREATE proc [dbo].[search_product] @DataToFind Nvarchar(100)
AS
Select *   From   PRODUCT 
Where  LOWER(NAME) Like '%' + LOWER(@DataToFind) + '%'
go

CREATE PROCEDURE [dbo].[search_foodcombo]
    @searchTerm NVARCHAR(100)
AS
BEGIN
    SELECT
        fc.ID AS ID,
        fc.NAME AS NAME,
        MAX(CASE WHEN p.TYPE = 'FOOD' THEN p.NAME ELSE NULL END) AS FOOD,
        STUFF((SELECT ',' + CAST(pf.QUANTITY AS VARCHAR) 
               FROM product_fcb pf 
               JOIN product p2 ON pf.PRODUCT_ID = p2.ID 
               WHERE p2.TYPE = 'FOOD' AND pf.FCB_ID = fc.ID 
               FOR XML PATH('')), 1, 1, '') AS FOOD_QUANTITY,
        MAX(CASE WHEN p.TYPE = 'DRINK' THEN p.NAME ELSE NULL END) AS DRINK,
        STUFF((SELECT ',' + CAST(pf.QUANTITY AS VARCHAR) 
               FROM product_fcb pf 
               JOIN product p2 ON pf.PRODUCT_ID = p2.ID 
               WHERE p2.TYPE = 'DRINK' AND pf.FCB_ID = fc.ID 
               FOR XML PATH('')), 1, 1, '') AS DRINK_QUANTITY,
        fc.PRICE AS PRICE,
        CAST(fc.Image AS NVARCHAR(MAX)) as IMAGE
    FROM foodcombo fc
    JOIN product_fcb pf ON fc.ID = pf.FCB_ID
    JOIN product p ON pf.PRODUCT_ID = p.ID
    WHERE fc.NAME LIKE '%' + @searchTerm + '%'
    GROUP BY fc.ID, fc.NAME, fc.PRICE, CAST(fc.Image AS NVARCHAR(MAX))
END;
go
------------------------------------------------------------
CREATE PROCEDURE [dbo].[get_movies_in_schedule]
AS
BEGIN
    SELECT M.[ID], M.[GENRE], M.[DURATION], M.[RATING], M.[STORY], M.[POSTER], M.[OPENING_DAY], M.[CLOSING_DAY], M.[TITLE]
    FROM [dbo].[MOVIE] AS M
    JOIN [dbo].[SCHEDULE] AS S ON M.[ID] = S.[MOVIE_ID]
   
END;
go

-----------------------------------------------------Đổi mật khẩu
CREATE PROCEDURE change_password
    @StaffID INT,
    @OldPassword VARCHAR(50),
    @NewPassword VARCHAR(50)
AS
BEGIN
    -- Check if the old password is correct
    IF EXISTS (SELECT 1 FROM STAFF WHERE ID = @StaffID AND PASSWORD = @OldPassword)
    BEGIN
        -- Update the password
        UPDATE STAFF
        SET PASSWORD = @NewPassword
        WHERE ID = @StaffID;

        SELECT 1 AS Result; -- Password changed successfully
    END
    ELSE
    BEGIN
        SELECT 0 AS Result; -- Incorrect old password
    END;
END;
go

--drop proc search_product
go

----------------------------------------------------- Login
CREATE PROCEDURE Login (@email varchar(30),@password varchar(30))
As 
   SELECT * FROM Staff WHERE BINARY_CHECKSUM(EMAIL) = BINARY_CHECKSUM(@email)
    AND BINARY_CHECKSUM(PASSWORD) = BINARY_CHECKSUM(@password)
GO
--DROP PROC LOGIN
--exec Login 'admin', 'admin'
go

----------------------------------------------------- Tìm kiếm nhân viên
CREATE PROCEDURE search_staff
    @DataToFind NVARCHAR(100)
AS
BEGIN
    SELECT *
    FROM STAFF
    WHERE LOWER(EMAIL) LIKE '%' + LOWER(@DataToFind) + '%'
        OR LOWER(PHONE) LIKE '%' + LOWER(@DataToFind) + '%'
        OR LOWER(FIRSTNAME) LIKE '%' + LOWER(@DataToFind) + '%'
        OR LOWER(LASTNAME) LIKE '%' + LOWER(@DataToFind) + '%'
        OR LOWER(ADDRESS) LIKE '%' + LOWER(@DataToFind) + '%'
END
go
---------------------------------------------------Tìm kiếm phim
CREATE PROCEDURE [dbo].[Search_movie]
   @DataFind Nvarchar(50)
AS
BEGIN
    SELECT [ID], [TITLE], [GENRE], [DURATION], [RATING], [STORY], [POSTER], [OPENING_DAY], [CLOSING_DAY]
    FROM [IIEXCinema].[dbo].[MOVIE]
    WHERE LOWER(CAST(movie.TITLE AS NVARCHAR(MAX))) LIKE '%' + LOWER(@DataFind) + '%'
    OR LOWER([GENRE]) LIKE '%' + LOWER(@DataFind) + '%'
END
go
----------------------------------------------------------------------------- Tìm lịch chiếu phim
CREATE PROCEDURE [dbo].[search_schedule]
    @SHOWROOM_id INT,
    @keyword Nvarchar(60)
AS
SELECT 
    schedule.ID,
    SHOWROOM.SHOWROOMNUMBER,
    CAST(MOVIE.POSTER AS varchar(MAX)) AS POSTER,
    CAST(movie.TITLE AS NVARCHAR(MAX)) AS TITLE,
    movie.DURATION,
    SCHEDULE.STARTTIME,
    SCHEDULE.ENDTIME,
    SCHEDULE.PRICE
FROM 
    schedule
INNER JOIN 
    SHOWROOM ON schedule.SHOWROOM_ID = SHOWROOM.ID
INNER JOIN 
    movie ON movie.ID = schedule.MOVIE_ID
WHERE 
    SHOWROOM.ID = @SHOWROOM_id
    AND (LOWER(CAST(movie.TITLE AS NVARCHAR(MAX))) LIKE '%' + LOWER(@keyword) + '%' OR LOWER(CAST(MOVIE.POSTER AS varchar(MAX))) LIKE '%' + LOWER(@keyword) + '%')
ORDER BY 
    schedule.STARTTIME DESC
go
---------------------------------------------------------- Tạo phòng chiếu
CREATE PROCEDURE create_showroom
  @SHOWROOM_num INT
AS
BEGIN
  -- Tạo rạp chiếu phim mới
  INSERT INTO SHOWROOM 
  VALUES (@SHOWROOM_num);

  -- Lấy ID của rạp chiếu phim mới
  DECLARE @SHOWROOM_id INT;
  SET @SHOWROOM_id = SCOPE_IDENTITY();

  -- Tạo các ghế Standard trong rạp chiếu phim    
  DECLARE @letters VARCHAR(8);
  DECLARE @number INT;
  DECLARE @letter_index INT;
  DECLARE @letter CHAR(1);

  SET @letters = 'ABCDEFGH';

  SET @letter_index = 1;
  WHILE @letter_index <= LEN(@letters)
  BEGIN
    SET @number = 1;
    WHILE @number <= 10
    BEGIN
      SET @letter = SUBSTRING(@letters, @letter_index, 1);
      INSERT INTO seat (SHOWROOM_ID, SEATNUMBER, SEATTYPE)
      VALUES (@SHOWROOM_id, CONCAT(@letter, @number), 'Standard');
	  SET @number = @number + 1;
    END;
	SET @letter_index = @letter_index + 1;
  END;

  -- Tạo các ghế Couple trong rạp chiếu phim
  SET @letters = 'IJ';
  SET @number = 1;

  WHILE @number <= 5
  BEGIN
    SET @letter_index = 1;

    WHILE @letter_index <= LEN(@letters)
    BEGIN
      SET @letter = SUBSTRING(@letters, @letter_index, 1);
      INSERT INTO seat (SHOWROOM_ID, SEATNUMBER, SEATTYPE)
      VALUES (@SHOWROOM_id, CONCAT(@letter, @number), 'Couple');
      SET @letter_index = @letter_index + 1;
    END;

    SET @number = @number + 1;
  END;
END;
go


-- select * from SEAT
-- drop proc create_showroom


----------------------------------------------- Tạo lịch chiếu phim


---drop proc create_schedule
CREATE PROCEDURE create_schedule
    @p_SHOWROOMID INT,
    @p_movieID INT,
    @p_startTime DATETIME,
    @p_price FLOAT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check for schedule conflicts within the showroom
    IF EXISTS (
        SELECT 1
		FROM SCHEDULE
		WHERE SHOWROOM_ID = @p_SHOWROOMID
		  AND (
			(@p_startTime >= STARTTIME AND @p_startTime < ENDTIME) 
			OR
			(DATEADD(MINUTE, (SELECT DURATION FROM MOVIE WHERE ID = @p_movieID), @p_startTime) > STARTTIME 
			 AND @p_startTime < ENDTIME)
		  )
    )
    BEGIN
        -- Handle the conflict (e.g., raise an error, return a message)
        THROW 51000, 'Schedule conflict: The showroom is already booked at this time.', 1;
        RETURN;
    END;

    DECLARE @seatCount INT;
    SET @seatCount = 90;

    -- Insert the schedule
    INSERT INTO SCHEDULE (SHOWROOM_ID, MOVIE_ID, STARTTIME, ENDTIME, PRICE)
    SELECT @p_SHOWROOMID, @p_movieID, @p_startTime, DATEADD(MINUTE, (SELECT DURATION FROM MOVIE WHERE ID = @p_movieID), @p_startTime), @p_price;   
END;
GO


----------------------------------------------------- Lấy lịch chiếu của 1 phòng
CREATE PROCEDURE [dbo].[get_schedule_by_showroom]
	@SHOWROOM_id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		schedule.ID,
		SHOWROOM.SHOWROOMNUMBER,
		CAST(MOVIE.POSTER AS varchar(MAX)) AS POSTER,
		CAST(movie.TITLE AS NVARCHAR(MAX)) AS TITLE,
		movie.DURATION,
		SCHEDULE.STARTTIME,
		SCHEDULE.ENDTIME,
		SCHEDULE.PRICE
	FROM 
		schedule
	INNER JOIN 
		SHOWROOM ON schedule.SHOWROOM_ID = SHOWROOM.ID

	INNER JOIN 
		movie ON movie.ID = schedule.MOVIE_ID
	WHERE 
		 SHOWROOM.ID = @SHOWROOM_id
	GROUP BY 
		schedule.ID,
		CAST(movie.TITLE AS NVARCHAR(MAX)),
		movie.DURATION,
		schedule.SHOWROOM_ID,
		schedule.MOVIE_ID,
		schedule.STARTTIME,
		SCHEDULE.ENDTIME,
		schedule.PRICE,
		SHOWROOM.SHOWROOMNUMBER,
		CAST(MOVIE.POSTER AS varchar(MAX))
	ORDER BY 
		schedule.STARTTIME desc
END
GO

--exec [get_schedule_by_showroom] 1
go
-- drop proc get_schedule_by_showroom

----------------------------------------------------- Lấy lịch chiếu của 1 phim
CREATE PROCEDURE [dbo].[get_schedule_by_movie]
	@MOVIE_id INT
AS
BEGIN
	SELECT schedule.ID,SHOWROOM.SHOWROOMNUMBER,CAST(MOVIE.POSTER AS varchar(MAX)) As POSTER, CAST(movie.TITLE AS NVARCHAR(MAX)) As TITLE
	, movie.DURATION, SCHEDULE.STARTTIME,Schedule.PRICE, SCHEDULE.ENDTIME, COUNT(TICKET.ID) AS BOOKED
	FROM schedule
	INNER JOIN SHOWROOM ON schedule.SHOWROOM_ID = SHOWROOM.ID
	INNER JOIN TICKET ON schedule.ID = TICKET.SCHEDULE_ID
	INNER JOIN movie ON movie.ID = schedule.MOVIE_ID
	WHERE  MOVIE.ID = @MOVIE_id
	GROUP BY schedule.ID, CAST(movie.TITLE AS NVARCHAR(MAX)), movie.DURATION,schedule.SHOWROOM_ID, 
	schedule.MOVIE_ID, schedule.STARTTIME, SCHEDULE.ENDTIME, schedule.PRICE, SHOWROOM.SHOWROOMNUMBER, CAST(MOVIE.POSTER AS varchar(MAX))
	ORDER BY 
		schedule.STARTTIME desc
END
go
-- exec [get_schedule_by_movie] 1
select * from schedule 
go
-- drop proc [get_schedule_by_movie]

-------------------------------------------------- lấy danh sách phim đang chiếu
CREATE proc getIshowingMovie 
AS
BEGIN
   SELECT  MOVIE.*
   FROM MOVIE 
   WHERE GETDATE() BETWEEN MOVIE.OPENING_DAY AND MOVIE.CLOSING_DAY;
END
GO
-- drop PROC getIshowingMovie
-- EXEC getIshowingMovie
GO

-------------------------------------------------- Lấy các ghế đã được đặt 
CREATE PROCEDURE get_booked_seats
    @schedule_id INT
AS
BEGIN
    SELECT seat.ID, seat.SEATNUMBER, SEAT.SEATTYPE, TICKET.ID, BOOKING_ID, SCHEDULE_ID
    FROM seat
    INNER JOIN TICKET ON seat.ID = TICKET.SEAT_ID
    INNER JOIN schedule ON schedule.ID = TICKET.SCHEDULE_ID
    WHERE  schedule.ID = @schedule_id
END;
go
-- drop proc get_booked_seats 
-- exec get_booked_seats 5
-- select * from TICKET
-- select * from booking
go
--------------------------------- Lấy danh sách các ghế
CREATE PROCEDURE get_seats
    @schedule_id INT
AS
BEGIN
    SELECT seat.ID, seat.SEATNUMBER, SEAT.SEATTYPE
    FROM seat
	INNER JOIN SHOWROOM ON SHOWROOM.ID = SEAT.SHOWROOM_ID
    INNER JOIN schedule ON SHOWROOM.ID = SCHEDULE.SHOWROOM_ID
    WHERE
         schedule.ID = @schedule_id
END;
go
-- select * from seat
-- exec get_seats 1 
go
-- drop proc get_seats


------------------------------------------------- Lấy các combo
CREATE PROCEDURE dbo.get_foodcombo
AS
BEGIN
    SELECT
        fc.ID AS ID,
        fc.NAME AS NAME,
        MAX(CASE WHEN p.TYPE = 'FOOD' THEN p.NAME ELSE NULL END) AS FOOD,
        STUFF((SELECT ',' + CAST(pf.QUANTITY AS VARCHAR) 
               FROM product_fcb pf 
               JOIN product p2 ON pf.PRODUCT_ID = p2.ID 
               WHERE p2.TYPE = 'FOOD' AND pf.FCB_ID = fc.ID 
               FOR XML PATH('')), 1, 1, '') AS FOOD_QUANTITY,
        MAX(CASE WHEN p.TYPE = 'DRINK' THEN p.NAME ELSE NULL END) AS DRINK,
        STUFF((SELECT ',' + CAST(pf.QUANTITY AS VARCHAR) 
               FROM product_fcb pf 
               JOIN product p2 ON pf.PRODUCT_ID = p2.ID 
               WHERE p2.TYPE = 'DRINK' AND pf.FCB_ID = fc.ID 
               FOR XML PATH('')), 1, 1, '') AS DRINK_QUANTITY,
        fc.PRICE AS PRICE,
         CAST(fc.Image AS NVARCHAR(MAX)) as IMAGE
    FROM foodcombo fc
    JOIN product_fcb pf ON fc.ID = pf.FCB_ID
    JOIN product p ON pf.PRODUCT_ID = p.ID
    GROUP BY fc.ID, fc.NAME, fc.PRICE, CAST(fc.Image AS NVARCHAR(MAX))
END;
go
--- exec get_foodcombo
go

------------------------------------------------ Lấy combo by ID
CREATE PROCEDURE dbo.get_foodcombo_by_id @id int
AS
BEGIN
    SELECT
        fc.ID AS ID,
        fc.NAME AS NAME,
        MAX(CASE WHEN p.TYPE = 'FOOD' THEN p.NAME ELSE NULL END) AS FOOD,
        STUFF((SELECT ',' + CAST(pf.QUANTITY AS VARCHAR) 
               FROM product_fcb pf 
               JOIN product p2 ON pf.PRODUCT_ID = p2.ID 
               WHERE p2.TYPE = 'FOOD' AND pf.FCB_ID = fc.ID 
               FOR XML PATH('')), 1, 1, '') AS FOOD_QUANTITY,
        MAX(CASE WHEN p.TYPE = 'DRINK' THEN p.NAME ELSE NULL END) AS DRINK,
        STUFF((SELECT ',' + CAST(pf.QUANTITY AS VARCHAR) 
               FROM product_fcb pf 
               JOIN product p2 ON pf.PRODUCT_ID = p2.ID 
               WHERE p2.TYPE = 'DRINK' AND pf.FCB_ID = fc.ID 
               FOR XML PATH('')), 1, 1, '') AS DRINK_QUANTITY,
        fc.PRICE AS PRICE,
         CAST(fc.Image AS NVARCHAR(MAX)) as IMAGE
    FROM foodcombo fc
    JOIN product_fcb pf ON fc.ID = pf.FCB_ID
    JOIN product p ON pf.PRODUCT_ID = p.ID
    WHERE FC.ID = @id
    GROUP BY fc.ID, fc.NAME, fc.PRICE, CAST(fc.Image AS NVARCHAR(MAX))
END;
go
--- exec get_foodcombo_by_id 1
go

------------------------------------------------- Đặt vé 
CREATE PROC create_booking  @staffID int,@promotionID int, @bookingID int OUTPUT
AS
BEGIN
   -- TAO BOOKING
      INSERT INTO [dbo].[BOOKING]
           ([STAFF_ID]
           ,[CREATED_AT]
		   ,[FOODPRICE]
		   ,[TICKETPRICE]
		   ,[PROMOTION_ID])
      VALUES
           (@staffID         
           ,GETDATE()
		   ,0
		   ,0
		   ,@promotionID)
   -- LAY ID CUA BOOKING VUA TAO
      SET @bookingID = SCOPE_IDENTITY();
      SELECT @bookingID as BOOKING_id;
END
GO

CREATE PROC create_booking_without_promotion   @staffID int, @bookingID int OUTPUT
AS
BEGIN
   -- TAO BOOKING
      INSERT INTO [dbo].[BOOKING]
           ([STAFF_ID]
           ,[CREATED_AT]
		   ,[FOODPRICE]
		   ,[TICKETPRICE])
      VALUES
           (@staffID         
           ,GETDATE()
		   ,0
		   ,0)
   -- LAY ID CUA BOOKING VUA TAO
      SET @bookingID = SCOPE_IDENTITY();
      SELECT @bookingID as BOOKING_id;
END
GO

--drop proc create_booking



-- THEM THONG TIN VE COMBO DO AN

-- CAP NHAT TRANG THAI CUA CAC VE


-------------------------------------------- Tổng doanh thu trong ngày của nhân viên
CREATE PROCEDURE get_price_sum
    @staff_id INT,
    @created_at DATE
AS
BEGIN
    SELECT SUM((FOODPRICE + TICKETPRICE) *(100 - COALESCE(Promotion.Discount, 0))/ 100) AS TotalPrice
    FROM [IIEXCinema].[dbo].[BOOKING]
    LEFT JOIN Promotion ON Promotion.ID = BOOKING.promotion_id
    WHERE [STAFF_ID] = @staff_id AND CAST([CREATED_AT] AS DATE) = @created_at
END
GO

--drop proc  get_price_sum 
-- select * from statitics
-- EXEC get_price_sum 2, '03/16/2023'
GO
-----------------------------------------------------------------Doanh thu theo thang
CREATE PROC get_revenue_by_month @month date
AS
BEGIN
	SELECT
		CAST(CREATED_AT AS DATE) AS BookingDate,
		SUM((FOODPRICE + TICKETPRICE) * (100 - COALESCE(Promotion.Discount, 0)) / 100) AS TotalPrice
	FROM
		[IIEXCinema].[dbo].[BOOKING]
	LEFT JOIN
		Promotion ON Promotion.ID = BOOKING.promotion_id
	where MONTH(CREATED_AT) = MONTH(@month) and YEAR(CREATED_AT) = YEAR(@month)
	GROUP BY 
		CAST(CREATED_AT AS DATE)
	ORDER BY
		CAST(CREATED_AT AS DATE)
END
GO
--EXEC get_revenue_by_month '03/01/2023'
GO
/*==============================================================*/
/*                        TRIGGERS                              */
/*==============================================================*/



--Select ID, CONCAT(Name, ' - ', Price) AS Name_Price from product

--Select * from food_booking  
CREATE TRIGGER CheckDuplicateSeat
ON TICKET
AFTER INSERT
AS
BEGIN
    IF  (
        (SELECT count(*) from ticket, inserted WHERE ticket.SCHEDULE_ID = inserted.SCHEDULE_ID and ticket.SEAT_ID = inserted.SEAT_ID) >1
    )
    BEGIN
        RAISERROR('Duplicate seat found within the same schedule.', 16, 1)
        ROLLBACK TRANSACTION
		RETURN
    END
	----
	UPDATE booking
    SET TICKETPRICE = (SELECT SUM(price)
                        FROM ticket
                        WHERE BOOKING_ID = (SELECT BOOKING_ID FROM inserted))
    WHERE ID = (SELECT BOOKING_ID FROM inserted)
END
go

-- drop  TRIGGER CheckDuplicateSeat
-------------------------------------- ON TICKET UPDATE
CREATE TRIGGER update_ticket
ON ticket
AFTER UPDATE
AS
BEGIN
    IF  (
        (SELECT count(*) from ticket, inserted WHERE ticket.SCHEDULE_ID = inserted.SCHEDULE_ID and ticket.SEAT_ID = inserted.SEAT_ID) >1
    )
    BEGIN
        RAISERROR('Duplicate seat found within the same schedule.', 16, 1)
        ROLLBACK TRANSACTION
		RETURN
    END
	----
	UPDATE booking
    SET TICKETPRICE = (SELECT SUM(price)
                        FROM ticket
                        WHERE BOOKING_ID = (SELECT BOOKING_ID FROM inserted))
    WHERE ID = (SELECT BOOKING_ID FROM inserted)
END
GO
----------------------------------------ON FOOD_BOOKING INSERT
CREATE TRIGGER insert_food_booking
ON food_booking
AFTER INSERT
AS
BEGIN

    UPDATE booking
    SET FOODPRICE = ISNULL((SELECT SUM(p.PRICE * pb.QUANTITY)
                           FROM product p
                           INNER JOIN product_booking pb ON pb.PRODUCT_ID = p.ID
                           WHERE pb.BOOKING_ID = (SELECT BOOKING_ID FROM inserted)), 0)
                     + ISNULL((SELECT SUM(fc.PRICE * fb.QUANTITY)
                               FROM foodcombo fc
                               INNER JOIN food_booking fb ON fb.FOOD_ID = fc.ID
                               WHERE fb.BOOKING_ID = (SELECT BOOKING_ID FROM inserted)), 0)
    WHERE ID = (SELECT BOOKING_ID FROM inserted);
    
    UPDATE p
    SET p.QUANTITY = p.QUANTITY - (fb.QUANTITY * pf.QUANTITY)
    FROM product p
    INNER JOIN product_fcb pf ON p.ID = pf.PRODUCT_ID
    INNER JOIN food_booking fb ON pf.FCB_ID = fb.FOOD_ID
    WHERE fb.BOOKING_ID = (SELECT BOOKING_ID FROM inserted);
END
go

---------------------------------------- ON product_booking
CREATE TRIGGER insert_product_booking
ON product_booking
AFTER INSERT
AS
BEGIN
   UPDATE booking
    SET FOODPRICE = ISNULL((SELECT SUM(p.PRICE * pb.QUANTITY)
                           FROM product p
                           INNER JOIN product_booking pb ON pb.PRODUCT_ID = p.ID
                           WHERE pb.BOOKING_ID = (SELECT BOOKING_ID FROM inserted)), 0)
                     + ISNULL((SELECT SUM(fc.PRICE * fb.QUANTITY)
                               FROM foodcombo fc
                               INNER JOIN food_booking fb ON fb.FOOD_ID = fc.ID
                               WHERE fb.BOOKING_ID = (SELECT BOOKING_ID FROM inserted)), 0)
    WHERE ID = (SELECT BOOKING_ID FROM inserted);
    
    UPDATE p
    SET p.QUANTITY = p.QUANTITY - pb.QUANTITY
    FROM product p
    INNER JOIN product_booking pb ON pb.PRODUCT_ID = p.ID
    WHERE pb.BOOKING_ID = (SELECT BOOKING_ID FROM inserted);
END
GO

-----------------TEST
-- Select STATITICS.*, STAFF.FIRSTNAME, STAFF.LASTNAME from STATITICS, STAFF WHERE STATITICS.STAFF_ID = STAFF.ID ORDER BY STATITICS.CREATED_AT


/*==============================================================*/
/*                        Insert                                */
/*==============================================================*/
INSERT INTO CITY (NAME)
VALUES
    (N'An Giang'),
    (N'Bà Rịa - Vũng Tàu'),
    (N'Bạc Liêu'),
    (N'Bắc Giang'),
    (N'Bắc Kạn'),
    (N'Bắc Ninh'),
    (N'Bến Tre'),
    (N'Bình Dương'),
    (N'Bình Định'),
    (N'Bình Phước'),
    (N'Bình Thuận'),
    (N'Cà Mau'),
    (N'Cao Bằng'),
    (N'Cần Thơ'),
    (N'Đà Nẵng'),
    (N'Đắk Lắk'),
    (N'Đắk Nông'),
    (N'Điện Biên'),
    (N'Đồng Nai'),
    (N'Đồng Tháp'),
    (N'Gia Lai'),
    (N'Hà Giang'),
    (N'Hà Nam'),
    (N'Hà Nội'),
    (N'Hà Tĩnh'),
    (N'Hải Dương'),
    (N'Hải Phòng'),
    (N'Hậu Giang'),
    (N'Hòa Bình'),
    (N'Hưng Yên'),
    (N'Khánh Hòa'),
    (N'Kiên Giang'),
    (N'Kon Tum'),
    (N'Lai Châu'),
    (N'Lâm Đồng'),
    (N'Lạng Sơn'),
    (N'Lào Cai'),
    (N'Long An'),
    (N'Nam Định'),
    (N'Nghệ An'),
    (N'Ninh Bình'),
    (N'Ninh Thuận'),
    (N'Phú Thọ'),
    (N'Phú Yên'),
    (N'Quảng Bình'),
    (N'Quảng Nam'),
    (N'Quảng Ngãi'),
    (N'Quảng Ninh'),
    (N'Quảng Trị'),
    (N'Sóc Trăng'),
    (N'Sơn La'),
    (N'Tây Ninh'),
    (N'Thái Bình'),
    (N'Thái Nguyên');
go
INSERT INTO ProductType VALUES ('FOOD'),('DRINK');
go
INSERT INTO GENRE VALUES ('Action'), ('Comedy'), ('Drama'), ('Horror'), ('Romance'), ('Thriller')
go

INSERT INTO [dbo].[PRODUCT]
([NAME]
,[TYPE]
,[PRICE]
,[QUANTITY]
,[EXPIRY_DATE]
,[LAST_ORDER])
VALUES
(N'Bắp rang bơ','FOOD',45000,50000,'08/12/2023',50000),
(N'Coca','DRINK',15000,50000,'08/12/2023', 50000),
(N'Redbull','DRINK',20000,50000,'08/12/2023', 50000),
(N'Pepsi','DRINK',15000,50000,'08/12/2023', 50000)
GO
INSERT INTO [dbo].[FOODCOMBO]
           ([NAME]
           ,[PRICE]
           ,[IMAGE])
     VALUES
		   (N'1 Bắp + 1 Nước Coca'
           ,70000
           ,'images.jpg'),
		   (N'1 Bắp 1 + 1 Nước Redbull'
           ,75000
           ,'images.jpg'),
		   (N'1 Bắp 1 + 1 Nước Pepsi'
           ,75000
           ,'images.jpg'),
		   (N'1 Bắp + 2 Nước Coca'
           ,90000
           ,'images.jpg'),
		   (N'1 Bắp + 2 Nước Redbull'
           ,95000
           ,'images.jpg'),
		   (N'1 Bắp + 2 Nước Pepsi'
           ,95000
           ,'images.jpg')
GO
INSERT INTO [dbo].[PRODUCT_FCB] ( [PRODUCT_ID] , [FCB_ID] , [QUANTITY])
VALUES 
       ( 1 , 1 , 1 ),
       ( 1 , 2 , 1 ),
       ( 1 , 3 , 1 ),
       ( 1 , 4 , 1 ),
       ( 1 , 5 , 1 ),
       ( 1 , 6 , 1 ),
       (  2, 1 , 1 ),
       (  3, 2 , 1 ),
       (  4, 3 , 1 ),
       (  2, 4 , 2 ),
       ( 3, 5 , 2 ),
       (  4, 6 , 2 )
go
INSERT INTO [dbo].[ROLE]
           ([NAME])
     VALUES
                  ('Admin'),
		   ('HR Manager'),
		   ('Clerk'),
		   ('Warehouse'),
		   ('PartTime')
GO
-------------------------------------------Them NV
INSERT INTO [dbo].[STAFF]
           ([EMAIL]
           ,[PASSWORD]
           ,[FIRSTNAME]
           ,[LASTNAME]
           ,[SEX]
           ,[BIRTHDAY]
           ,[PHONE]
           ,[ADDRESS]
           ,[SALARY]
           ,[ROLE_ID])
     VALUES
           ('admin@app.com'
           ,'admin'
           ,N'Lê Hoàng'
           ,N'Phú'
           ,'Nam'
           ,'03/20/2003'
           ,'0123456789'
           ,N'Quận 7'
           ,50000 
           ,1)
GO
INSERT INTO STAFF (EMAIL, PASSWORD, FIRSTNAME, LASTNAME, SEX, BIRTHDAY, PHONE, ADDRESS, SALARY, ROLE_ID) VALUES ('hr@app.com', 'admin', N'Matthew', N'Hood', N'Nam', '12/29/2001', '0877428444', N'9026 Samuel Springs Apt. 102, East Amyhaven, AS 52734', 5000000, 2),
('clerk@app.com', 'admin', N'Angela', N'Miller', N'Nam', '07/03/1993', '0509188258', N'33128 Robinson Mountains, Emilystad, GA 68365', 4000000, 3),
('warehouse@app.com', 'admin', N'David', N'Goodwin', N'Nam', '02/22/1967', '0316485984', N'58346 Avila Gateway, Robinton, MH 67430', 5000000, 4),
('parttime@app.com', 'admin', N'Yvonne', N'Williams', N'Nữ', '03/08/1963', '0646887137', N'7874 Glover Road, South Melissa, KY 14361', 4000000, 5),
('mjones@example.org', 'admin', N'Jose', N'Diaz', N'Nam', '04/24/1991', '0989068809', N'47462 King Mount, Mikeburgh, NE 22424', 5000000, 5),
('sophiapetersen@example.org', 'admin', N'Michael', N'Dawson', N'Nữ', '11/07/1997', '0459884779', N'17790 Reed Manor, Williamstad, ND 01268', 4000000, 3),
('kristin65@example.com', 'admin', N'Jessica', N'Blake', N'Nam', '05/23/2000', '0208611201', N'907 Melissa Freeway Suite 390, East Ashley, SC 61344', 4000000, 3),
('sarajohnson@example.com', 'admin', N'David', N'Hampton', N'Nam', '04/06/1982', '0019515287', N'22151 Amanda Ridge Apt. 049, Lake Shannonchester, FM 41928', 5000000, 2),
('hessbrian@example.org', 'admin', N'Jonathon', N'Torres', N'Nam', '02/10/1976', '0807294055', N'PSC 8160, Box 9218, APO AP 86444', 5000000, 5),
('nwilliamson@example.com', 'admin', N'Lindsey', N'Kennedy', N'Nam', '04/13/1981', '0388591624', N'1063 Daugherty Station, West Markbury, AR 57106', 4000000, 2),
('robert52@example.net', 'admin', N'Michael', N'Hammond', N'Nam', '05/12/1978', '0898561404', N'34292 Torres Viaduct Suite 721, Port Jose, KS 18447', 5000000, 2),
('benjaminwright@example.org', 'admin', N'Jerry', N'Wallace', N'Nam', '04/05/1993', '0823739666', N'8894 Misty Locks Suite 744, Williamsonstad, TX 52401', 5000000, 2),
('figueroamartha@example.net', 'admin', N'Joshua', N'Stewart', N'Nữ', '01/03/1979', '0671823272', N'477 Emily Rest, Lake Juliestad, NE 66050', 4000000, 1),
('laurie16@example.net', 'admin', N'Michael', N'Maldonado', N'Nam', '12/03/1977', '0128328436', N'960 Greene Route Suite 428, Emilyshire, GA 55331', 5000000, 1),
('nguyensusan@example.org', 'admin', N'Patricia', N'Jones', N'Nam', '12/02/1974', '0354155850', N'39612 Lee Crossroad Suite 840, Port Amanda, VT 17851', 5000000, 2),
('arthurshields@example.net', 'admin', N'William', N'Downs', N'Nam', '07/13/1981', '0497582380', N'0465 Melissa Pass Suite 474, Donaldchester, RI 59037', 4000000, 2),
('gregory34@example.com', 'admin', N'James', N'Clark', N'Nam', '05/24/1981', '0070517455', N'8359 Vazquez Plains, South Hannahtown, ID 81289', 5000000, 3),
('millschristine@example.org', 'admin', N'Christina', N'Bruce', N'Nam', '12/19/1996', '0992512831', N'421 Hall Stravenue Suite 465, Lake Caitlinfurt, MO 72300', 5000000, 1),
('stephencain@example.com', 'admin', N'Renee', N'Watson', N'Nữ', '02/05/1995', '0564971548', N'8047 Thomas Dam, Sweeneyhaven, MN 02589', 5000000, 3),
('jessica07@example.net', 'admin', N'Darius', N'Reynolds', N'Nữ', '10/23/1997', '0926585940', N'4334 Price Extension, Charlesfort, MD 75696', 5000000, 1)

-----------------------------------------------
---------------------------------Tao showroom
exec create_showroom 1
go
exec create_showroom 2
go
exec create_showroom 3
go
exec create_showroom 4
go
exec create_showroom 5
go
exec create_showroom 6
go
exec create_showroom 7
go

-------------------------------Tao ma giam gia
INSERT INTO [dbo].[PROMOTION]
           ([CODE]
           ,[DISCOUNT]
           ,[STATUS]
           ,[NOTE])
     VALUES
           ('GG20'
           ,20
           ,'Đang hoạt động'
           ,N'Giảm giá 20%')
GO
INSERT INTO [dbo].[PROMOTION]
           ([CODE]
           ,[DISCOUNT]
           ,[STATUS]
           ,[NOTE])
     VALUES
           ('GG10'
           ,10
           ,'Đang hoạt động'
           ,N'Giảm giá 10%')
GO
INSERT INTO [dbo].[PROMOTION]
           ([CODE]
           ,[DISCOUNT]
           ,[STATUS]
           ,[NOTE])
     VALUES
           ('GG15'
           ,15
           ,'Đang hoạt động'
           ,N'Giảm giá 15%')
GO

-----------------------------------------MOVIE
INSERT INTO MOVIE (TITLE, GENRE, DURATION, RATING, STORY, POSTER, OPENING_DAY, CLOSING_DAY)  VALUES('Role.', 'Drama', 5, 7.8, 'Huge teacher war join. Agree between company year. Line whole then apply must would.', 'p1.jpg', '07/26/2022', '04/13/2023'),
('Pretty me letter.', 'Action', 5, 4.4, 'Daughter institution growth home finally try nor. Clearly court system create need party agent.', 'p10.jpg', '01/29/2023', '01/27/2024'),
('Ask south.', 'Romance', 5, 3.0, 'I natural lot recognize daughter huge. Black make baby age later debate blue as.', 'p2.jpg', '02/08/2023', '08/23/2023'),
('Lose analysis him.', 'Horror', 7, 4.9, 'Across concern from dog stand offer especially. Surface activity trial really. Cold interest tax bit.', 'p4.jpg', '09/29/2022', '11/04/2022'),
('Draw board laugh.', 'Romance', 5, 8.6, 'Realize store sport bill society. Most discover base whole heart trip society. Appear blue him. When mother safe quite.', 'p2.jpg', '01/20/2023', '05/21/2023'),
('Cultural window law.', 'Thriller', 4, 2.9, 'Public free hair her front. Such yard establish growth attorney. Somebody thus mouth effect something girl.', 'p7.jpg', '09/07/2022', '12/18/2022'),
('Artist break.', 'Thriller', 10, 6.9, 'Last thought continue soldier push radio. Ok coach carry over message lawyer.', 'p6.jpg', '07/30/2022', '07/08/2023'),
('Contain herself economic.', 'Comedy', 5, 3.0, 'Create business idea raise focus boy social per. Little away these some how.', 'p6.jpg', '04/12/2023', '11/30/2023'),
('Artist hit majority.', 'Horror', 4, 0.7, 'Resource born possible card floor buy whom. Organization choose lose candidate stop contain.', 'p6.jpg', '08/05/2022', '07/07/2023'),
('Art follow media.', 'Comedy', 7, 0.1, 'Believe standard bed much never try small. On soon time public task audience. Pull most significant house right through. Social mission miss game hour.', 'p4.jpg', '04/24/2023', '12/10/2023'),
('True capital.', 'Drama', 7, 9.0, 'Set work friend debate wide eat. Who scene military sound major.', 'p7.jpg', '05/13/2023', '03/08/2024'),
('Plan study.', 'Romance', 8, 7.9, 'Friend real born book. Whom throughout north loss store car painting. End wall ground difficult think paper top. Attention type article him sure.', 'p3.jpg', '11/30/2022', '02/12/2023'),
('Fast seven.', 'Comedy', 20, 6.5, 'Manager anything talk name. Matter key brother member assume or do purpose.', 'p5.jpg', '09/03/2022', '03/11/2023'),
('Oil.', 'Romance', 20, 1.9, 'Region other boy activity capital prevent such. Sing should suddenly point. Meet general pick meeting.', 'p9.jpg', '12/21/2022', '11/19/2023'),
('Leave.', 'Drama', 20, 6.0, 'Usually southern fish specific cost month. Well couple brother whatever look fund show. Growth so lot nor bit perform above.', 'p9.jpg', '11/28/2022', '10/11/2023'),
('Fight focus couple.', 'Horror', 25, 9.0, 'Him factor light piece lead better.', 'p6.jpg', '08/31/2022', '10/08/2022'),
('Writer fish recognize something.', 'Romance', 25, 8.4, 'Dog talk the wish. Improve focus range expect money sister concern.', 'p5.jpg', '05/06/2023', '11/03/2023'),
('Politics parent long.', 'Romance', 27, 0.9, 'Interest win will cold process. Effort word year sit. Water company worry but.', 'p4.jpg', '05/28/2022', '05/17/2023'),
('Success dog.', 'Romance', 23, 2.4, 'Music they public various author they heart. Goal factor over every.', 'p3.jpg', '03/07/2023', '12/20/2023'),
('Media hour mean off.', 'Drama', 25, 0.6, 'Focus send most car thank national happen. Until door claim another. Open main catch treatment.', 'p7.jpg', '02/11/2023', '11/19/2023'),
('Job approach take.', 'Action', 24, 5.3, 'Yourself apply low describe. Street mention service budget operation computer. Hour environmental evidence could baby hotel.', 'p2.jpg', '05/30/2022', '08/02/2022'),
('Game success.', 'Romance', 25, 5.2, 'Treat name however smile rule. Responsibility some remain north off lawyer.', 'p7.jpg', '07/10/2022', '12/12/2022'),
('Nation activity.', 'Action', 40, 8.0, 'Firm detail show point like. Turn much peace candidate election western. Form well every.', 'p2.jpg', '05/06/2023', '11/28/2023'),
('Admit response risk.', 'Thriller', 20, 9.3, 'Site PM score citizen. Unit something president certainly artist.', 'p10.jpg', '09/18/2022', '02/07/2023'),
('Authority no.', 'Thriller', 30, 3.3, 'Travel building character south. It find again this store radio get. Only wonder present language.', 'p1.jpg', '04/13/2023', '10/19/2023'),
('Spring well site.', 'Romance', 30, 6.9, 'Time defense out majority good somebody history fight. Board difference trial once. Range decide sing keep.', 'p1.jpg', '11/20/2022', '07/31/2023'),
('Senior one poor.', 'Horror', 30, 4.0, 'Enjoy painting attorney against face member write.', 'p7.jpg', '06/23/2022', '09/22/2022'),
('Any current attention.', 'Comedy', 30, 6.7, 'Provide see do film subject. Hair century pretty star appear finish process.', 'p5.jpg', '04/26/2023', '06/20/2023'),
('Third many.', 'Horror', 30, 1.0, 'Moment apply enter management attention. After but development enough everyone image same goal. Age data us hand radio anything game.', 'p5.jpg', '03/17/2023', '01/24/2024'),
('Different technology organization.', 'Thriller', 30, 8.6, 'Once company interest professional Mrs church. Spend sense describe.', 'p4.jpg', '03/31/2023', '07/08/2023'),
('Attorney trouble full.', 'Romance', 30, 8.0, 'Area admit speech laugh. Go above face animal article third live.', 'p5.jpg', '02/17/2023', '12/28/2023'),
('Certainly her scene.', 'Romance', 30, 2.9, 'Today hard security. Probably day outside. Image some personal charge specific although clear.', 'p4.jpg', '12/21/2022', '10/15/2023'),
('Old share not way.', 'Horror', 20, 6.9, 'Shake site television. Process never increase.', 'p2.jpg', '10/19/2022', '04/09/2023'),
('Civil son human.', 'Romance', 30, 3.0, 'Home full forget oil. True whether building item raise church reality.', 'p1.jpg', '11/12/2022', '02/02/2023'),
('Explain which order.', 'Horror', 25, 7.3, 'Clearly them about market. Leave relationship yeah method according production. How face spend.', 'p7.jpg', '06/18/2022', '12/01/2022'),
('She board.', 'Horror', 60, 4.1, 'Enough why home which. Break still nature commercial.', 'p10.jpg', '02/02/2023', '09/10/2023'),
('Reflect everything.', 'Action', 34, 1.9, 'Newspaper animal land red summer specific image. Economic season majority treatment responsibility pressure.', 'p5.jpg', '03/16/2023', '11/09/2023'),
('Set.', 'Thriller', 40, 8.0, 'Several under third share. Item start chair particular he.', 'p4.jpg', '09/05/2022', '12/30/2022'),
('It.', 'Romance', 60, 0.7, 'Safe themselves shoulder likely guess most appear management. Somebody note capital within.', 'p8.jpg', '01/10/2023', '09/24/2023'),
('Especially kitchen.', 'Horror', 60, 4.3, 'Significant face ready bank tell yeah. Treat evening reality trouble hold. Forget certainly still right husband newspaper.', 'p10.jpg', '05/17/2022', '02/05/2023'),
('Behavior cultural my class.', 'Thriller', 86, 2.9, 'Approach although alone wait around within left. Civil law animal.', 'p7.jpg', '06/16/2022', '05/05/2023'),
('Onto voice nature.', 'Comedy', 50, 6.1, 'Letter relationship house film one day. Learn campaign ok establish.', 'p1.jpg', '01/06/2023', '07/17/2023'),
('None sure.', 'Horror', 20, 0.7, 'Teach business decision. Training beat sea little only. Industry cause foreign choice officer traditional. Somebody attention might.', 'p1.jpg', '10/20/2022', '05/14/2023'),
('Cause bag morning.', 'Comedy', 40, 0.5, 'Parent figure every while trouble recent travel. Arm interest enough. Mother increase thank leg life make along.', 'p7.jpg', '03/12/2023', '05/26/2023'),
('Hour discover even.', 'Drama', 40, 8.9, 'Hundred red computer nothing. Second increase bring receive put return technology.', 'p6.jpg', '08/23/2022', '11/21/2022'),
('Teacher three.', 'Horror', 40, 8.3, 'Open little recently town. Challenge director happen experience ok usually mind.', 'p4.jpg', '01/28/2023', '04/27/2023'),
('Fact statement without.', 'Comedy', 40, 9.8, 'Yet dog success. Truth kind ago evidence treatment but couple accept.', 'p7.jpg', '08/10/2022', '05/18/2023'),
('Turn least.', 'Romance', 40, 2.9, 'Hot various upon human once. Project test want respond risk.', 'p2.jpg', '04/10/2023', '07/23/2023'),
('End science.', 'Drama', 67, 0.9, 'Someone others message city already might air act. Congress thus address.', 'p6.jpg', '04/02/2023', '10/27/2023'),
('Allow.', 'Romance', 40, 5.0, 'Culture clearly realize trial. Window forget though score. Treat morning value opportunity however.', 'p9.jpg', '03/27/2023', '11/06/2023')
go
-------------------------------------------------------------------------------------------
EXEC create_schedule 1, 14, '2023-04-08 17:05:06', 88000 
go
EXEC create_schedule 4, 8, '2023-03-26 08:45:15', 90000 
go
EXEC create_schedule 7, 49, '2023-04-21 08:34:38', 78000 
go
EXEC create_schedule 1, 22, '2023-03-22 02:51:18', 76000 
go
EXEC create_schedule 3, 1, '2023-04-21 07:12:12', 55000 
go
EXEC create_schedule 1, 27, '2023-05-06 18:09:56', 55000 
go
EXEC create_schedule 1, 8, '2023-04-17 03:02:22', 55000 
go
EXEC create_schedule 2, 11, '2023-03-31 22:48:48', 82000 
go
EXEC create_schedule 6, 29, '2023-05-23 21:30:43', 54000 
go
EXEC create_schedule 2, 21, '2023-04-10 17:31:57', 97000 
go
EXEC create_schedule 1, 41, '2023-04-17 22:39:00', 66000 
go
EXEC create_schedule 3, 9, '2023-04-24 19:25:14', 83000 
go
EXEC create_schedule 5, 13, '2023-05-17 09:44:52', 67000 
go
EXEC create_schedule 7, 36, '2023-03-21 15:49:40', 82000 
go
EXEC create_schedule 3, 8, '2023-06-13 20:38:33', 95000 
go
EXEC create_schedule 2, 46, '2023-03-17 00:31:21', 83000 
go
EXEC create_schedule 4, 26, '2023-05-05 01:59:28', 63000 
go
EXEC create_schedule 7, 15, '2023-03-25 02:39:03', 48000 
go
EXEC create_schedule 6, 41, '2023-04-06 10:23:08', 49000 
go
EXEC create_schedule 1, 45, '2023-04-15 16:45:59', 47000 
go
EXEC create_schedule 4, 31, '2023-05-19 04:36:46', 70000 
go
EXEC create_schedule 5, 2, '2023-04-22 18:32:15', 73000 
go
EXEC create_schedule 7, 18, '2023-04-18 22:08:55', 88000 
go
EXEC create_schedule 7, 48, '2023-04-20 19:23:45', 45000 
go
EXEC create_schedule 6, 8, '2023-03-23 18:55:55', 66000 
go
EXEC create_schedule 2, 1, '2023-03-21 18:18:26', 98000 
go
EXEC create_schedule 7, 31, '2023-04-15 05:44:02', 73000 
go
EXEC create_schedule 7, 24, '2023-06-12 13:56:51', 94000 
go
EXEC create_schedule 3, 32, '2023-05-22 12:25:02', 58000 
go
EXEC create_schedule 3, 34, '2023-06-11 23:25:58', 66000 
go
EXEC create_schedule 3, 46, '2023-05-07 12:14:50', 81000 
go
EXEC create_schedule 4, 13, '2023-04-20 21:10:15', 95000 
go
EXEC create_schedule 5, 35, '2023-04-03 01:08:15', 67000 
go
EXEC create_schedule 1, 47, '2023-06-01 02:29:28', 97000 
go
EXEC create_schedule 3, 17, '2023-03-31 10:10:23', 60000 
go
EXEC create_schedule 3, 12, '2023-04-21 08:08:15', 60000 
go
EXEC create_schedule 7, 14, '2023-06-04 13:57:30', 80000 
go
EXEC create_schedule 7, 29, '2023-06-15 20:21:44', 49000 
go
EXEC create_schedule 7, 27, '2023-04-17 19:23:28', 48000 
go
EXEC create_schedule 7, 23, '2023-04-27 07:26:56', 60000 
go
EXEC create_schedule 6, 38, '2023-05-20 17:45:44', 67000 
go
EXEC create_schedule 4, 21, '2023-05-12 06:59:29', 96000 
go
EXEC create_schedule 1, 38, '2023-05-24 20:33:57', 71000 
go
EXEC create_schedule 3, 9, '2023-04-18 11:48:24', 92000 
go
EXEC create_schedule 6, 49, '2023-04-15 11:20:12', 61000 
go
EXEC create_schedule 3, 41, '2023-04-22 18:31:58', 62000 
go
EXEC create_schedule 5, 22, '2023-05-17 23:44:15', 92000 
go
EXEC create_schedule 6, 8, '2023-05-07 19:40:40', 45000 
go
EXEC create_schedule 5, 38, '2023-05-01 17:29:20', 94000 
go
EXEC create_schedule 6, 38, '2023-03-23 00:21:43', 63000 
go
---------------------------------------------------------------------
INSERT INTO BOOKING (STAFF_ID, CREATED_AT, FOODPRICE, TICKETPRICE) VALUES( 2, '2023-03-25 16:47:41',  0, 0),
( 15, '2023-03-23 07:09:41',  0, 0),
( 8, '2023-04-05 22:57:59',  0, 0),
( 2, '2023-03-28 11:41:06',  0, 0),
( 19, '2023-03-30 01:55:04',  0, 0),
( 1, '2023-03-22 00:41:20',  0, 0),
( 2, '2023-03-23 13:26:06',  0, 0),
( 17, '2023-04-07 08:24:35',  0, 0),
( 13, '2023-03-17 20:18:07',  0, 0),
( 19, '2023-03-17 15:21:54',  0, 0),
( 6, '2023-04-05 08:22:54',  0, 0),
( 19, '2023-03-29 00:58:59',  0, 0),
( 10, '2023-03-26 05:37:29',  0, 0),
( 16, '2023-03-30 02:43:40',  0, 0),
( 18, '2023-03-31 05:37:19',  0, 0),
( 12, '2023-03-27 03:31:55',  0, 0),
( 20, '2023-03-28 15:44:19',  0, 0),
( 3, '2023-04-03 10:23:20',  0, 0),
( 18, '2023-03-28 02:01:20',  0, 0),
( 10, '2023-03-17 09:02:27',  0, 0),
( 2, '2023-03-23 07:43:36',  0, 0),
( 18, '2023-03-23 14:50:20',  0, 0),
( 5, '2023-03-20 06:06:42',  0, 0),
( 8, '2023-03-24 20:32:05',  0, 0),
( 16, '2023-03-20 00:31:30',  0, 0),
( 4, '2023-03-22 02:08:04',  0, 0),
( 7, '2023-03-22 15:44:04',  0, 0),
( 19, '2023-03-23 08:06:27',  0, 0),
( 20, '2023-03-21 07:36:00',  0, 0),
( 13, '2023-03-19 00:11:36',  0, 0),
( 6, '2023-03-25 13:55:17',  0, 0),
( 4, '2023-03-24 16:16:31',  0, 0),
( 15, '2023-03-23 20:45:16',  0, 0),
( 17, '2023-03-18 03:11:01',  0, 0),
( 12, '2023-03-19 15:51:35',  0, 0),
( 11, '2023-03-24 15:38:34',  0, 0),
( 12, '2023-03-23 06:09:34',  0, 0),
( 7, '2023-03-18 06:34:55',  0, 0),
( 11, '2023-03-23 10:54:26',  0, 0),
( 17, '2023-03-24 00:57:21',  0, 0),
( 13, '2023-04-20 18:12:53',  0, 0),
( 12, '2023-03-27 18:29:46',  0, 0),
( 12, '2023-04-16 03:18:13',  0, 0),
( 8, '2023-04-03 00:08:30',  0, 0),
( 15, '2023-04-14 11:43:43',  0, 0),
( 6, '2023-04-01 12:11:35',  0, 0),
( 14, '2023-04-03 13:06:51',  0, 0),
( 10, '2023-03-23 17:44:55',  0, 0),
( 14, '2023-03-19 05:17:32',  0, 0),
( 1, '2023-04-14 02:56:46',  0, 0),
( 6, '2023-03-17 06:40:04',  0, 0),
( 17, '2023-03-30 23:27:03',  0, 0),
( 18, '2023-04-17 03:43:22',  0, 0),
( 18, '2023-04-20 19:08:07',  0, 0),
( 17, '2023-03-18 16:17:18',  0, 0),
( 11, '2023-03-22 20:01:54',  0, 0),
( 1, '2023-04-19 04:41:03',  0, 0),
( 15, '2023-03-23 15:09:31',  0, 0),
( 12, '2023-03-24 16:36:56',  0, 0),
( 3, '2023-04-04 18:32:04',  0, 0),
( 8, '2023-03-18 22:22:14',  0, 0),
( 16, '2023-03-20 22:28:20',  0, 0),
( 12, '2023-03-21 06:56:27',  0, 0),
( 7, '2023-03-17 06:21:09',  0, 0),
( 10, '2023-03-17 20:22:16',  0, 0),
( 3, '2023-03-19 08:20:08',  0, 0),
( 5, '2023-03-20 04:30:19',  0, 0),
( 11, '2023-03-18 19:09:57',  0, 0),
( 14, '2023-03-21 12:19:44',  0, 0),
( 10, '2023-03-19 06:29:14',  0, 0),
( 16, '2023-03-18 20:48:54',  0, 0),
( 17, '2023-03-20 18:45:18',  0, 0),
( 7, '2023-03-21 19:31:15',  0, 0),
( 11, '2023-03-21 00:20:05',  0, 0),
( 4, '2023-03-18 00:08:56',  0, 0),
( 4, '2023-03-19 00:33:28',  0, 0),
( 3, '2023-03-16 21:43:38',  0, 0),
( 14, '2023-03-17 08:39:57',  0, 0),
( 10, '2023-03-19 20:37:08',  0, 0),
( 14, '2023-03-21 08:36:56',  0, 0),
( 13, '2023-04-21 02:35:29',  0, 0),
( 11, '2023-04-10 23:56:59',  0, 0),
( 8, '2023-03-28 09:44:36',  0, 0),
( 13, '2023-04-13 14:57:51',  0, 0),
( 9, '2023-03-29 19:30:01',  0, 0),
( 19, '2023-04-14 06:40:34',  0, 0),
( 6, '2023-04-06 23:05:10',  0, 0),
( 9, '2023-04-08 19:39:42',  0, 0),
( 2, '2023-04-07 11:55:54',  0, 0),
( 14, '2023-04-05 09:24:54',  0, 0),
( 12, '2023-03-27 17:53:38',  0, 0),
( 20, '2023-04-02 15:44:46',  0, 0),
( 20, '2023-04-04 06:03:02',  0, 0),
( 5, '2023-04-18 10:18:18',  0, 0),
( 18, '2023-04-02 01:38:31',  0, 0),
( 11, '2023-03-19 00:32:23',  0, 0),
( 10, '2023-03-20 23:10:57',  0, 0),
( 8, '2023-04-09 13:56:54',  0, 0),
( 13, '2023-03-29 09:19:51',  0, 0),
( 15, '2023-04-03 21:23:15',  0, 0),
( 6, '2023-04-26 19:08:12',  0, 0),
( 7, '2023-03-17 22:29:43',  0, 0),
( 12, '2023-04-28 00:43:22',  0, 0),
( 10, '2023-04-30 04:11:09',  0, 0),
( 8, '2023-03-29 16:20:35',  0, 0),
( 7, '2023-04-25 03:43:19',  0, 0),
( 19, '2023-03-22 23:23:18',  0, 0),
( 9, '2023-04-06 20:37:57',  0, 0),
( 11, '2023-04-12 09:43:35',  0, 0),
( 2, '2023-04-30 09:15:21',  0, 0),
( 18, '2023-03-28 14:49:05',  0, 0),
( 19, '2023-04-27 08:57:54',  0, 0),
( 10, '2023-04-25 09:47:44',  0, 0),
( 12, '2023-04-29 10:47:53',  0, 0),
( 5, '2023-04-16 15:06:08',  0, 0),
( 7, '2023-03-27 17:25:05',  0, 0),
( 13, '2023-04-20 11:19:10',  0, 0),
( 11, '2023-04-01 13:22:55',  0, 0),
( 4, '2023-03-19 07:34:11',  0, 0),
( 3, '2023-04-27 10:50:30',  0, 0),
( 4, '2023-04-07 01:30:39',  0, 0),
( 10, '2023-04-07 14:10:59',  0, 0),
( 17, '2023-04-06 04:16:34',  0, 0),
( 3, '2023-04-04 06:02:49',  0, 0),
( 19, '2023-04-10 00:47:44',  0, 0),
( 19, '2023-04-16 17:22:42',  0, 0),
( 12, '2023-03-31 20:15:26',  0, 0),
( 10, '2023-04-10 08:14:05',  0, 0),
( 7, '2023-04-11 23:05:14',  0, 0),
( 17, '2023-03-23 14:46:49',  0, 0),
( 7, '2023-03-18 03:43:23',  0, 0),
( 3, '2023-03-21 14:58:37',  0, 0),
( 6, '2023-03-28 06:24:32',  0, 0),
( 15, '2023-04-06 04:50:34',  0, 0),
( 13, '2023-03-17 17:41:03',  0, 0),
( 15, '2023-03-31 17:33:48',  0, 0),
( 17, '2023-03-25 06:20:32',  0, 0),
( 18, '2023-04-12 17:27:25',  0, 0),
( 4, '2023-04-01 18:21:32',  0, 0),
( 1, '2023-04-11 13:01:33',  0, 0),
( 20, '2023-03-29 02:47:17',  0, 0),
( 19, '2023-03-25 03:48:26',  0, 0),
( 8, '2023-03-20 19:04:42',  0, 0),
( 12, '2023-03-23 18:35:34',  0, 0),
( 12, '2023-03-22 00:10:06',  0, 0),
( 1, '2023-03-31 18:21:48',  0, 0),
( 5, '2023-03-19 01:11:17',  0, 0),
( 17, '2023-03-19 19:00:12',  0, 0),
( 7, '2023-03-28 18:44:47',  0, 0),
( 1, '2023-03-24 03:02:58',  0, 0),
( 15, '2023-03-31 22:27:16',  0, 0),
( 6, '2023-03-31 18:08:59',  0, 0),
( 11, '2023-03-20 08:51:30',  0, 0),
( 3, '2023-03-28 20:11:29',  0, 0),
( 10, '2023-03-28 18:02:27',  0, 0),
( 15, '2023-03-18 16:13:56',  0, 0),
( 2, '2023-03-16 22:15:04',  0, 0),
( 11, '2023-03-17 01:26:43',  0, 0),
( 1, '2023-03-20 07:10:31',  0, 0),
( 4, '2023-03-21 05:22:43',  0, 0),
( 17, '2023-05-07 06:46:56',  0, 0),
( 13, '2023-04-10 21:21:27',  0, 0),
( 1, '2023-04-09 22:14:03',  0, 0),
( 12, '2023-05-13 06:51:39',  0, 0),
( 4, '2023-03-21 08:06:36',  0, 0),
( 11, '2023-05-11 15:43:58',  0, 0),
( 19, '2023-04-06 04:18:45',  0, 0),
( 9, '2023-04-16 02:19:26',  0, 0),
( 10, '2023-04-20 02:59:21',  0, 0),
( 6, '2023-05-12 18:58:54',  0, 0),
( 9, '2023-04-14 09:37:08',  0, 0),
( 8, '2023-04-14 11:47:41',  0, 0),
( 9, '2023-03-25 03:23:53',  0, 0),
( 16, '2023-03-21 06:12:10',  0, 0),
( 12, '2023-05-19 12:28:58',  0, 0),
( 17, '2023-04-20 11:32:15',  0, 0),
( 12, '2023-03-26 10:41:25',  0, 0),
( 3, '2023-03-25 16:13:39',  0, 0),
( 6, '2023-03-18 04:23:10',  0, 0),
( 11, '2023-04-19 06:51:59',  0, 0),
( 17, '2023-04-03 10:48:04',  0, 0),
( 17, '2023-03-25 10:55:08',  0, 0),
( 14, '2023-04-06 00:17:05',  0, 0),
( 1, '2023-04-04 19:12:49',  0, 0),
( 12, '2023-04-08 21:15:55',  0, 0),
( 1, '2023-04-09 12:37:10',  0, 0),
( 18, '2023-03-29 09:56:54',  0, 0),
( 5, '2023-04-02 02:53:56',  0, 0),
( 3, '2023-03-18 19:34:28',  0, 0),
( 5, '2023-03-27 11:03:26',  0, 0),
( 15, '2023-03-29 11:42:51',  0, 0),
( 19, '2023-03-17 19:44:38',  0, 0),
( 16, '2023-03-30 12:58:54',  0, 0),
( 1, '2023-03-18 10:29:51',  0, 0),
( 6, '2023-03-19 19:04:50',  0, 0),
( 5, '2023-04-01 07:11:24',  0, 0),
( 19, '2023-03-25 09:56:23',  0, 0),
( 18, '2023-03-22 07:12:46',  0, 0),
( 11, '2023-03-26 04:59:06',  0, 0),
( 9, '2023-03-18 21:34:17',  0, 0),
( 12, '2023-03-20 04:34:55',  0, 0),
( 18, '2023-04-13 21:12:09',  0, 0),
( 7, '2023-03-24 07:51:55',  0, 0),
( 11, '2023-04-06 14:14:41',  0, 0),
( 13, '2023-03-26 05:45:32',  0, 0),
( 15, '2023-04-17 12:51:00',  0, 0),
( 8, '2023-03-17 10:40:16',  0, 0),
( 15, '2023-03-23 23:11:43',  0, 0),
( 10, '2023-04-01 17:46:00',  0, 0),
( 1, '2023-04-04 19:39:49',  0, 0),
( 8, '2023-03-25 20:49:03',  0, 0),
( 5, '2023-04-04 11:13:14',  0, 0),
( 18, '2023-04-02 19:27:27',  0, 0),
( 20, '2023-03-23 23:16:01',  0, 0),
( 10, '2023-03-21 00:03:25',  0, 0),
( 1, '2023-03-28 16:18:04',  0, 0),
( 4, '2023-03-31 09:38:57',  0, 0),
( 19, '2023-03-27 12:43:41',  0, 0),
( 20, '2023-03-25 15:17:36',  0, 0),
( 7, '2023-03-22 00:47:56',  0, 0),
( 4, '2023-04-15 11:01:43',  0, 0),
( 13, '2023-03-22 04:38:14',  0, 0),
( 19, '2023-03-28 11:11:28',  0, 0),
( 13, '2023-03-17 17:59:40',  0, 0),
( 6, '2023-03-31 07:09:09',  0, 0),
( 18, '2023-03-22 00:27:56',  0, 0),
( 15, '2023-03-16 23:51:07',  0, 0),
( 20, '2023-04-21 08:08:17',  0, 0),
( 5, '2023-03-27 20:01:14',  0, 0),
( 12, '2023-03-27 12:17:26',  0, 0),
( 7, '2023-03-21 19:09:59',  0, 0),
( 19, '2023-03-20 13:15:31',  0, 0),
( 7, '2023-03-29 08:53:47',  0, 0),
( 12, '2023-04-18 13:39:06',  0, 0),
( 15, '2023-04-20 10:53:38',  0, 0),
( 17, '2023-04-19 08:55:03',  0, 0),
( 19, '2023-03-18 09:57:03',  0, 0),
( 3, '2023-04-05 10:21:39',  0, 0),
( 5, '2023-03-21 03:09:03',  0, 0),
( 11, '2023-03-25 06:34:12',  0, 0),
( 11, '2023-05-13 08:30:22',  0, 0),
( 19, '2023-04-23 22:45:39',  0, 0),
( 1, '2023-04-28 12:08:16',  0, 0),
( 15, '2023-04-15 03:28:33',  0, 0),
( 16, '2023-05-17 06:46:34',  0, 0),
( 19, '2023-04-25 14:18:29',  0, 0),
( 8, '2023-05-13 19:58:10',  0, 0),
( 10, '2023-03-23 05:50:09',  0, 0),
( 1, '2023-04-05 10:29:32',  0, 0),
( 15, '2023-03-21 22:22:05',  0, 0),
( 8, '2023-05-14 04:57:09',  0, 0),
( 8, '2023-03-24 22:43:31',  0, 0),
( 6, '2023-04-24 12:36:24',  0, 0),
( 14, '2023-04-15 18:59:11',  0, 0),
( 18, '2023-05-03 03:58:37',  0, 0),
( 10, '2023-05-07 06:51:00',  0, 0),
( 19, '2023-03-19 07:33:27',  0, 0),
( 3, '2023-04-21 11:44:54',  0, 0),
( 14, '2023-04-27 12:23:52',  0, 0),
( 12, '2023-04-16 16:07:40',  0, 0),
( 11, '2023-03-20 10:01:51',  0, 0),
( 20, '2023-03-19 23:07:32',  0, 0),
( 10, '2023-03-21 12:44:13',  0, 0),
( 14, '2023-03-20 02:36:24',  0, 0),
( 1, '2023-03-21 01:06:33',  0, 0),
( 20, '2023-03-17 18:00:58',  0, 0),
( 11, '2023-03-18 03:04:28',  0, 0),
( 3, '2023-03-19 04:02:30',  0, 0),
( 5, '2023-03-20 21:07:36',  0, 0),
( 1, '2023-03-18 08:06:01',  0, 0),
( 18, '2023-03-18 17:09:19',  0, 0),
( 13, '2023-03-19 17:09:54',  0, 0),
( 17, '2023-03-17 10:09:36',  0, 0),
( 5, '2023-03-19 10:35:53',  0, 0),
( 9, '2023-03-17 00:36:01',  0, 0),
( 16, '2023-03-18 01:37:07',  0, 0),
( 2, '2023-03-18 17:21:03',  0, 0),
( 9, '2023-03-17 22:56:31',  0, 0),
( 11, '2023-03-17 08:33:32',  0, 0),
( 18, '2023-03-20 11:59:31',  0, 0),
( 17, '2023-03-28 23:21:09',  0, 0),
( 10, '2023-04-15 08:58:16',  0, 0),
( 1, '2023-04-15 12:44:56',  0, 0),
( 17, '2023-04-27 09:32:42',  0, 0),
( 2, '2023-06-02 00:40:55',  0, 0),
( 12, '2023-04-09 09:36:12',  0, 0),
( 15, '2023-03-20 11:51:37',  0, 0),
( 11, '2023-04-23 22:35:48',  0, 0),
( 5, '2023-04-06 10:28:42',  0, 0),
( 14, '2023-03-19 16:09:27',  0, 0),
( 15, '2023-04-11 17:02:06',  0, 0),
( 15, '2023-04-26 09:07:09',  0, 0),
( 5, '2023-03-18 05:26:18',  0, 0),
( 14, '2023-04-20 22:57:51',  0, 0),
( 14, '2023-04-03 12:37:07',  0, 0),
( 11, '2023-04-23 04:33:17',  0, 0),
( 4, '2023-05-12 07:15:43',  0, 0),
( 14, '2023-04-26 18:43:55',  0, 0),
( 17, '2023-03-27 19:59:13',  0, 0),
( 9, '2023-06-09 02:56:59',  0, 0),
( 13, '2023-03-16 22:04:35',  0, 0),
( 18, '2023-03-16 23:56:03',  0, 0),
( 15, '2023-03-16 21:36:07',  0, 0),
( 5, '2023-03-16 21:32:24',  0, 0),
( 11, '2023-03-16 23:33:38',  0, 0),
( 17, '2023-03-17 00:28:06',  0, 0),
( 18, '2023-03-16 23:32:10',  0, 0),
( 4, '2023-03-16 22:28:40',  0, 0),
( 15, '2023-03-16 22:35:27',  0, 0),
( 3, '2023-03-16 23:37:39',  0, 0),
( 6, '2023-03-16 22:44:57',  0, 0),
( 3, '2023-03-16 21:20:34',  0, 0),
( 12, '2023-03-16 22:02:13',  0, 0),
( 19, '2023-03-17 00:17:58',  0, 0),
( 1, '2023-03-16 22:06:33',  0, 0),
( 10, '2023-03-16 23:17:28',  0, 0),
( 6, '2023-03-17 00:13:51',  0, 0),
( 12, '2023-03-17 00:15:53',  0, 0),
( 20, '2023-03-16 23:52:32',  0, 0),
( 3, '2023-03-16 22:11:27',  0, 0),
( 7, '2023-04-09 00:51:20',  0, 0),
( 8, '2023-04-16 21:51:18',  0, 0),
( 2, '2023-04-24 16:29:59',  0, 0),
( 7, '2023-03-19 12:15:04',  0, 0),
( 11, '2023-04-16 11:47:19',  0, 0),
( 15, '2023-03-27 07:54:44',  0, 0),
( 11, '2023-04-21 15:23:43',  0, 0),
( 5, '2023-03-31 00:39:08',  0, 0),
( 14, '2023-03-19 09:08:50',  0, 0),
( 6, '2023-05-02 18:11:34',  0, 0),
( 15, '2023-04-17 17:11:19',  0, 0),
( 15, '2023-05-03 15:48:31',  0, 0),
( 11, '2023-04-23 11:51:02',  0, 0),
( 14, '2023-03-30 13:45:12',  0, 0),
( 3, '2023-03-22 05:20:46',  0, 0),
( 4, '2023-04-18 14:53:50',  0, 0),
( 7, '2023-05-01 13:34:11',  0, 0),
( 2, '2023-04-07 08:50:27',  0, 0),
( 2, '2023-04-11 11:08:02',  0, 0),
( 20, '2023-04-24 16:29:04',  0, 0),
( 17, '2023-03-22 13:46:07',  0, 0),
( 18, '2023-03-23 19:42:00',  0, 0),
( 13, '2023-03-17 07:53:17',  0, 0),
( 11, '2023-03-22 09:13:15',  0, 0),
( 1, '2023-03-18 02:34:38',  0, 0),
( 18, '2023-03-21 19:30:24',  0, 0),
( 19, '2023-03-23 11:24:43',  0, 0),
( 2, '2023-03-24 09:20:53',  0, 0),
( 2, '2023-03-18 11:10:02',  0, 0),
( 10, '2023-03-24 23:56:32',  0, 0),
( 10, '2023-03-19 02:01:14',  0, 0),
( 13, '2023-03-19 16:39:28',  0, 0),
( 7, '2023-03-24 00:18:14',  0, 0),
( 5, '2023-03-24 09:15:05',  0, 0),
( 18, '2023-03-24 18:09:04',  0, 0),
( 7, '2023-03-20 22:14:23',  0, 0),
( 2, '2023-03-19 03:43:18',  0, 0),
( 6, '2023-03-21 19:00:50',  0, 0),
( 4, '2023-03-21 03:17:11',  0, 0),
( 15, '2023-03-17 15:54:52',  0, 0),
( 16, '2023-04-03 16:32:28',  0, 0),
( 11, '2023-04-03 11:02:07',  0, 0),
( 4, '2023-03-17 15:46:44',  0, 0),
( 18, '2023-04-01 23:02:37',  0, 0),
( 10, '2023-03-19 05:08:29',  0, 0),
( 1, '2023-03-29 03:17:13',  0, 0),
( 15, '2023-03-23 21:17:29',  0, 0),
( 1, '2023-03-31 22:17:40',  0, 0),
( 8, '2023-03-29 08:44:18',  0, 0),
( 10, '2023-03-31 00:23:44',  0, 0),
( 11, '2023-03-30 17:39:34',  0, 0),
( 18, '2023-04-01 16:46:38',  0, 0),
( 6, '2023-04-01 19:11:04',  0, 0),
( 7, '2023-03-17 11:43:38',  0, 0),
( 9, '2023-03-24 21:00:07',  0, 0),
( 11, '2023-03-20 02:14:27',  0, 0),
( 12, '2023-04-04 02:03:12',  0, 0),
( 3, '2023-04-04 12:07:00',  0, 0),
( 19, '2023-03-17 03:58:41',  0, 0),
( 1, '2023-04-03 15:09:56',  0, 0),
( 19, '2023-04-06 07:57:00',  0, 0),
( 8, '2023-03-30 03:48:48',  0, 0),
( 9, '2023-03-28 01:02:37',  0, 0),
( 4, '2023-03-31 14:40:56',  0, 0),
( 11, '2023-03-18 11:46:19',  0, 0),
( 2, '2023-03-21 12:26:44',  0, 0),
( 14, '2023-03-25 22:30:58',  0, 0),
( 14, '2023-03-27 21:41:39',  0, 0),
( 3, '2023-03-23 00:15:13',  0, 0),
( 16, '2023-04-05 09:01:29',  0, 0),
( 19, '2023-03-22 17:56:00',  0, 0),
( 8, '2023-04-08 09:39:12',  0, 0),
( 7, '2023-03-31 09:35:37',  0, 0),
( 17, '2023-04-05 01:39:48',  0, 0),
( 5, '2023-03-27 15:19:01',  0, 0),
( 8, '2023-03-22 15:23:56',  0, 0),
( 15, '2023-04-11 12:15:15',  0, 0),
( 7, '2023-04-05 13:17:56',  0, 0),
( 11, '2023-04-02 17:56:41',  0, 0),
( 17, '2023-03-27 11:39:42',  0, 0),
( 15, '2023-04-03 01:41:36',  0, 0),
( 1, '2023-04-19 21:39:58',  0, 0),
( 4, '2023-05-12 00:26:54',  0, 0),
( 9, '2023-05-05 07:25:47',  0, 0),
( 5, '2023-05-12 03:34:28',  0, 0),
( 8, '2023-03-30 12:40:09',  0, 0),
( 12, '2023-04-24 23:42:47',  0, 0),
( 11, '2023-04-10 22:41:17',  0, 0),
( 5, '2023-05-02 23:09:53',  0, 0),
( 7, '2023-04-19 02:21:47',  0, 0),
( 9, '2023-04-28 09:58:39',  0, 0),
( 3, '2023-04-06 08:37:54',  0, 0),
( 2, '2023-04-19 06:25:20',  0, 0),
( 20, '2023-03-17 07:26:11',  0, 0),
( 1, '2023-04-18 16:56:09',  0, 0),
( 2, '2023-05-07 15:27:28',  0, 0),
( 4, '2023-03-27 06:25:54',  0, 0),
( 10, '2023-04-23 02:53:43',  0, 0),
( 16, '2023-05-05 22:31:20',  0, 0),
( 17, '2023-04-22 05:59:49',  0, 0),
( 2, '2023-04-16 00:36:04',  0, 0),
( 17, '2023-04-19 05:31:18',  0, 0),
( 4, '2023-04-14 06:00:01',  0, 0),
( 8, '2023-04-15 15:07:03',  0, 0),
( 6, '2023-03-23 19:44:50',  0, 0),
( 8, '2023-04-16 17:26:10',  0, 0),
( 7, '2023-04-04 13:29:45',  0, 0),
( 4, '2023-04-21 03:03:23',  0, 0),
( 6, '2023-03-25 16:57:34',  0, 0),
( 4, '2023-04-10 06:49:16',  0, 0),
( 7, '2023-03-24 18:22:03',  0, 0),
( 14, '2023-03-17 10:01:19',  0, 0),
( 16, '2023-03-28 03:27:31',  0, 0),
( 4, '2023-03-31 22:10:09',  0, 0),
( 19, '2023-04-17 20:37:11',  0, 0),
( 6, '2023-04-16 18:12:37',  0, 0),
( 10, '2023-03-21 02:54:17',  0, 0),
( 10, '2023-04-14 00:17:34',  0, 0),
( 20, '2023-04-16 09:44:32',  0, 0),
( 2, '2023-04-17 21:24:00',  0, 0),
( 12, '2023-03-25 00:00:39',  0, 0),
( 12, '2023-04-12 07:59:47',  0, 0),
( 12, '2023-04-09 03:36:20',  0, 0),
( 3, '2023-03-24 21:26:07',  0, 0),
( 20, '2023-03-17 02:14:18',  0, 0),
( 18, '2023-03-19 19:07:40',  0, 0),
( 3, '2023-04-05 18:50:01',  0, 0),
( 7, '2023-04-17 02:23:07',  0, 0),
( 7, '2023-04-15 12:41:09',  0, 0),
( 8, '2023-04-03 01:27:46',  0, 0),
( 1, '2023-03-30 14:55:19',  0, 0),
( 12, '2023-03-23 07:10:12',  0, 0),
( 17, '2023-04-09 10:50:26',  0, 0),
( 20, '2023-04-16 20:26:00',  0, 0),
( 11, '2023-03-24 23:02:33',  0, 0),
( 5, '2023-03-25 06:05:09',  0, 0),
( 3, '2023-04-02 02:34:28',  0, 0),
( 9, '2023-04-11 10:42:35',  0, 0),
( 3, '2023-04-17 06:21:01',  0, 0),
( 3, '2023-04-01 23:18:31',  0, 0),
( 18, '2023-03-20 21:44:44',  0, 0),
( 3, '2023-03-31 04:28:14',  0, 0),
( 18, '2023-04-14 05:33:27',  0, 0),
( 3, '2023-03-18 04:47:50',  0, 0),
( 9, '2023-03-26 14:57:37',  0, 0),
( 7, '2023-04-17 06:56:08',  0, 0),
( 11, '2023-03-18 01:13:46',  0, 0),
( 12, '2023-04-15 00:44:19',  0, 0),
( 14, '2023-04-10 06:43:42',  0, 0),
( 18, '2023-04-14 10:41:09',  0, 0),
( 17, '2023-04-17 07:54:34',  0, 0),
( 3, '2023-03-23 21:44:55',  0, 0),
( 12, '2023-03-24 07:00:27',  0, 0),
( 18, '2023-03-30 16:34:41',  0, 0),
( 13, '2023-04-10 01:51:15',  0, 0),
( 15, '2023-03-24 17:29:32',  0, 0),
( 1, '2023-04-11 03:34:45',  0, 0),
( 1, '2023-04-20 10:18:28',  0, 0),
( 3, '2023-04-06 14:48:32',  0, 0),
( 16, '2023-03-18 06:08:17',  0, 0),
( 20, '2023-03-17 00:44:58',  0, 0),
( 20, '2023-03-20 08:30:27',  0, 0),
( 3, '2023-03-17 14:40:43',  0, 0),
( 3, '2023-03-18 18:16:57',  0, 0),
( 4, '2023-03-18 09:32:03',  0, 0),
( 16, '2023-03-23 03:14:42',  0, 0),
( 13, '2023-03-19 23:22:03',  0, 0),
( 3, '2023-03-19 03:40:52',  0, 0),
( 5, '2023-03-18 00:49:55',  0, 0),
( 4, '2023-03-22 10:49:32',  0, 0),
( 6, '2023-03-20 09:11:50',  0, 0),
( 15, '2023-03-21 10:03:35',  0, 0),
( 11, '2023-03-20 09:42:48',  0, 0),
( 3, '2023-03-20 12:07:38',  0, 0),
( 3, '2023-03-19 07:16:25',  0, 0),
( 18, '2023-03-21 21:39:52',  0, 0),
( 6, '2023-03-19 21:04:41',  0, 0),
( 15, '2023-03-17 20:40:43',  0, 0),
( 19, '2023-03-20 09:41:27',  0, 0),
( 9, '2023-03-19 04:47:51',  0, 0),
( 14, '2023-03-21 14:51:05',  0, 0),
( 20, '2023-03-17 09:59:55',  0, 0),
( 12, '2023-03-18 02:50:57',  0, 0),
( 15, '2023-03-17 17:09:47',  0, 0),
( 16, '2023-03-18 17:42:58',  0, 0),
( 1, '2023-03-21 09:05:24',  0, 0),
( 4, '2023-03-20 03:58:58',  0, 0),
( 11, '2023-03-17 11:00:15',  0, 0),
( 2, '2023-03-20 03:35:48',  0, 0),
( 19, '2023-03-19 07:31:58',  0, 0),
( 1, '2023-03-21 12:17:46',  0, 0),
( 13, '2023-03-17 00:21:59',  0, 0),
( 7, '2023-03-16 22:16:17',  0, 0),
( 18, '2023-03-21 06:20:20',  0, 0),
( 5, '2023-03-18 00:26:44',  0, 0),
( 18, '2023-03-20 08:47:37',  0, 0),
( 9, '2023-03-19 00:35:57',  0, 0),
( 15, '2023-03-19 21:50:22',  0, 0),
( 11, '2023-03-18 05:24:56',  0, 0),
( 20, '2023-03-20 03:36:04',  0, 0),
( 10, '2023-03-25 20:52:18',  0, 0),
( 12, '2023-03-31 15:06:28',  0, 0),
( 17, '2023-03-29 12:00:55',  0, 0),
( 11, '2023-04-06 21:47:25',  0, 0),
( 16, '2023-03-28 03:44:44',  0, 0),
( 9, '2023-04-13 04:57:21',  0, 0),
( 4, '2023-03-29 10:37:58',  0, 0),
( 8, '2023-04-01 20:17:26',  0, 0),
( 16, '2023-04-08 23:10:34',  0, 0),
( 5, '2023-03-17 09:57:09',  0, 0),
( 9, '2023-04-06 23:27:14',  0, 0),
( 13, '2023-03-17 09:33:34',  0, 0),
( 1, '2023-03-26 05:25:10',  0, 0),
( 18, '2023-03-28 00:11:21',  0, 0),
( 2, '2023-04-05 17:49:33',  0, 0),
( 16, '2023-03-27 13:34:16',  0, 0),
( 15, '2023-03-31 08:19:30',  0, 0),
( 1, '2023-03-20 15:36:12',  0, 0),
( 11, '2023-04-12 06:23:24',  0, 0),
( 20, '2023-03-24 19:48:38',  0, 0),
( 8, '2023-04-17 22:05:34',  0, 0),
( 13, '2023-05-25 10:06:19',  0, 0),
( 20, '2023-05-28 21:16:42',  0, 0),
( 14, '2023-03-23 13:40:19',  0, 0),
( 2, '2023-06-07 01:19:46',  0, 0),
( 1, '2023-04-20 17:58:31',  0, 0),
( 19, '2023-04-19 18:54:26',  0, 0),
( 19, '2023-04-14 04:33:43',  0, 0),
( 17, '2023-04-05 19:29:20',  0, 0),
( 11, '2023-05-20 14:38:01',  0, 0),
( 18, '2023-05-12 04:25:06',  0, 0),
( 16, '2023-05-02 14:01:06',  0, 0),
( 12, '2023-05-09 20:34:14',  0, 0),
( 13, '2023-06-01 18:35:53',  0, 0),
( 10, '2023-04-28 14:41:47',  0, 0),
( 18, '2023-04-12 03:09:41',  0, 0),
( 15, '2023-05-06 14:48:24',  0, 0),
( 12, '2023-06-07 18:16:20',  0, 0),
( 17, '2023-05-13 08:11:17',  0, 0),
( 20, '2023-05-15 02:02:08',  0, 0),
( 8, '2023-04-27 14:34:31',  0, 0),
( 11, '2023-04-29 11:33:13',  0, 0),
( 18, '2023-03-16 22:48:01',  0, 0),
( 7, '2023-04-10 16:39:09',  0, 0),
( 11, '2023-05-14 08:56:06',  0, 0),
( 4, '2023-05-03 00:31:13',  0, 0),
( 8, '2023-03-30 19:58:42',  0, 0),
( 8, '2023-04-29 04:30:54',  0, 0),
( 2, '2023-05-12 10:36:59',  0, 0),
( 2, '2023-03-29 11:48:22',  0, 0),
( 12, '2023-03-18 02:31:25',  0, 0),
( 14, '2023-05-03 08:12:07',  0, 0),
( 5, '2023-05-08 06:20:30',  0, 0),
( 1, '2023-04-04 07:14:42',  0, 0),
( 15, '2023-04-10 15:15:39',  0, 0),
( 18, '2023-04-02 19:05:36',  0, 0),
( 19, '2023-04-24 08:20:33',  0, 0),
( 8, '2023-03-20 20:13:38',  0, 0),
( 13, '2023-05-07 01:54:25',  0, 0),
( 9, '2023-04-29 06:27:22',  0, 0),
( 14, '2023-04-19 04:42:59',  0, 0),
( 8, '2023-05-26 19:55:23',  0, 0),
( 7, '2023-05-11 16:36:59',  0, 0),
( 3, '2023-05-10 12:33:14',  0, 0),
( 5, '2023-06-07 11:08:17',  0, 0),
( 12, '2023-03-26 01:51:12',  0, 0),
( 11, '2023-04-17 05:36:24',  0, 0),
( 17, '2023-04-28 20:32:43',  0, 0),
( 7, '2023-04-27 03:01:57',  0, 0),
( 5, '2023-03-29 13:24:02',  0, 0),
( 14, '2023-04-13 12:23:51',  0, 0),
( 7, '2023-05-01 15:54:05',  0, 0),
( 12, '2023-05-09 03:18:36',  0, 0),
( 13, '2023-05-27 16:56:34',  0, 0),
( 4, '2023-05-14 22:14:25',  0, 0),
( 5, '2023-05-21 04:54:23',  0, 0),
( 18, '2023-05-24 17:08:50',  0, 0),
( 9, '2023-03-23 07:42:11',  0, 0),
( 18, '2023-03-28 09:48:20',  0, 0),
( 12, '2023-05-09 04:38:24',  0, 0),
( 4, '2023-04-29 11:14:53',  0, 0),
( 11, '2023-05-02 12:16:00',  0, 0),
( 10, '2023-03-28 08:04:10',  0, 0),
( 6, '2023-04-05 06:44:49',  0, 0),
( 13, '2023-03-22 14:05:38',  0, 0),
( 5, '2023-05-06 23:54:30',  0, 0),
( 8, '2023-04-19 01:30:44',  0, 0),
( 7, '2023-04-03 23:52:13',  0, 0),
( 3, '2023-03-26 12:21:05',  0, 0),
( 19, '2023-04-14 10:56:11',  0, 0),
( 18, '2023-04-28 20:30:17',  0, 0),
( 19, '2023-04-27 04:07:10',  0, 0),
( 9, '2023-04-09 20:05:22',  0, 0),
( 2, '2023-04-22 02:35:56',  0, 0),
( 6, '2023-04-25 06:13:06',  0, 0),
( 17, '2023-03-27 02:26:57',  0, 0),
( 9, '2023-03-22 04:56:29',  0, 0),
( 14, '2023-04-30 19:28:20',  0, 0),
( 16, '2023-05-07 06:47:20',  0, 0),
( 7, '2023-04-21 06:48:24',  0, 0),
( 6, '2023-04-20 02:07:26',  0, 0),
( 18, '2023-04-15 00:43:18',  0, 0),
( 10, '2023-03-18 01:58:00',  0, 0),
( 11, '2023-03-25 15:57:28',  0, 0),
( 6, '2023-04-16 02:18:42',  0, 0),
( 13, '2023-04-13 01:57:24',  0, 0),
( 17, '2023-04-20 20:06:03',  0, 0),
( 2, '2023-04-09 22:55:42',  0, 0),
( 15, '2023-03-25 13:54:35',  0, 0),
( 12, '2023-04-19 16:35:10',  0, 0),
( 7, '2023-04-14 18:34:52',  0, 0),
( 2, '2023-04-05 04:12:38',  0, 0),
( 19, '2023-04-15 04:49:47',  0, 0),
( 2, '2023-03-20 15:13:57',  0, 0),
( 10, '2023-03-21 02:06:26',  0, 0),
( 3, '2023-04-06 13:32:09',  0, 0),
( 4, '2023-03-31 05:32:35',  0, 0),
( 2, '2023-03-25 03:52:25',  0, 0),
( 14, '2023-03-17 03:21:53',  0, 0),
( 14, '2023-03-27 02:54:58',  0, 0),
( 19, '2023-03-24 12:25:43',  0, 0),
( 20, '2023-03-20 06:12:27',  0, 0),
( 9, '2023-03-25 15:41:04',  0, 0),
( 16, '2023-03-20 21:01:54',  0, 0),
( 5, '2023-03-25 23:39:51',  0, 0),
( 2, '2023-03-26 03:13:28',  0, 0),
( 14, '2023-03-25 18:45:32',  0, 0),
( 8, '2023-03-17 16:52:32',  0, 0),
( 1, '2023-03-18 01:50:34',  0, 0),
( 1, '2023-04-02 08:51:52',  0, 0),
( 1, '2023-03-26 23:49:53',  0, 0),
( 20, '2023-03-18 08:23:39',  0, 0),
( 8, '2023-03-24 11:58:35',  0, 0),
( 14, '2023-03-29 00:02:06',  0, 0),
( 5, '2023-03-29 17:14:50',  0, 0),
( 17, '2023-03-30 15:19:52',  0, 0),
( 12, '2023-03-24 08:52:37',  0, 0),
( 1, '2023-03-24 21:06:59',  0, 0),
( 13, '2023-03-24 19:09:59',  0, 0),
( 14, '2023-03-19 17:01:12',  0, 0),
( 8, '2023-04-17 16:05:19',  0, 0),
( 1, '2023-03-22 08:28:35',  0, 0),
( 4, '2023-04-12 17:38:12',  0, 0),
( 12, '2023-05-02 16:30:17',  0, 0),
( 19, '2023-03-22 23:52:51',  0, 0),
( 11, '2023-03-20 20:27:37',  0, 0),
( 10, '2023-04-21 14:46:52',  0, 0),
( 2, '2023-04-09 19:02:58',  0, 0),
( 8, '2023-05-28 06:14:22',  0, 0),
( 3, '2023-04-29 07:55:02',  0, 0),
( 7, '2023-05-25 15:26:30',  0, 0),
( 5, '2023-04-20 00:34:59',  0, 0),
( 13, '2023-04-30 06:37:06',  0, 0),
( 14, '2023-04-06 15:18:53',  0, 0),
( 9, '2023-03-20 11:15:20',  0, 0),
( 17, '2023-05-27 03:26:33',  0, 0),
( 2, '2023-05-23 23:23:08',  0, 0),
( 13, '2023-04-01 13:19:11',  0, 0),
( 1, '2023-05-17 13:41:41',  0, 0),
( 11, '2023-04-08 08:26:39',  0, 0),
( 10, '2023-03-19 19:54:03',  0, 0),
( 10, '2023-03-24 15:56:11',  0, 0),
( 11, '2023-03-22 00:18:13',  0, 0),
( 12, '2023-03-30 15:28:27',  0, 0),
( 16, '2023-03-26 10:35:01',  0, 0),
( 12, '2023-03-18 16:58:19',  0, 0),
( 17, '2023-03-27 15:17:19',  0, 0),
( 6, '2023-03-20 02:42:57',  0, 0),
( 18, '2023-03-21 07:48:09',  0, 0),
( 2, '2023-03-25 17:50:02',  0, 0),
( 6, '2023-03-17 18:06:45',  0, 0),
( 3, '2023-03-21 16:45:55',  0, 0),
( 2, '2023-03-17 20:50:19',  0, 0),
( 12, '2023-03-30 08:02:11',  0, 0),
( 18, '2023-03-19 20:16:20',  0, 0),
( 12, '2023-03-26 13:09:18',  0, 0),
( 20, '2023-03-17 07:26:06',  0, 0),
( 3, '2023-03-20 20:42:07',  0, 0),
( 1, '2023-03-24 00:52:44',  0, 0),
( 4, '2023-03-17 02:04:11',  0, 0),
( 3, '2023-04-14 13:28:08',  0, 0),
( 20, '2023-04-18 09:12:33',  0, 0),
( 11, '2023-04-13 13:13:12',  0, 0),
( 20, '2023-04-02 08:15:21',  0, 0),
( 5, '2023-04-14 15:53:13',  0, 0),
( 10, '2023-03-20 11:45:32',  0, 0),
( 15, '2023-04-13 20:40:17',  0, 0),
( 2, '2023-04-21 04:58:22',  0, 0),
( 12, '2023-04-19 00:54:38',  0, 0),
( 16, '2023-04-02 14:43:38',  0, 0),
( 10, '2023-03-20 02:36:51',  0, 0),
( 3, '2023-04-15 10:53:01',  0, 0),
( 18, '2023-04-01 05:52:29',  0, 0),
( 8, '2023-04-04 00:02:05',  0, 0),
( 13, '2023-03-24 05:44:48',  0, 0),
( 2, '2023-03-18 15:33:07',  0, 0),
( 7, '2023-03-23 02:00:25',  0, 0),
( 15, '2023-03-22 21:31:29',  0, 0),
( 15, '2023-04-06 19:29:56',  0, 0),
( 14, '2023-03-20 17:37:31',  0, 0),
( 19, '2023-05-01 02:33:42',  0, 0),
( 4, '2023-05-26 08:28:06',  0, 0),
( 5, '2023-03-29 11:29:20',  0, 0),
( 8, '2023-04-09 02:45:24',  0, 0),
( 12, '2023-05-29 20:11:54',  0, 0),
( 7, '2023-04-01 07:10:58',  0, 0),
( 20, '2023-05-03 03:43:15',  0, 0),
( 7, '2023-05-31 11:13:45',  0, 0),
( 6, '2023-05-30 19:35:47',  0, 0),
( 20, '2023-04-03 06:05:42',  0, 0),
( 9, '2023-04-30 23:35:37',  0, 0),
( 3, '2023-04-04 11:55:52',  0, 0),
( 3, '2023-05-20 00:20:25',  0, 0),
( 18, '2023-04-16 06:17:07',  0, 0),
( 20, '2023-06-02 10:56:26',  0, 0),
( 7, '2023-06-02 07:48:22',  0, 0),
( 4, '2023-05-02 23:04:47',  0, 0),
( 8, '2023-03-20 10:12:38',  0, 0),
( 9, '2023-05-06 20:28:27',  0, 0),
( 12, '2023-05-30 19:53:45',  0, 0),
( 19, '2023-03-25 05:23:45',  0, 0),
( 9, '2023-06-07 01:48:52',  0, 0),
( 18, '2023-05-05 11:15:50',  0, 0),
( 6, '2023-05-24 14:51:50',  0, 0),
( 20, '2023-06-09 02:30:00',  0, 0),
( 7, '2023-04-01 14:17:23',  0, 0),
( 7, '2023-05-14 15:41:47',  0, 0),
( 20, '2023-06-15 06:04:31',  0, 0),
( 6, '2023-04-24 22:56:07',  0, 0),
( 6, '2023-05-19 22:24:47',  0, 0),
( 8, '2023-06-12 09:01:48',  0, 0),
( 1, '2023-05-30 02:10:58',  0, 0),
( 11, '2023-06-04 12:30:58',  0, 0),
( 20, '2023-03-27 13:19:57',  0, 0),
( 20, '2023-04-27 05:08:02',  0, 0),
( 7, '2023-05-20 21:07:33',  0, 0),
( 1, '2023-06-08 14:02:51',  0, 0),
( 11, '2023-03-24 22:58:53',  0, 0),
( 2, '2023-05-14 09:27:43',  0, 0),
( 3, '2023-05-10 20:57:21',  0, 0),
( 6, '2023-03-24 02:14:07',  0, 0),
( 20, '2023-03-23 22:04:48',  0, 0),
( 11, '2023-03-31 12:48:46',  0, 0),
( 8, '2023-03-17 09:08:47',  0, 0),
( 7, '2023-04-05 14:13:01',  0, 0),
( 16, '2023-03-21 15:53:12',  0, 0),
( 1, '2023-03-31 12:34:34',  0, 0),
( 5, '2023-04-02 17:25:35',  0, 0),
( 4, '2023-03-17 07:56:40',  0, 0),
( 5, '2023-03-24 08:11:46',  0, 0),
( 6, '2023-04-02 08:40:10',  0, 0),
( 14, '2023-03-20 18:26:22',  0, 0),
( 5, '2023-04-15 01:27:52',  0, 0),
( 4, '2023-03-28 09:48:05',  0, 0),
( 4, '2023-03-20 06:15:19',  0, 0),
( 17, '2023-03-27 05:47:25',  0, 0),
( 19, '2023-03-31 15:07:04',  0, 0),
( 15, '2023-04-11 23:45:37',  0, 0),
( 7, '2023-04-14 09:12:16',  0, 0),
( 14, '2023-04-08 16:05:49',  0, 0),
( 18, '2023-03-22 01:16:36',  0, 0),
( 20, '2023-04-23 05:25:26',  0, 0),
( 6, '2023-03-17 07:53:54',  0, 0),
( 5, '2023-03-24 10:36:18',  0, 0),
( 12, '2023-04-12 06:58:55',  0, 0),
( 6, '2023-04-04 12:41:59',  0, 0),
( 19, '2023-03-28 22:57:33',  0, 0),
( 16, '2023-03-27 18:29:38',  0, 0),
( 3, '2023-03-29 06:32:08',  0, 0),
( 4, '2023-04-18 23:35:46',  0, 0),
( 9, '2023-04-13 10:14:00',  0, 0),
( 15, '2023-03-26 20:12:08',  0, 0),
( 11, '2023-03-23 02:16:15',  0, 0),
( 14, '2023-03-24 23:52:30',  0, 0),
( 9, '2023-04-03 06:24:33',  0, 0),
( 14, '2023-04-12 17:11:27',  0, 0),
( 17, '2023-04-17 05:05:31',  0, 0),
( 20, '2023-04-15 06:15:57',  0, 0),
( 6, '2023-04-03 16:12:28',  0, 0),
( 18, '2023-03-27 05:33:28',  0, 0),
( 3, '2023-04-22 19:09:37',  0, 0),
( 12, '2023-04-21 14:35:22',  0, 0),
( 7, '2023-04-05 16:29:33',  0, 0),
( 8, '2023-04-09 11:11:18',  0, 0),
( 9, '2023-04-13 19:00:26',  0, 0),
( 12, '2023-05-08 02:59:56',  0, 0),
( 10, '2023-04-18 05:48:21',  0, 0),
( 3, '2023-04-05 03:41:31',  0, 0),
( 5, '2023-04-30 09:18:52',  0, 0),
( 4, '2023-04-03 10:20:36',  0, 0),
( 1, '2023-05-06 03:49:14',  0, 0),
( 15, '2023-03-30 02:21:22',  0, 0),
( 16, '2023-03-25 04:51:46',  0, 0),
( 19, '2023-04-03 02:22:58',  0, 0),
( 19, '2023-04-18 03:07:42',  0, 0),
( 4, '2023-04-19 04:25:06',  0, 0),
( 11, '2023-05-18 08:43:29',  0, 0),
( 17, '2023-04-09 18:29:52',  0, 0),
( 12, '2023-05-20 11:17:58',  0, 0),
( 16, '2023-05-11 20:12:41',  0, 0),
( 12, '2023-04-15 04:16:57',  0, 0),
( 4, '2023-03-18 09:21:12',  0, 0),
( 15, '2023-04-02 20:31:04',  0, 0),
( 19, '2023-05-10 00:30:29',  0, 0),
( 7, '2023-04-10 08:40:33',  0, 0),
( 3, '2023-05-03 07:09:27',  0, 0),
( 18, '2023-04-04 21:26:31',  0, 0),
( 4, '2023-04-07 03:31:01',  0, 0),
( 7, '2023-04-25 18:12:49',  0, 0),
( 12, '2023-05-06 01:25:14',  0, 0),
( 16, '2023-04-25 04:11:45',  0, 0),
( 16, '2023-04-27 07:16:27',  0, 0),
( 20, '2023-04-28 12:30:20',  0, 0),
( 16, '2023-03-19 04:27:33',  0, 0),
( 8, '2023-03-20 17:39:04',  0, 0),
( 1, '2023-05-11 07:15:10',  0, 0),
( 9, '2023-03-23 11:26:31',  0, 0),
( 1, '2023-03-28 01:44:41',  0, 0),
( 16, '2023-04-15 08:29:49',  0, 0),
( 19, '2023-04-21 08:05:46',  0, 0),
( 7, '2023-03-24 11:39:20',  0, 0),
( 13, '2023-04-13 11:10:47',  0, 0),
( 1, '2023-05-04 06:17:40',  0, 0),
( 8, '2023-03-22 15:04:25',  0, 0),
( 4, '2023-03-27 00:07:03',  0, 0),
( 16, '2023-04-01 16:36:04',  0, 0),
( 14, '2023-03-27 23:36:19',  0, 0),
( 12, '2023-05-03 06:55:41',  0, 0),
( 11, '2023-05-17 20:45:44',  0, 0),
( 15, '2023-05-22 00:55:40',  0, 0),
( 13, '2023-04-11 00:16:36',  0, 0),
( 8, '2023-05-16 11:33:44',  0, 0),
( 5, '2023-05-14 16:55:04',  0, 0),
( 5, '2023-04-23 22:25:21',  0, 0),
( 17, '2023-04-26 16:04:44',  0, 0),
( 12, '2023-05-13 07:33:32',  0, 0),
( 3, '2023-05-20 12:29:48',  0, 0),
( 7, '2023-05-03 11:59:57',  0, 0),
( 5, '2023-03-22 10:46:46',  0, 0),
( 12, '2023-05-03 16:34:28',  0, 0),
( 9, '2023-04-11 00:00:51',  0, 0),
( 20, '2023-04-08 05:39:12',  0, 0),
( 7, '2023-03-30 10:35:08',  0, 0),
( 7, '2023-03-22 18:10:03',  0, 0),
( 19, '2023-03-20 20:24:53',  0, 0),
( 19, '2023-04-14 20:54:18',  0, 0),
( 6, '2023-03-31 11:36:23',  0, 0),
( 17, '2023-04-14 22:13:11',  0, 0),
( 17, '2023-04-14 06:53:49',  0, 0),
( 14, '2023-04-16 17:45:39',  0, 0),
( 14, '2023-04-14 18:01:48',  0, 0),
( 4, '2023-04-06 16:20:01',  0, 0),
( 6, '2023-03-20 21:49:35',  0, 0),
( 5, '2023-03-30 04:33:19',  0, 0),
( 6, '2023-03-22 09:31:46',  0, 0),
( 11, '2023-03-25 06:42:31',  0, 0),
( 7, '2023-04-14 06:15:53',  0, 0),
( 12, '2023-04-05 12:31:10',  0, 0),
( 19, '2023-04-05 13:18:49',  0, 0),
( 20, '2023-03-23 15:21:17',  0, 0),
( 6, '2023-03-24 00:40:55',  0, 0),
( 7, '2023-04-04 11:11:01',  0, 0),
( 1, '2023-04-01 13:28:40',  0, 0),
( 5, '2023-04-07 18:14:53',  0, 0),
( 9, '2023-04-04 20:42:12',  0, 0),
( 5, '2023-04-07 17:25:24',  0, 0),
( 4, '2023-04-09 14:49:33',  0, 0),
( 19, '2023-04-06 04:28:42',  0, 0),
( 9, '2023-03-29 11:14:06',  0, 0),
( 3, '2023-04-06 00:20:45',  0, 0),
( 12, '2023-04-11 11:57:39',  0, 0),
( 16, '2023-04-11 22:56:24',  0, 0),
( 1, '2023-04-01 08:51:53',  0, 0),
( 8, '2023-04-03 06:11:38',  0, 0),
( 8, '2023-03-22 07:02:35',  0, 0),
( 18, '2023-04-10 19:32:49',  0, 0),
( 12, '2023-03-28 06:06:40',  0, 0),
( 20, '2023-03-29 04:59:29',  0, 0),
( 5, '2023-03-21 15:57:59',  0, 0),
( 19, '2023-04-05 19:13:28',  0, 0),
( 16, '2023-03-20 12:39:05',  0, 0),
( 14, '2023-04-21 15:26:36',  0, 0),
( 11, '2023-03-24 07:30:05',  0, 0),
( 5, '2023-04-09 18:29:30',  0, 0),
( 8, '2023-04-17 14:37:07',  0, 0),
( 9, '2023-04-09 22:52:22',  0, 0),
( 9, '2023-04-19 19:33:16',  0, 0),
( 10, '2023-03-24 00:14:42',  0, 0),
( 10, '2023-03-30 19:59:11',  0, 0),
( 14, '2023-04-20 20:51:21',  0, 0),
( 20, '2023-03-27 00:29:51',  0, 0),
( 17, '2023-04-08 05:03:53',  0, 0),
( 15, '2023-04-12 12:28:44',  0, 0),
( 15, '2023-04-21 19:56:11',  0, 0),
( 10, '2023-03-23 10:46:25',  0, 0),
( 4, '2023-04-10 04:43:04',  0, 0),
( 5, '2023-04-16 13:10:11',  0, 0),
( 17, '2023-04-04 17:06:03',  0, 0),
( 3, '2023-03-17 19:19:35',  0, 0),
( 17, '2023-03-27 17:11:39',  0, 0),
( 20, '2023-05-10 01:54:03',  0, 0),
( 6, '2023-04-14 09:58:47',  0, 0),
( 11, '2023-03-23 21:50:30',  0, 0),
( 11, '2023-04-30 17:45:06',  0, 0),
( 2, '2023-04-05 03:40:15',  0, 0),
( 5, '2023-05-04 06:22:16',  0, 0),
( 16, '2023-04-10 15:15:06',  0, 0),
( 1, '2023-05-06 04:35:15',  0, 0),
( 9, '2023-05-16 14:57:33',  0, 0),
( 10, '2023-05-11 03:17:57',  0, 0),
( 16, '2023-05-05 09:10:18',  0, 0),
( 18, '2023-04-28 00:24:01',  0, 0),
( 5, '2023-03-18 00:27:59',  0, 0),
( 20, '2023-04-15 01:43:22',  0, 0),
( 19, '2023-04-03 07:22:46',  0, 0),
( 2, '2023-05-05 01:39:11',  0, 0),
( 8, '2023-04-13 01:22:53',  0, 0),
( 8, '2023-03-18 05:18:32',  0, 0),
( 4, '2023-04-05 20:25:43',  0, 0),
( 20, '2023-04-05 06:59:50',  0, 0),
( 6, '2023-04-03 01:44:40',  0, 0),
( 10, '2023-04-19 03:28:15',  0, 0),
( 6, '2023-04-13 17:22:01',  0, 0),
( 20, '2023-04-27 21:50:52',  0, 0),
( 15, '2023-04-29 19:30:07',  0, 0),
( 17, '2023-04-22 23:44:58',  0, 0),
( 1, '2023-04-15 02:59:54',  0, 0),
( 10, '2023-04-11 01:16:34',  0, 0),
( 12, '2023-04-18 09:39:00',  0, 0),
( 3, '2023-03-31 17:46:25',  0, 0),
( 1, '2023-04-24 15:27:54',  0, 0),
( 17, '2023-03-31 02:24:14',  0, 0),
( 6, '2023-04-08 22:30:45',  0, 0),
( 19, '2023-03-30 03:08:53',  0, 0),
( 17, '2023-04-13 00:17:44',  0, 0),
( 1, '2023-03-30 17:26:28',  0, 0),
( 14, '2023-04-09 23:33:48',  0, 0),
( 18, '2023-04-16 00:09:15',  0, 0),
( 5, '2023-04-13 09:08:12',  0, 0),
( 17, '2023-04-10 01:10:27',  0, 0),
( 18, '2023-04-13 22:08:12',  0, 0),
( 14, '2023-04-16 17:54:24',  0, 0),
( 8, '2023-03-26 19:28:50',  0, 0),
( 2, '2023-04-24 15:00:19',  0, 0),
( 13, '2023-04-20 20:19:42',  0, 0),
( 18, '2023-04-12 21:25:29',  0, 0),
( 17, '2023-04-11 02:51:54',  0, 0),
( 19, '2023-03-17 08:41:14',  0, 0),
( 11, '2023-04-11 16:02:23',  0, 0),
( 13, '2023-04-04 08:53:41',  0, 0),
( 13, '2023-04-04 16:06:20',  0, 0),
( 13, '2023-04-19 20:09:33',  0, 0),
( 12, '2023-04-16 23:33:20',  0, 0),
( 7, '2023-04-04 03:04:01',  0, 0),
( 16, '2023-03-17 09:37:36',  0, 0),
( 18, '2023-03-17 18:26:48',  0, 0),
( 17, '2023-04-14 11:36:04',  0, 0),
( 12, '2023-04-18 20:48:37',  0, 0),
( 9, '2023-04-12 21:32:52',  0, 0),
( 13, '2023-05-01 07:34:33',  0, 0),
( 7, '2023-03-19 08:14:59',  0, 0),
( 10, '2023-03-17 23:41:49',  0, 0),
( 8, '2023-03-22 15:37:02',  0, 0),
( 11, '2023-03-18 23:15:55',  0, 0),
( 13, '2023-03-22 07:56:07',  0, 0),
( 8, '2023-03-17 05:46:46',  0, 0),
( 3, '2023-03-21 05:07:17',  0, 0),
( 8, '2023-03-22 07:11:04',  0, 0),
( 8, '2023-03-22 01:23:08',  0, 0),
( 16, '2023-03-19 17:47:41',  0, 0),
( 8, '2023-03-21 02:57:46',  0, 0),
( 4, '2023-03-20 16:53:39',  0, 0),
( 19, '2023-03-21 01:51:01',  0, 0),
( 13, '2023-03-19 19:03:52',  0, 0),
( 18, '2023-03-18 13:16:09',  0, 0),
( 5, '2023-03-16 23:27:30',  0, 0),
( 13, '2023-03-21 10:23:40',  0, 0),
( 8, '2023-03-20 06:42:35',  0, 0),
( 2, '2023-03-19 05:42:27',  0, 0),
( 2, '2023-03-21 16:59:28',  0, 0)
GO
------------------------------------------------------------------------
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 1 , 88000 , 1 , 1  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 1 , 88000 , 1 , 2  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 2 , 88000 , 1 , 3  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 2 , 88000 , 1 , 4  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 3 , 88000 , 1 , 5  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 3 , 88000 , 1 , 6  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 4 , 88000 , 1 , 7  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 4 , 88000 , 1 , 8  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 5 , 88000 , 1 , 9  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 5 , 88000 , 1 , 10  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 6 , 88000 , 1 , 11  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 6 , 88000 , 1 , 12  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 7 , 88000 , 1 , 13  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 7 , 88000 , 1 , 14  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 8 , 88000 , 1 , 15  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 8 , 88000 , 1 , 16  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 9 , 88000 , 1 , 17  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 9 , 88000 , 1 , 18  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 10 , 88000 , 1 , 19  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 10 , 88000 , 1 , 20  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 11 , 88000 , 1 , 21  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 11 , 88000 , 1 , 22  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 12 , 88000 , 1 , 23  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 12 , 88000 , 1 , 24  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 13 , 88000 , 1 , 25  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 13 , 88000 , 1 , 26  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 14 , 88000 , 1 , 27  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 14 , 88000 , 1 , 28  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 15 , 88000 , 1 , 29  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 15 , 88000 , 1 , 30  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 16 , 88000 , 1 , 31  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 16 , 88000 , 1 , 32  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 17 , 88000 , 1 , 33  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 17 , 88000 , 1 , 34  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 18 , 88000 , 1 , 35  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 18 , 88000 , 1 , 36  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 19 , 88000 , 1 , 37  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 19 , 88000 , 1 , 38  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 20 , 88000 , 1 , 39  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 20 , 88000 , 1 , 40  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 21 , 90000 , 2 , 271  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 21 , 90000 , 2 , 272  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 22 , 90000 , 2 , 273  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 22 , 90000 , 2 , 274  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 23 , 90000 , 2 , 275  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 23 , 90000 , 2 , 276  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 24 , 90000 , 2 , 277  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 24 , 90000 , 2 , 278  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 25 , 90000 , 2 , 279  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 25 , 90000 , 2 , 280  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 26 , 90000 , 2 , 281  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 26 , 90000 , 2 , 282  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 27 , 90000 , 2 , 283  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 27 , 90000 , 2 , 284  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 28 , 90000 , 2 , 285  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 28 , 90000 , 2 , 286  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 29 , 90000 , 2 , 287  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 29 , 90000 , 2 , 288  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 30 , 90000 , 2 , 289  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 30 , 90000 , 2 , 290  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 31 , 90000 , 2 , 291  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 31 , 90000 , 2 , 292  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 32 , 90000 , 2 , 293  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 32 , 90000 , 2 , 294  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 33 , 90000 , 2 , 295  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 33 , 90000 , 2 , 296  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 34 , 90000 , 2 , 297  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 34 , 90000 , 2 , 298  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 35 , 90000 , 2 , 299  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 35 , 90000 , 2 , 300  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 36 , 90000 , 2 , 301  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 36 , 90000 , 2 , 302  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 37 , 90000 , 2 , 303  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 37 , 90000 , 2 , 304  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 38 , 90000 , 2 , 305  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 38 , 90000 , 2 , 306  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 39 , 90000 , 2 , 307  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 39 , 90000 , 2 , 308  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 40 , 90000 , 2 , 309  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 40 , 90000 , 2 , 310  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 41 , 78000 , 3 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 41 , 78000 , 3 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 42 , 78000 , 3 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 42 , 78000 , 3 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 43 , 78000 , 3 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 43 , 78000 , 3 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 44 , 78000 , 3 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 44 , 78000 , 3 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 45 , 78000 , 3 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 45 , 78000 , 3 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 46 , 78000 , 3 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 46 , 78000 , 3 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 47 , 78000 , 3 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 47 , 78000 , 3 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 48 , 78000 , 3 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 48 , 78000 , 3 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 49 , 78000 , 3 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 49 , 78000 , 3 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 50 , 78000 , 3 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 50 , 78000 , 3 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 51 , 78000 , 3 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 51 , 78000 , 3 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 52 , 78000 , 3 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 52 , 78000 , 3 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 53 , 78000 , 3 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 53 , 78000 , 3 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 54 , 78000 , 3 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 54 , 78000 , 3 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 55 , 78000 , 3 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 55 , 78000 , 3 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 56 , 78000 , 3 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 56 , 78000 , 3 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 57 , 78000 , 3 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 57 , 78000 , 3 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 58 , 78000 , 3 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 58 , 78000 , 3 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 59 , 78000 , 3 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 59 , 78000 , 3 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 60 , 78000 , 3 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 60 , 78000 , 3 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 61 , 76000 , 4 , 1  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 61 , 76000 , 4 , 2  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 62 , 76000 , 4 , 3  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 62 , 76000 , 4 , 4  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 63 , 76000 , 4 , 5  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 63 , 76000 , 4 , 6  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 64 , 76000 , 4 , 7  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 64 , 76000 , 4 , 8  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 65 , 76000 , 4 , 9  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 65 , 76000 , 4 , 10  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 66 , 76000 , 4 , 11  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 66 , 76000 , 4 , 12  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 67 , 76000 , 4 , 13  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 67 , 76000 , 4 , 14  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 68 , 76000 , 4 , 15  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 68 , 76000 , 4 , 16  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 69 , 76000 , 4 , 17  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 69 , 76000 , 4 , 18  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 70 , 76000 , 4 , 19  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 70 , 76000 , 4 , 20  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 71 , 76000 , 4 , 21  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 71 , 76000 , 4 , 22  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 72 , 76000 , 4 , 23  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 72 , 76000 , 4 , 24  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 73 , 76000 , 4 , 25  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 73 , 76000 , 4 , 26  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 74 , 76000 , 4 , 27  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 74 , 76000 , 4 , 28  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 75 , 76000 , 4 , 29  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 75 , 76000 , 4 , 30  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 76 , 76000 , 4 , 31  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 76 , 76000 , 4 , 32  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 77 , 76000 , 4 , 33  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 77 , 76000 , 4 , 34  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 78 , 76000 , 4 , 35  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 78 , 76000 , 4 , 36  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 79 , 76000 , 4 , 37  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 79 , 76000 , 4 , 38  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 80 , 76000 , 4 , 39  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 80 , 76000 , 4 , 40  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 81 , 55000 , 5 , 181  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 81 , 55000 , 5 , 182  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 82 , 55000 , 5 , 183  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 82 , 55000 , 5 , 184  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 83 , 55000 , 5 , 185  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 83 , 55000 , 5 , 186  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 84 , 55000 , 5 , 187  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 84 , 55000 , 5 , 188  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 85 , 55000 , 5 , 189  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 85 , 55000 , 5 , 190  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 86 , 55000 , 5 , 191  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 86 , 55000 , 5 , 192  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 87 , 55000 , 5 , 193  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 87 , 55000 , 5 , 194  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 88 , 55000 , 5 , 195  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 88 , 55000 , 5 , 196  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 89 , 55000 , 5 , 197  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 89 , 55000 , 5 , 198  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 90 , 55000 , 5 , 199  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 90 , 55000 , 5 , 200  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 91 , 55000 , 5 , 201  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 91 , 55000 , 5 , 202  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 92 , 55000 , 5 , 203  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 92 , 55000 , 5 , 204  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 93 , 55000 , 5 , 205  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 93 , 55000 , 5 , 206  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 94 , 55000 , 5 , 207  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 94 , 55000 , 5 , 208  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 95 , 55000 , 5 , 209  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 95 , 55000 , 5 , 210  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 96 , 55000 , 5 , 211  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 96 , 55000 , 5 , 212  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 97 , 55000 , 5 , 213  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 97 , 55000 , 5 , 214  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 98 , 55000 , 5 , 215  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 98 , 55000 , 5 , 216  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 99 , 55000 , 5 , 217  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 99 , 55000 , 5 , 218  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 100 , 55000 , 5 , 219  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 100 , 55000 , 5 , 220  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 101 , 55000 , 6 , 1  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 101 , 55000 , 6 , 2  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 102 , 55000 , 6 , 3  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 102 , 55000 , 6 , 4  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 103 , 55000 , 6 , 5  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 103 , 55000 , 6 , 6  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 104 , 55000 , 6 , 7  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 104 , 55000 , 6 , 8  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 105 , 55000 , 6 , 9  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 105 , 55000 , 6 , 10  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 106 , 55000 , 6 , 11  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 106 , 55000 , 6 , 12  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 107 , 55000 , 6 , 13  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 107 , 55000 , 6 , 14  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 108 , 55000 , 6 , 15  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 108 , 55000 , 6 , 16  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 109 , 55000 , 6 , 17  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 109 , 55000 , 6 , 18  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 110 , 55000 , 6 , 19  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 110 , 55000 , 6 , 20  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 111 , 55000 , 6 , 21  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 111 , 55000 , 6 , 22  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 112 , 55000 , 6 , 23  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 112 , 55000 , 6 , 24  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 113 , 55000 , 6 , 25  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 113 , 55000 , 6 , 26  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 114 , 55000 , 6 , 27  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 114 , 55000 , 6 , 28  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 115 , 55000 , 6 , 29  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 115 , 55000 , 6 , 30  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 116 , 55000 , 6 , 31  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 116 , 55000 , 6 , 32  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 117 , 55000 , 6 , 33  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 117 , 55000 , 6 , 34  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 118 , 55000 , 6 , 35  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 118 , 55000 , 6 , 36  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 119 , 55000 , 6 , 37  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 119 , 55000 , 6 , 38  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 120 , 55000 , 6 , 39  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 120 , 55000 , 6 , 40  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 121 , 55000 , 7 , 1  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 121 , 55000 , 7 , 2  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 122 , 55000 , 7 , 3  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 122 , 55000 , 7 , 4  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 123 , 55000 , 7 , 5  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 123 , 55000 , 7 , 6  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 124 , 55000 , 7 , 7  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 124 , 55000 , 7 , 8  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 125 , 55000 , 7 , 9  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 125 , 55000 , 7 , 10  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 126 , 55000 , 7 , 11  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 126 , 55000 , 7 , 12  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 127 , 55000 , 7 , 13  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 127 , 55000 , 7 , 14  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 128 , 55000 , 7 , 15  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 128 , 55000 , 7 , 16  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 129 , 55000 , 7 , 17  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 129 , 55000 , 7 , 18  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 130 , 55000 , 7 , 19  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 130 , 55000 , 7 , 20  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 131 , 55000 , 7 , 21  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 131 , 55000 , 7 , 22  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 132 , 55000 , 7 , 23  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 132 , 55000 , 7 , 24  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 133 , 55000 , 7 , 25  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 133 , 55000 , 7 , 26  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 134 , 55000 , 7 , 27  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 134 , 55000 , 7 , 28  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 135 , 55000 , 7 , 29  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 135 , 55000 , 7 , 30  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 136 , 55000 , 7 , 31  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 136 , 55000 , 7 , 32  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 137 , 55000 , 7 , 33  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 137 , 55000 , 7 , 34  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 138 , 55000 , 7 , 35  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 138 , 55000 , 7 , 36  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 139 , 55000 , 7 , 37  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 139 , 55000 , 7 , 38  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 140 , 55000 , 7 , 39  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 140 , 55000 , 7 , 40  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 141 , 82000 , 8 , 91  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 141 , 82000 , 8 , 92  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 142 , 82000 , 8 , 93  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 142 , 82000 , 8 , 94  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 143 , 82000 , 8 , 95  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 143 , 82000 , 8 , 96  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 144 , 82000 , 8 , 97  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 144 , 82000 , 8 , 98  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 145 , 82000 , 8 , 99  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 145 , 82000 , 8 , 100  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 146 , 82000 , 8 , 101  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 146 , 82000 , 8 , 102  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 147 , 82000 , 8 , 103  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 147 , 82000 , 8 , 104  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 148 , 82000 , 8 , 105  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 148 , 82000 , 8 , 106  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 149 , 82000 , 8 , 107  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 149 , 82000 , 8 , 108  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 150 , 82000 , 8 , 109  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 150 , 82000 , 8 , 110  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 151 , 82000 , 8 , 111  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 151 , 82000 , 8 , 112  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 152 , 82000 , 8 , 113  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 152 , 82000 , 8 , 114  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 153 , 82000 , 8 , 115  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 153 , 82000 , 8 , 116  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 154 , 82000 , 8 , 117  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 154 , 82000 , 8 , 118  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 155 , 82000 , 8 , 119  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 155 , 82000 , 8 , 120  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 156 , 82000 , 8 , 121  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 156 , 82000 , 8 , 122  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 157 , 82000 , 8 , 123  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 157 , 82000 , 8 , 124  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 158 , 82000 , 8 , 125  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 158 , 82000 , 8 , 126  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 159 , 82000 , 8 , 127  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 159 , 82000 , 8 , 128  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 160 , 82000 , 8 , 129  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 160 , 82000 , 8 , 130  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 161 , 54000 , 9 , 451  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 161 , 54000 , 9 , 452  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 162 , 54000 , 9 , 453  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 162 , 54000 , 9 , 454  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 163 , 54000 , 9 , 455  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 163 , 54000 , 9 , 456  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 164 , 54000 , 9 , 457  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 164 , 54000 , 9 , 458  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 165 , 54000 , 9 , 459  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 165 , 54000 , 9 , 460  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 166 , 54000 , 9 , 461  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 166 , 54000 , 9 , 462  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 167 , 54000 , 9 , 463  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 167 , 54000 , 9 , 464  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 168 , 54000 , 9 , 465  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 168 , 54000 , 9 , 466  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 169 , 54000 , 9 , 467  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 169 , 54000 , 9 , 468  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 170 , 54000 , 9 , 469  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 170 , 54000 , 9 , 470  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 171 , 54000 , 9 , 471  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 171 , 54000 , 9 , 472  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 172 , 54000 , 9 , 473  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 172 , 54000 , 9 , 474  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 173 , 54000 , 9 , 475  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 173 , 54000 , 9 , 476  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 174 , 54000 , 9 , 477  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 174 , 54000 , 9 , 478  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 175 , 54000 , 9 , 479  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 175 , 54000 , 9 , 480  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 176 , 54000 , 9 , 481  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 176 , 54000 , 9 , 482  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 177 , 54000 , 9 , 483  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 177 , 54000 , 9 , 484  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 178 , 54000 , 9 , 485  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 178 , 54000 , 9 , 486  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 179 , 54000 , 9 , 487  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 179 , 54000 , 9 , 488  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 180 , 54000 , 9 , 489  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 180 , 54000 , 9 , 490  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 181 , 97000 , 10 , 91  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 181 , 97000 , 10 , 92  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 182 , 97000 , 10 , 93  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 182 , 97000 , 10 , 94  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 183 , 97000 , 10 , 95  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 183 , 97000 , 10 , 96  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 184 , 97000 , 10 , 97  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 184 , 97000 , 10 , 98  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 185 , 97000 , 10 , 99  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 185 , 97000 , 10 , 100  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 186 , 97000 , 10 , 101  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 186 , 97000 , 10 , 102  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 187 , 97000 , 10 , 103  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 187 , 97000 , 10 , 104  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 188 , 97000 , 10 , 105  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 188 , 97000 , 10 , 106  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 189 , 97000 , 10 , 107  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 189 , 97000 , 10 , 108  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 190 , 97000 , 10 , 109  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 190 , 97000 , 10 , 110  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 191 , 97000 , 10 , 111  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 191 , 97000 , 10 , 112  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 192 , 97000 , 10 , 113  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 192 , 97000 , 10 , 114  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 193 , 97000 , 10 , 115  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 193 , 97000 , 10 , 116  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 194 , 97000 , 10 , 117  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 194 , 97000 , 10 , 118  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 195 , 97000 , 10 , 119  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 195 , 97000 , 10 , 120  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 196 , 97000 , 10 , 121  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 196 , 97000 , 10 , 122  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 197 , 97000 , 10 , 123  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 197 , 97000 , 10 , 124  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 198 , 97000 , 10 , 125  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 198 , 97000 , 10 , 126  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 199 , 97000 , 10 , 127  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 199 , 97000 , 10 , 128  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 200 , 97000 , 10 , 129  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 200 , 97000 , 10 , 130  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 201 , 66000 , 11 , 1  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 201 , 66000 , 11 , 2  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 202 , 66000 , 11 , 3  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 202 , 66000 , 11 , 4  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 203 , 66000 , 11 , 5  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 203 , 66000 , 11 , 6  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 204 , 66000 , 11 , 7  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 204 , 66000 , 11 , 8  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 205 , 66000 , 11 , 9  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 205 , 66000 , 11 , 10  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 206 , 66000 , 11 , 11  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 206 , 66000 , 11 , 12  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 207 , 66000 , 11 , 13  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 207 , 66000 , 11 , 14  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 208 , 66000 , 11 , 15  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 208 , 66000 , 11 , 16  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 209 , 66000 , 11 , 17  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 209 , 66000 , 11 , 18  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 210 , 66000 , 11 , 19  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 210 , 66000 , 11 , 20  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 211 , 66000 , 11 , 21  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 211 , 66000 , 11 , 22  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 212 , 66000 , 11 , 23  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 212 , 66000 , 11 , 24  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 213 , 66000 , 11 , 25  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 213 , 66000 , 11 , 26  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 214 , 66000 , 11 , 27  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 214 , 66000 , 11 , 28  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 215 , 66000 , 11 , 29  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 215 , 66000 , 11 , 30  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 216 , 66000 , 11 , 31  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 216 , 66000 , 11 , 32  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 217 , 66000 , 11 , 33  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 217 , 66000 , 11 , 34  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 218 , 66000 , 11 , 35  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 218 , 66000 , 11 , 36  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 219 , 66000 , 11 , 37  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 219 , 66000 , 11 , 38  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 220 , 66000 , 11 , 39  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 220 , 66000 , 11 , 40  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 221 , 83000 , 12 , 181  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 221 , 83000 , 12 , 182  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 222 , 83000 , 12 , 183  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 222 , 83000 , 12 , 184  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 223 , 83000 , 12 , 185  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 223 , 83000 , 12 , 186  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 224 , 83000 , 12 , 187  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 224 , 83000 , 12 , 188  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 225 , 83000 , 12 , 189  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 225 , 83000 , 12 , 190  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 226 , 83000 , 12 , 191  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 226 , 83000 , 12 , 192  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 227 , 83000 , 12 , 193  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 227 , 83000 , 12 , 194  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 228 , 83000 , 12 , 195  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 228 , 83000 , 12 , 196  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 229 , 83000 , 12 , 197  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 229 , 83000 , 12 , 198  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 230 , 83000 , 12 , 199  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 230 , 83000 , 12 , 200  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 231 , 83000 , 12 , 201  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 231 , 83000 , 12 , 202  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 232 , 83000 , 12 , 203  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 232 , 83000 , 12 , 204  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 233 , 83000 , 12 , 205  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 233 , 83000 , 12 , 206  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 234 , 83000 , 12 , 207  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 234 , 83000 , 12 , 208  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 235 , 83000 , 12 , 209  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 235 , 83000 , 12 , 210  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 236 , 83000 , 12 , 211  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 236 , 83000 , 12 , 212  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 237 , 83000 , 12 , 213  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 237 , 83000 , 12 , 214  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 238 , 83000 , 12 , 215  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 238 , 83000 , 12 , 216  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 239 , 83000 , 12 , 217  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 239 , 83000 , 12 , 218  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 240 , 83000 , 12 , 219  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 240 , 83000 , 12 , 220  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 241 , 67000 , 13 , 361  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 241 , 67000 , 13 , 362  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 242 , 67000 , 13 , 363  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 242 , 67000 , 13 , 364  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 243 , 67000 , 13 , 365  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 243 , 67000 , 13 , 366  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 244 , 67000 , 13 , 367  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 244 , 67000 , 13 , 368  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 245 , 67000 , 13 , 369  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 245 , 67000 , 13 , 370  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 246 , 67000 , 13 , 371  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 246 , 67000 , 13 , 372  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 247 , 67000 , 13 , 373  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 247 , 67000 , 13 , 374  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 248 , 67000 , 13 , 375  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 248 , 67000 , 13 , 376  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 249 , 67000 , 13 , 377  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 249 , 67000 , 13 , 378  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 250 , 67000 , 13 , 379  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 250 , 67000 , 13 , 380  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 251 , 67000 , 13 , 381  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 251 , 67000 , 13 , 382  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 252 , 67000 , 13 , 383  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 252 , 67000 , 13 , 384  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 253 , 67000 , 13 , 385  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 253 , 67000 , 13 , 386  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 254 , 67000 , 13 , 387  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 254 , 67000 , 13 , 388  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 255 , 67000 , 13 , 389  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 255 , 67000 , 13 , 390  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 256 , 67000 , 13 , 391  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 256 , 67000 , 13 , 392  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 257 , 67000 , 13 , 393  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 257 , 67000 , 13 , 394  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 258 , 67000 , 13 , 395  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 258 , 67000 , 13 , 396  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 259 , 67000 , 13 , 397  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 259 , 67000 , 13 , 398  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 260 , 67000 , 13 , 399  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 260 , 67000 , 13 , 400  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 261 , 82000 , 14 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 261 , 82000 , 14 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 262 , 82000 , 14 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 262 , 82000 , 14 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 263 , 82000 , 14 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 263 , 82000 , 14 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 264 , 82000 , 14 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 264 , 82000 , 14 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 265 , 82000 , 14 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 265 , 82000 , 14 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 266 , 82000 , 14 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 266 , 82000 , 14 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 267 , 82000 , 14 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 267 , 82000 , 14 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 268 , 82000 , 14 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 268 , 82000 , 14 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 269 , 82000 , 14 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 269 , 82000 , 14 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 270 , 82000 , 14 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 270 , 82000 , 14 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 271 , 82000 , 14 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 271 , 82000 , 14 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 272 , 82000 , 14 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 272 , 82000 , 14 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 273 , 82000 , 14 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 273 , 82000 , 14 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 274 , 82000 , 14 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 274 , 82000 , 14 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 275 , 82000 , 14 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 275 , 82000 , 14 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 276 , 82000 , 14 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 276 , 82000 , 14 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 277 , 82000 , 14 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 277 , 82000 , 14 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 278 , 82000 , 14 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 278 , 82000 , 14 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 279 , 82000 , 14 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 279 , 82000 , 14 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 280 , 82000 , 14 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 280 , 82000 , 14 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 281 , 95000 , 15 , 181  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 281 , 95000 , 15 , 182  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 282 , 95000 , 15 , 183  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 282 , 95000 , 15 , 184  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 283 , 95000 , 15 , 185  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 283 , 95000 , 15 , 186  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 284 , 95000 , 15 , 187  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 284 , 95000 , 15 , 188  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 285 , 95000 , 15 , 189  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 285 , 95000 , 15 , 190  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 286 , 95000 , 15 , 191  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 286 , 95000 , 15 , 192  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 287 , 95000 , 15 , 193  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 287 , 95000 , 15 , 194  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 288 , 95000 , 15 , 195  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 288 , 95000 , 15 , 196  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 289 , 95000 , 15 , 197  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 289 , 95000 , 15 , 198  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 290 , 95000 , 15 , 199  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 290 , 95000 , 15 , 200  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 291 , 95000 , 15 , 201  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 291 , 95000 , 15 , 202  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 292 , 95000 , 15 , 203  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 292 , 95000 , 15 , 204  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 293 , 95000 , 15 , 205  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 293 , 95000 , 15 , 206  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 294 , 95000 , 15 , 207  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 294 , 95000 , 15 , 208  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 295 , 95000 , 15 , 209  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 295 , 95000 , 15 , 210  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 296 , 95000 , 15 , 211  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 296 , 95000 , 15 , 212  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 297 , 95000 , 15 , 213  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 297 , 95000 , 15 , 214  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 298 , 95000 , 15 , 215  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 298 , 95000 , 15 , 216  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 299 , 95000 , 15 , 217  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 299 , 95000 , 15 , 218  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 300 , 95000 , 15 , 219  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 300 , 95000 , 15 , 220  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 301 , 83000 , 16 , 91  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 301 , 83000 , 16 , 92  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 302 , 83000 , 16 , 93  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 302 , 83000 , 16 , 94  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 303 , 83000 , 16 , 95  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 303 , 83000 , 16 , 96  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 304 , 83000 , 16 , 97  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 304 , 83000 , 16 , 98  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 305 , 83000 , 16 , 99  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 305 , 83000 , 16 , 100  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 306 , 83000 , 16 , 101  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 306 , 83000 , 16 , 102  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 307 , 83000 , 16 , 103  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 307 , 83000 , 16 , 104  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 308 , 83000 , 16 , 105  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 308 , 83000 , 16 , 106  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 309 , 83000 , 16 , 107  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 309 , 83000 , 16 , 108  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 310 , 83000 , 16 , 109  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 310 , 83000 , 16 , 110  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 311 , 83000 , 16 , 111  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 311 , 83000 , 16 , 112  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 312 , 83000 , 16 , 113  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 312 , 83000 , 16 , 114  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 313 , 83000 , 16 , 115  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 313 , 83000 , 16 , 116  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 314 , 83000 , 16 , 117  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 314 , 83000 , 16 , 118  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 315 , 83000 , 16 , 119  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 315 , 83000 , 16 , 120  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 316 , 83000 , 16 , 121  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 316 , 83000 , 16 , 122  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 317 , 83000 , 16 , 123  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 317 , 83000 , 16 , 124  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 318 , 83000 , 16 , 125  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 318 , 83000 , 16 , 126  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 319 , 83000 , 16 , 127  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 319 , 83000 , 16 , 128  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 320 , 83000 , 16 , 129  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 320 , 83000 , 16 , 130  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 321 , 63000 , 17 , 271  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 321 , 63000 , 17 , 272  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 322 , 63000 , 17 , 273  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 322 , 63000 , 17 , 274  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 323 , 63000 , 17 , 275  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 323 , 63000 , 17 , 276  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 324 , 63000 , 17 , 277  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 324 , 63000 , 17 , 278  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 325 , 63000 , 17 , 279  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 325 , 63000 , 17 , 280  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 326 , 63000 , 17 , 281  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 326 , 63000 , 17 , 282  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 327 , 63000 , 17 , 283  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 327 , 63000 , 17 , 284  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 328 , 63000 , 17 , 285  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 328 , 63000 , 17 , 286  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 329 , 63000 , 17 , 287  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 329 , 63000 , 17 , 288  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 330 , 63000 , 17 , 289  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 330 , 63000 , 17 , 290  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 331 , 63000 , 17 , 291  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 331 , 63000 , 17 , 292  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 332 , 63000 , 17 , 293  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 332 , 63000 , 17 , 294  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 333 , 63000 , 17 , 295  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 333 , 63000 , 17 , 296  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 334 , 63000 , 17 , 297  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 334 , 63000 , 17 , 298  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 335 , 63000 , 17 , 299  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 335 , 63000 , 17 , 300  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 336 , 63000 , 17 , 301  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 336 , 63000 , 17 , 302  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 337 , 63000 , 17 , 303  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 337 , 63000 , 17 , 304  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 338 , 63000 , 17 , 305  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 338 , 63000 , 17 , 306  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 339 , 63000 , 17 , 307  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 339 , 63000 , 17 , 308  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 340 , 63000 , 17 , 309  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 340 , 63000 , 17 , 310  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 341 , 48000 , 18 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 341 , 48000 , 18 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 342 , 48000 , 18 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 342 , 48000 , 18 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 343 , 48000 , 18 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 343 , 48000 , 18 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 344 , 48000 , 18 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 344 , 48000 , 18 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 345 , 48000 , 18 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 345 , 48000 , 18 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 346 , 48000 , 18 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 346 , 48000 , 18 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 347 , 48000 , 18 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 347 , 48000 , 18 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 348 , 48000 , 18 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 348 , 48000 , 18 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 349 , 48000 , 18 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 349 , 48000 , 18 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 350 , 48000 , 18 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 350 , 48000 , 18 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 351 , 48000 , 18 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 351 , 48000 , 18 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 352 , 48000 , 18 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 352 , 48000 , 18 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 353 , 48000 , 18 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 353 , 48000 , 18 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 354 , 48000 , 18 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 354 , 48000 , 18 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 355 , 48000 , 18 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 355 , 48000 , 18 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 356 , 48000 , 18 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 356 , 48000 , 18 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 357 , 48000 , 18 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 357 , 48000 , 18 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 358 , 48000 , 18 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 358 , 48000 , 18 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 359 , 48000 , 18 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 359 , 48000 , 18 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 360 , 48000 , 18 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 360 , 48000 , 18 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 361 , 49000 , 19 , 451  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 361 , 49000 , 19 , 452  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 362 , 49000 , 19 , 453  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 362 , 49000 , 19 , 454  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 363 , 49000 , 19 , 455  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 363 , 49000 , 19 , 456  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 364 , 49000 , 19 , 457  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 364 , 49000 , 19 , 458  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 365 , 49000 , 19 , 459  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 365 , 49000 , 19 , 460  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 366 , 49000 , 19 , 461  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 366 , 49000 , 19 , 462  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 367 , 49000 , 19 , 463  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 367 , 49000 , 19 , 464  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 368 , 49000 , 19 , 465  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 368 , 49000 , 19 , 466  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 369 , 49000 , 19 , 467  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 369 , 49000 , 19 , 468  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 370 , 49000 , 19 , 469  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 370 , 49000 , 19 , 470  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 371 , 49000 , 19 , 471  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 371 , 49000 , 19 , 472  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 372 , 49000 , 19 , 473  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 372 , 49000 , 19 , 474  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 373 , 49000 , 19 , 475  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 373 , 49000 , 19 , 476  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 374 , 49000 , 19 , 477  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 374 , 49000 , 19 , 478  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 375 , 49000 , 19 , 479  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 375 , 49000 , 19 , 480  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 376 , 49000 , 19 , 481  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 376 , 49000 , 19 , 482  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 377 , 49000 , 19 , 483  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 377 , 49000 , 19 , 484  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 378 , 49000 , 19 , 485  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 378 , 49000 , 19 , 486  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 379 , 49000 , 19 , 487  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 379 , 49000 , 19 , 488  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 380 , 49000 , 19 , 489  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 380 , 49000 , 19 , 490  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 381 , 47000 , 20 , 1  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 381 , 47000 , 20 , 2  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 382 , 47000 , 20 , 3  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 382 , 47000 , 20 , 4  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 383 , 47000 , 20 , 5  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 383 , 47000 , 20 , 6  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 384 , 47000 , 20 , 7  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 384 , 47000 , 20 , 8  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 385 , 47000 , 20 , 9  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 385 , 47000 , 20 , 10  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 386 , 47000 , 20 , 11  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 386 , 47000 , 20 , 12  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 387 , 47000 , 20 , 13  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 387 , 47000 , 20 , 14  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 388 , 47000 , 20 , 15  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 388 , 47000 , 20 , 16  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 389 , 47000 , 20 , 17  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 389 , 47000 , 20 , 18  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 390 , 47000 , 20 , 19  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 390 , 47000 , 20 , 20  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 391 , 47000 , 20 , 21  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 391 , 47000 , 20 , 22  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 392 , 47000 , 20 , 23  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 392 , 47000 , 20 , 24  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 393 , 47000 , 20 , 25  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 393 , 47000 , 20 , 26  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 394 , 47000 , 20 , 27  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 394 , 47000 , 20 , 28  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 395 , 47000 , 20 , 29  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 395 , 47000 , 20 , 30  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 396 , 47000 , 20 , 31  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 396 , 47000 , 20 , 32  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 397 , 47000 , 20 , 33  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 397 , 47000 , 20 , 34  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 398 , 47000 , 20 , 35  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 398 , 47000 , 20 , 36  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 399 , 47000 , 20 , 37  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 399 , 47000 , 20 , 38  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 400 , 47000 , 20 , 39  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 400 , 47000 , 20 , 40  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 401 , 70000 , 21 , 271  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 401 , 70000 , 21 , 272  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 402 , 70000 , 21 , 273  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 402 , 70000 , 21 , 274  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 403 , 70000 , 21 , 275  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 403 , 70000 , 21 , 276  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 404 , 70000 , 21 , 277  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 404 , 70000 , 21 , 278  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 405 , 70000 , 21 , 279  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 405 , 70000 , 21 , 280  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 406 , 70000 , 21 , 281  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 406 , 70000 , 21 , 282  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 407 , 70000 , 21 , 283  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 407 , 70000 , 21 , 284  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 408 , 70000 , 21 , 285  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 408 , 70000 , 21 , 286  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 409 , 70000 , 21 , 287  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 409 , 70000 , 21 , 288  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 410 , 70000 , 21 , 289  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 410 , 70000 , 21 , 290  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 411 , 70000 , 21 , 291  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 411 , 70000 , 21 , 292  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 412 , 70000 , 21 , 293  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 412 , 70000 , 21 , 294  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 413 , 70000 , 21 , 295  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 413 , 70000 , 21 , 296  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 414 , 70000 , 21 , 297  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 414 , 70000 , 21 , 298  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 415 , 70000 , 21 , 299  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 415 , 70000 , 21 , 300  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 416 , 70000 , 21 , 301  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 416 , 70000 , 21 , 302  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 417 , 70000 , 21 , 303  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 417 , 70000 , 21 , 304  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 418 , 70000 , 21 , 305  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 418 , 70000 , 21 , 306  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 419 , 70000 , 21 , 307  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 419 , 70000 , 21 , 308  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 420 , 70000 , 21 , 309  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 420 , 70000 , 21 , 310  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 421 , 73000 , 22 , 361  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 421 , 73000 , 22 , 362  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 422 , 73000 , 22 , 363  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 422 , 73000 , 22 , 364  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 423 , 73000 , 22 , 365  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 423 , 73000 , 22 , 366  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 424 , 73000 , 22 , 367  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 424 , 73000 , 22 , 368  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 425 , 73000 , 22 , 369  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 425 , 73000 , 22 , 370  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 426 , 73000 , 22 , 371  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 426 , 73000 , 22 , 372  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 427 , 73000 , 22 , 373  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 427 , 73000 , 22 , 374  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 428 , 73000 , 22 , 375  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 428 , 73000 , 22 , 376  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 429 , 73000 , 22 , 377  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 429 , 73000 , 22 , 378  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 430 , 73000 , 22 , 379  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 430 , 73000 , 22 , 380  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 431 , 73000 , 22 , 381  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 431 , 73000 , 22 , 382  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 432 , 73000 , 22 , 383  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 432 , 73000 , 22 , 384  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 433 , 73000 , 22 , 385  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 433 , 73000 , 22 , 386  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 434 , 73000 , 22 , 387  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 434 , 73000 , 22 , 388  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 435 , 73000 , 22 , 389  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 435 , 73000 , 22 , 390  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 436 , 73000 , 22 , 391  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 436 , 73000 , 22 , 392  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 437 , 73000 , 22 , 393  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 437 , 73000 , 22 , 394  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 438 , 73000 , 22 , 395  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 438 , 73000 , 22 , 396  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 439 , 73000 , 22 , 397  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 439 , 73000 , 22 , 398  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 440 , 73000 , 22 , 399  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 440 , 73000 , 22 , 400  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 441 , 88000 , 23 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 441 , 88000 , 23 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 442 , 88000 , 23 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 442 , 88000 , 23 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 443 , 88000 , 23 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 443 , 88000 , 23 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 444 , 88000 , 23 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 444 , 88000 , 23 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 445 , 88000 , 23 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 445 , 88000 , 23 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 446 , 88000 , 23 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 446 , 88000 , 23 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 447 , 88000 , 23 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 447 , 88000 , 23 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 448 , 88000 , 23 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 448 , 88000 , 23 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 449 , 88000 , 23 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 449 , 88000 , 23 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 450 , 88000 , 23 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 450 , 88000 , 23 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 451 , 88000 , 23 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 451 , 88000 , 23 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 452 , 88000 , 23 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 452 , 88000 , 23 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 453 , 88000 , 23 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 453 , 88000 , 23 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 454 , 88000 , 23 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 454 , 88000 , 23 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 455 , 88000 , 23 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 455 , 88000 , 23 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 456 , 88000 , 23 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 456 , 88000 , 23 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 457 , 88000 , 23 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 457 , 88000 , 23 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 458 , 88000 , 23 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 458 , 88000 , 23 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 459 , 88000 , 23 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 459 , 88000 , 23 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 460 , 88000 , 23 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 460 , 88000 , 23 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 461 , 45000 , 24 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 461 , 45000 , 24 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 462 , 45000 , 24 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 462 , 45000 , 24 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 463 , 45000 , 24 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 463 , 45000 , 24 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 464 , 45000 , 24 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 464 , 45000 , 24 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 465 , 45000 , 24 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 465 , 45000 , 24 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 466 , 45000 , 24 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 466 , 45000 , 24 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 467 , 45000 , 24 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 467 , 45000 , 24 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 468 , 45000 , 24 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 468 , 45000 , 24 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 469 , 45000 , 24 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 469 , 45000 , 24 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 470 , 45000 , 24 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 470 , 45000 , 24 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 471 , 45000 , 24 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 471 , 45000 , 24 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 472 , 45000 , 24 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 472 , 45000 , 24 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 473 , 45000 , 24 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 473 , 45000 , 24 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 474 , 45000 , 24 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 474 , 45000 , 24 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 475 , 45000 , 24 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 475 , 45000 , 24 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 476 , 45000 , 24 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 476 , 45000 , 24 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 477 , 45000 , 24 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 477 , 45000 , 24 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 478 , 45000 , 24 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 478 , 45000 , 24 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 479 , 45000 , 24 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 479 , 45000 , 24 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 480 , 45000 , 24 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 480 , 45000 , 24 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 481 , 66000 , 25 , 451  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 481 , 66000 , 25 , 452  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 482 , 66000 , 25 , 453  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 482 , 66000 , 25 , 454  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 483 , 66000 , 25 , 455  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 483 , 66000 , 25 , 456  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 484 , 66000 , 25 , 457  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 484 , 66000 , 25 , 458  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 485 , 66000 , 25 , 459  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 485 , 66000 , 25 , 460  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 486 , 66000 , 25 , 461  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 486 , 66000 , 25 , 462  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 487 , 66000 , 25 , 463  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 487 , 66000 , 25 , 464  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 488 , 66000 , 25 , 465  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 488 , 66000 , 25 , 466  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 489 , 66000 , 25 , 467  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 489 , 66000 , 25 , 468  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 490 , 66000 , 25 , 469  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 490 , 66000 , 25 , 470  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 491 , 66000 , 25 , 471  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 491 , 66000 , 25 , 472  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 492 , 66000 , 25 , 473  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 492 , 66000 , 25 , 474  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 493 , 66000 , 25 , 475  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 493 , 66000 , 25 , 476  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 494 , 66000 , 25 , 477  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 494 , 66000 , 25 , 478  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 495 , 66000 , 25 , 479  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 495 , 66000 , 25 , 480  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 496 , 66000 , 25 , 481  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 496 , 66000 , 25 , 482  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 497 , 66000 , 25 , 483  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 497 , 66000 , 25 , 484  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 498 , 66000 , 25 , 485  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 498 , 66000 , 25 , 486  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 499 , 66000 , 25 , 487  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 499 , 66000 , 25 , 488  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 500 , 66000 , 25 , 489  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 500 , 66000 , 25 , 490  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 501 , 98000 , 26 , 91  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 501 , 98000 , 26 , 92  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 502 , 98000 , 26 , 93  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 502 , 98000 , 26 , 94  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 503 , 98000 , 26 , 95  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 503 , 98000 , 26 , 96  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 504 , 98000 , 26 , 97  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 504 , 98000 , 26 , 98  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 505 , 98000 , 26 , 99  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 505 , 98000 , 26 , 100  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 506 , 98000 , 26 , 101  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 506 , 98000 , 26 , 102  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 507 , 98000 , 26 , 103  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 507 , 98000 , 26 , 104  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 508 , 98000 , 26 , 105  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 508 , 98000 , 26 , 106  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 509 , 98000 , 26 , 107  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 509 , 98000 , 26 , 108  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 510 , 98000 , 26 , 109  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 510 , 98000 , 26 , 110  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 511 , 98000 , 26 , 111  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 511 , 98000 , 26 , 112  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 512 , 98000 , 26 , 113  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 512 , 98000 , 26 , 114  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 513 , 98000 , 26 , 115  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 513 , 98000 , 26 , 116  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 514 , 98000 , 26 , 117  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 514 , 98000 , 26 , 118  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 515 , 98000 , 26 , 119  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 515 , 98000 , 26 , 120  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 516 , 98000 , 26 , 121  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 516 , 98000 , 26 , 122  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 517 , 98000 , 26 , 123  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 517 , 98000 , 26 , 124  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 518 , 98000 , 26 , 125  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 518 , 98000 , 26 , 126  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 519 , 98000 , 26 , 127  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 519 , 98000 , 26 , 128  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 520 , 98000 , 26 , 129  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 520 , 98000 , 26 , 130  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 521 , 73000 , 27 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 521 , 73000 , 27 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 522 , 73000 , 27 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 522 , 73000 , 27 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 523 , 73000 , 27 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 523 , 73000 , 27 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 524 , 73000 , 27 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 524 , 73000 , 27 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 525 , 73000 , 27 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 525 , 73000 , 27 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 526 , 73000 , 27 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 526 , 73000 , 27 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 527 , 73000 , 27 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 527 , 73000 , 27 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 528 , 73000 , 27 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 528 , 73000 , 27 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 529 , 73000 , 27 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 529 , 73000 , 27 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 530 , 73000 , 27 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 530 , 73000 , 27 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 531 , 73000 , 27 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 531 , 73000 , 27 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 532 , 73000 , 27 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 532 , 73000 , 27 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 533 , 73000 , 27 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 533 , 73000 , 27 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 534 , 73000 , 27 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 534 , 73000 , 27 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 535 , 73000 , 27 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 535 , 73000 , 27 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 536 , 73000 , 27 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 536 , 73000 , 27 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 537 , 73000 , 27 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 537 , 73000 , 27 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 538 , 73000 , 27 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 538 , 73000 , 27 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 539 , 73000 , 27 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 539 , 73000 , 27 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 540 , 73000 , 27 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 540 , 73000 , 27 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 541 , 94000 , 28 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 541 , 94000 , 28 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 542 , 94000 , 28 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 542 , 94000 , 28 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 543 , 94000 , 28 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 543 , 94000 , 28 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 544 , 94000 , 28 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 544 , 94000 , 28 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 545 , 94000 , 28 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 545 , 94000 , 28 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 546 , 94000 , 28 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 546 , 94000 , 28 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 547 , 94000 , 28 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 547 , 94000 , 28 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 548 , 94000 , 28 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 548 , 94000 , 28 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 549 , 94000 , 28 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 549 , 94000 , 28 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 550 , 94000 , 28 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 550 , 94000 , 28 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 551 , 94000 , 28 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 551 , 94000 , 28 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 552 , 94000 , 28 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 552 , 94000 , 28 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 553 , 94000 , 28 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 553 , 94000 , 28 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 554 , 94000 , 28 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 554 , 94000 , 28 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 555 , 94000 , 28 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 555 , 94000 , 28 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 556 , 94000 , 28 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 556 , 94000 , 28 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 557 , 94000 , 28 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 557 , 94000 , 28 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 558 , 94000 , 28 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 558 , 94000 , 28 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 559 , 94000 , 28 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 559 , 94000 , 28 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 560 , 94000 , 28 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 560 , 94000 , 28 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 561 , 58000 , 29 , 181  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 561 , 58000 , 29 , 182  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 562 , 58000 , 29 , 183  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 562 , 58000 , 29 , 184  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 563 , 58000 , 29 , 185  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 563 , 58000 , 29 , 186  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 564 , 58000 , 29 , 187  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 564 , 58000 , 29 , 188  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 565 , 58000 , 29 , 189  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 565 , 58000 , 29 , 190  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 566 , 58000 , 29 , 191  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 566 , 58000 , 29 , 192  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 567 , 58000 , 29 , 193  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 567 , 58000 , 29 , 194  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 568 , 58000 , 29 , 195  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 568 , 58000 , 29 , 196  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 569 , 58000 , 29 , 197  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 569 , 58000 , 29 , 198  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 570 , 58000 , 29 , 199  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 570 , 58000 , 29 , 200  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 571 , 58000 , 29 , 201  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 571 , 58000 , 29 , 202  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 572 , 58000 , 29 , 203  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 572 , 58000 , 29 , 204  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 573 , 58000 , 29 , 205  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 573 , 58000 , 29 , 206  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 574 , 58000 , 29 , 207  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 574 , 58000 , 29 , 208  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 575 , 58000 , 29 , 209  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 575 , 58000 , 29 , 210  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 576 , 58000 , 29 , 211  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 576 , 58000 , 29 , 212  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 577 , 58000 , 29 , 213  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 577 , 58000 , 29 , 214  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 578 , 58000 , 29 , 215  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 578 , 58000 , 29 , 216  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 579 , 58000 , 29 , 217  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 579 , 58000 , 29 , 218  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 580 , 58000 , 29 , 219  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 580 , 58000 , 29 , 220  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 581 , 66000 , 30 , 181  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 581 , 66000 , 30 , 182  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 582 , 66000 , 30 , 183  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 582 , 66000 , 30 , 184  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 583 , 66000 , 30 , 185  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 583 , 66000 , 30 , 186  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 584 , 66000 , 30 , 187  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 584 , 66000 , 30 , 188  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 585 , 66000 , 30 , 189  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 585 , 66000 , 30 , 190  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 586 , 66000 , 30 , 191  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 586 , 66000 , 30 , 192  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 587 , 66000 , 30 , 193  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 587 , 66000 , 30 , 194  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 588 , 66000 , 30 , 195  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 588 , 66000 , 30 , 196  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 589 , 66000 , 30 , 197  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 589 , 66000 , 30 , 198  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 590 , 66000 , 30 , 199  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 590 , 66000 , 30 , 200  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 591 , 66000 , 30 , 201  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 591 , 66000 , 30 , 202  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 592 , 66000 , 30 , 203  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 592 , 66000 , 30 , 204  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 593 , 66000 , 30 , 205  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 593 , 66000 , 30 , 206  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 594 , 66000 , 30 , 207  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 594 , 66000 , 30 , 208  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 595 , 66000 , 30 , 209  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 595 , 66000 , 30 , 210  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 596 , 66000 , 30 , 211  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 596 , 66000 , 30 , 212  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 597 , 66000 , 30 , 213  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 597 , 66000 , 30 , 214  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 598 , 66000 , 30 , 215  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 598 , 66000 , 30 , 216  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 599 , 66000 , 30 , 217  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 599 , 66000 , 30 , 218  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 600 , 66000 , 30 , 219  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 600 , 66000 , 30 , 220  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 601 , 81000 , 31 , 181  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 601 , 81000 , 31 , 182  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 602 , 81000 , 31 , 183  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 602 , 81000 , 31 , 184  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 603 , 81000 , 31 , 185  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 603 , 81000 , 31 , 186  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 604 , 81000 , 31 , 187  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 604 , 81000 , 31 , 188  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 605 , 81000 , 31 , 189  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 605 , 81000 , 31 , 190  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 606 , 81000 , 31 , 191  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 606 , 81000 , 31 , 192  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 607 , 81000 , 31 , 193  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 607 , 81000 , 31 , 194  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 608 , 81000 , 31 , 195  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 608 , 81000 , 31 , 196  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 609 , 81000 , 31 , 197  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 609 , 81000 , 31 , 198  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 610 , 81000 , 31 , 199  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 610 , 81000 , 31 , 200  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 611 , 81000 , 31 , 201  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 611 , 81000 , 31 , 202  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 612 , 81000 , 31 , 203  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 612 , 81000 , 31 , 204  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 613 , 81000 , 31 , 205  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 613 , 81000 , 31 , 206  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 614 , 81000 , 31 , 207  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 614 , 81000 , 31 , 208  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 615 , 81000 , 31 , 209  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 615 , 81000 , 31 , 210  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 616 , 81000 , 31 , 211  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 616 , 81000 , 31 , 212  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 617 , 81000 , 31 , 213  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 617 , 81000 , 31 , 214  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 618 , 81000 , 31 , 215  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 618 , 81000 , 31 , 216  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 619 , 81000 , 31 , 217  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 619 , 81000 , 31 , 218  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 620 , 81000 , 31 , 219  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 620 , 81000 , 31 , 220  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 621 , 95000 , 32 , 271  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 621 , 95000 , 32 , 272  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 622 , 95000 , 32 , 273  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 622 , 95000 , 32 , 274  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 623 , 95000 , 32 , 275  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 623 , 95000 , 32 , 276  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 624 , 95000 , 32 , 277  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 624 , 95000 , 32 , 278  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 625 , 95000 , 32 , 279  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 625 , 95000 , 32 , 280  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 626 , 95000 , 32 , 281  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 626 , 95000 , 32 , 282  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 627 , 95000 , 32 , 283  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 627 , 95000 , 32 , 284  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 628 , 95000 , 32 , 285  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 628 , 95000 , 32 , 286  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 629 , 95000 , 32 , 287  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 629 , 95000 , 32 , 288  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 630 , 95000 , 32 , 289  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 630 , 95000 , 32 , 290  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 631 , 95000 , 32 , 291  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 631 , 95000 , 32 , 292  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 632 , 95000 , 32 , 293  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 632 , 95000 , 32 , 294  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 633 , 95000 , 32 , 295  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 633 , 95000 , 32 , 296  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 634 , 95000 , 32 , 297  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 634 , 95000 , 32 , 298  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 635 , 95000 , 32 , 299  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 635 , 95000 , 32 , 300  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 636 , 95000 , 32 , 301  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 636 , 95000 , 32 , 302  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 637 , 95000 , 32 , 303  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 637 , 95000 , 32 , 304  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 638 , 95000 , 32 , 305  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 638 , 95000 , 32 , 306  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 639 , 95000 , 32 , 307  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 639 , 95000 , 32 , 308  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 640 , 95000 , 32 , 309  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 640 , 95000 , 32 , 310  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 641 , 67000 , 33 , 361  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 641 , 67000 , 33 , 362  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 642 , 67000 , 33 , 363  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 642 , 67000 , 33 , 364  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 643 , 67000 , 33 , 365  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 643 , 67000 , 33 , 366  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 644 , 67000 , 33 , 367  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 644 , 67000 , 33 , 368  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 645 , 67000 , 33 , 369  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 645 , 67000 , 33 , 370  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 646 , 67000 , 33 , 371  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 646 , 67000 , 33 , 372  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 647 , 67000 , 33 , 373  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 647 , 67000 , 33 , 374  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 648 , 67000 , 33 , 375  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 648 , 67000 , 33 , 376  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 649 , 67000 , 33 , 377  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 649 , 67000 , 33 , 378  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 650 , 67000 , 33 , 379  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 650 , 67000 , 33 , 380  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 651 , 67000 , 33 , 381  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 651 , 67000 , 33 , 382  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 652 , 67000 , 33 , 383  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 652 , 67000 , 33 , 384  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 653 , 67000 , 33 , 385  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 653 , 67000 , 33 , 386  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 654 , 67000 , 33 , 387  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 654 , 67000 , 33 , 388  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 655 , 67000 , 33 , 389  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 655 , 67000 , 33 , 390  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 656 , 67000 , 33 , 391  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 656 , 67000 , 33 , 392  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 657 , 67000 , 33 , 393  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 657 , 67000 , 33 , 394  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 658 , 67000 , 33 , 395  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 658 , 67000 , 33 , 396  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 659 , 67000 , 33 , 397  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 659 , 67000 , 33 , 398  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 660 , 67000 , 33 , 399  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 660 , 67000 , 33 , 400  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 661 , 97000 , 34 , 1  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 661 , 97000 , 34 , 2  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 662 , 97000 , 34 , 3  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 662 , 97000 , 34 , 4  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 663 , 97000 , 34 , 5  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 663 , 97000 , 34 , 6  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 664 , 97000 , 34 , 7  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 664 , 97000 , 34 , 8  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 665 , 97000 , 34 , 9  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 665 , 97000 , 34 , 10  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 666 , 97000 , 34 , 11  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 666 , 97000 , 34 , 12  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 667 , 97000 , 34 , 13  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 667 , 97000 , 34 , 14  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 668 , 97000 , 34 , 15  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 668 , 97000 , 34 , 16  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 669 , 97000 , 34 , 17  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 669 , 97000 , 34 , 18  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 670 , 97000 , 34 , 19  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 670 , 97000 , 34 , 20  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 671 , 97000 , 34 , 21  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 671 , 97000 , 34 , 22  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 672 , 97000 , 34 , 23  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 672 , 97000 , 34 , 24  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 673 , 97000 , 34 , 25  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 673 , 97000 , 34 , 26  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 674 , 97000 , 34 , 27  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 674 , 97000 , 34 , 28  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 675 , 97000 , 34 , 29  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 675 , 97000 , 34 , 30  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 676 , 97000 , 34 , 31  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 676 , 97000 , 34 , 32  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 677 , 97000 , 34 , 33  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 677 , 97000 , 34 , 34  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 678 , 97000 , 34 , 35  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 678 , 97000 , 34 , 36  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 679 , 97000 , 34 , 37  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 679 , 97000 , 34 , 38  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 680 , 97000 , 34 , 39  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 680 , 97000 , 34 , 40  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 681 , 60000 , 35 , 181  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 681 , 60000 , 35 , 182  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 682 , 60000 , 35 , 183  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 682 , 60000 , 35 , 184  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 683 , 60000 , 35 , 185  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 683 , 60000 , 35 , 186  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 684 , 60000 , 35 , 187  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 684 , 60000 , 35 , 188  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 685 , 60000 , 35 , 189  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 685 , 60000 , 35 , 190  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 686 , 60000 , 35 , 191  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 686 , 60000 , 35 , 192  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 687 , 60000 , 35 , 193  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 687 , 60000 , 35 , 194  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 688 , 60000 , 35 , 195  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 688 , 60000 , 35 , 196  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 689 , 60000 , 35 , 197  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 689 , 60000 , 35 , 198  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 690 , 60000 , 35 , 199  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 690 , 60000 , 35 , 200  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 691 , 60000 , 35 , 201  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 691 , 60000 , 35 , 202  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 692 , 60000 , 35 , 203  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 692 , 60000 , 35 , 204  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 693 , 60000 , 35 , 205  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 693 , 60000 , 35 , 206  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 694 , 60000 , 35 , 207  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 694 , 60000 , 35 , 208  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 695 , 60000 , 35 , 209  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 695 , 60000 , 35 , 210  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 696 , 60000 , 35 , 211  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 696 , 60000 , 35 , 212  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 697 , 60000 , 35 , 213  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 697 , 60000 , 35 , 214  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 698 , 60000 , 35 , 215  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 698 , 60000 , 35 , 216  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 699 , 60000 , 35 , 217  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 699 , 60000 , 35 , 218  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 700 , 60000 , 35 , 219  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 700 , 60000 , 35 , 220  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 701 , 60000 , 36 , 181  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 701 , 60000 , 36 , 182  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 702 , 60000 , 36 , 183  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 702 , 60000 , 36 , 184  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 703 , 60000 , 36 , 185  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 703 , 60000 , 36 , 186  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 704 , 60000 , 36 , 187  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 704 , 60000 , 36 , 188  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 705 , 60000 , 36 , 189  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 705 , 60000 , 36 , 190  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 706 , 60000 , 36 , 191  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 706 , 60000 , 36 , 192  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 707 , 60000 , 36 , 193  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 707 , 60000 , 36 , 194  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 708 , 60000 , 36 , 195  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 708 , 60000 , 36 , 196  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 709 , 60000 , 36 , 197  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 709 , 60000 , 36 , 198  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 710 , 60000 , 36 , 199  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 710 , 60000 , 36 , 200  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 711 , 60000 , 36 , 201  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 711 , 60000 , 36 , 202  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 712 , 60000 , 36 , 203  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 712 , 60000 , 36 , 204  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 713 , 60000 , 36 , 205  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 713 , 60000 , 36 , 206  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 714 , 60000 , 36 , 207  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 714 , 60000 , 36 , 208  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 715 , 60000 , 36 , 209  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 715 , 60000 , 36 , 210  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 716 , 60000 , 36 , 211  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 716 , 60000 , 36 , 212  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 717 , 60000 , 36 , 213  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 717 , 60000 , 36 , 214  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 718 , 60000 , 36 , 215  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 718 , 60000 , 36 , 216  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 719 , 60000 , 36 , 217  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 719 , 60000 , 36 , 218  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 720 , 60000 , 36 , 219  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 720 , 60000 , 36 , 220  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 721 , 80000 , 37 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 721 , 80000 , 37 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 722 , 80000 , 37 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 722 , 80000 , 37 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 723 , 80000 , 37 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 723 , 80000 , 37 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 724 , 80000 , 37 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 724 , 80000 , 37 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 725 , 80000 , 37 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 725 , 80000 , 37 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 726 , 80000 , 37 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 726 , 80000 , 37 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 727 , 80000 , 37 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 727 , 80000 , 37 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 728 , 80000 , 37 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 728 , 80000 , 37 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 729 , 80000 , 37 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 729 , 80000 , 37 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 730 , 80000 , 37 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 730 , 80000 , 37 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 731 , 80000 , 37 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 731 , 80000 , 37 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 732 , 80000 , 37 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 732 , 80000 , 37 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 733 , 80000 , 37 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 733 , 80000 , 37 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 734 , 80000 , 37 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 734 , 80000 , 37 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 735 , 80000 , 37 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 735 , 80000 , 37 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 736 , 80000 , 37 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 736 , 80000 , 37 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 737 , 80000 , 37 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 737 , 80000 , 37 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 738 , 80000 , 37 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 738 , 80000 , 37 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 739 , 80000 , 37 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 739 , 80000 , 37 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 740 , 80000 , 37 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 740 , 80000 , 37 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 741 , 49000 , 38 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 741 , 49000 , 38 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 742 , 49000 , 38 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 742 , 49000 , 38 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 743 , 49000 , 38 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 743 , 49000 , 38 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 744 , 49000 , 38 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 744 , 49000 , 38 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 745 , 49000 , 38 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 745 , 49000 , 38 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 746 , 49000 , 38 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 746 , 49000 , 38 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 747 , 49000 , 38 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 747 , 49000 , 38 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 748 , 49000 , 38 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 748 , 49000 , 38 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 749 , 49000 , 38 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 749 , 49000 , 38 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 750 , 49000 , 38 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 750 , 49000 , 38 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 751 , 49000 , 38 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 751 , 49000 , 38 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 752 , 49000 , 38 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 752 , 49000 , 38 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 753 , 49000 , 38 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 753 , 49000 , 38 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 754 , 49000 , 38 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 754 , 49000 , 38 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 755 , 49000 , 38 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 755 , 49000 , 38 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 756 , 49000 , 38 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 756 , 49000 , 38 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 757 , 49000 , 38 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 757 , 49000 , 38 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 758 , 49000 , 38 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 758 , 49000 , 38 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 759 , 49000 , 38 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 759 , 49000 , 38 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 760 , 49000 , 38 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 760 , 49000 , 38 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 761 , 48000 , 39 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 761 , 48000 , 39 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 762 , 48000 , 39 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 762 , 48000 , 39 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 763 , 48000 , 39 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 763 , 48000 , 39 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 764 , 48000 , 39 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 764 , 48000 , 39 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 765 , 48000 , 39 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 765 , 48000 , 39 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 766 , 48000 , 39 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 766 , 48000 , 39 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 767 , 48000 , 39 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 767 , 48000 , 39 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 768 , 48000 , 39 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 768 , 48000 , 39 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 769 , 48000 , 39 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 769 , 48000 , 39 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 770 , 48000 , 39 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 770 , 48000 , 39 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 771 , 48000 , 39 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 771 , 48000 , 39 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 772 , 48000 , 39 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 772 , 48000 , 39 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 773 , 48000 , 39 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 773 , 48000 , 39 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 774 , 48000 , 39 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 774 , 48000 , 39 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 775 , 48000 , 39 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 775 , 48000 , 39 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 776 , 48000 , 39 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 776 , 48000 , 39 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 777 , 48000 , 39 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 777 , 48000 , 39 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 778 , 48000 , 39 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 778 , 48000 , 39 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 779 , 48000 , 39 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 779 , 48000 , 39 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 780 , 48000 , 39 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 780 , 48000 , 39 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 781 , 60000 , 40 , 541  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 781 , 60000 , 40 , 542  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 782 , 60000 , 40 , 543  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 782 , 60000 , 40 , 544  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 783 , 60000 , 40 , 545  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 783 , 60000 , 40 , 546  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 784 , 60000 , 40 , 547  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 784 , 60000 , 40 , 548  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 785 , 60000 , 40 , 549  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 785 , 60000 , 40 , 550  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 786 , 60000 , 40 , 551  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 786 , 60000 , 40 , 552  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 787 , 60000 , 40 , 553  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 787 , 60000 , 40 , 554  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 788 , 60000 , 40 , 555  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 788 , 60000 , 40 , 556  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 789 , 60000 , 40 , 557  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 789 , 60000 , 40 , 558  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 790 , 60000 , 40 , 559  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 790 , 60000 , 40 , 560  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 791 , 60000 , 40 , 561  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 791 , 60000 , 40 , 562  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 792 , 60000 , 40 , 563  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 792 , 60000 , 40 , 564  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 793 , 60000 , 40 , 565  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 793 , 60000 , 40 , 566  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 794 , 60000 , 40 , 567  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 794 , 60000 , 40 , 568  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 795 , 60000 , 40 , 569  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 795 , 60000 , 40 , 570  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 796 , 60000 , 40 , 571  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 796 , 60000 , 40 , 572  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 797 , 60000 , 40 , 573  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 797 , 60000 , 40 , 574  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 798 , 60000 , 40 , 575  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 798 , 60000 , 40 , 576  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 799 , 60000 , 40 , 577  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 799 , 60000 , 40 , 578  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 800 , 60000 , 40 , 579  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 800 , 60000 , 40 , 580  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 801 , 67000 , 41 , 451  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 801 , 67000 , 41 , 452  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 802 , 67000 , 41 , 453  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 802 , 67000 , 41 , 454  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 803 , 67000 , 41 , 455  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 803 , 67000 , 41 , 456  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 804 , 67000 , 41 , 457  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 804 , 67000 , 41 , 458  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 805 , 67000 , 41 , 459  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 805 , 67000 , 41 , 460  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 806 , 67000 , 41 , 461  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 806 , 67000 , 41 , 462  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 807 , 67000 , 41 , 463  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 807 , 67000 , 41 , 464  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 808 , 67000 , 41 , 465  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 808 , 67000 , 41 , 466  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 809 , 67000 , 41 , 467  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 809 , 67000 , 41 , 468  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 810 , 67000 , 41 , 469  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 810 , 67000 , 41 , 470  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 811 , 67000 , 41 , 471  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 811 , 67000 , 41 , 472  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 812 , 67000 , 41 , 473  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 812 , 67000 , 41 , 474  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 813 , 67000 , 41 , 475  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 813 , 67000 , 41 , 476  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 814 , 67000 , 41 , 477  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 814 , 67000 , 41 , 478  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 815 , 67000 , 41 , 479  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 815 , 67000 , 41 , 480  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 816 , 67000 , 41 , 481  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 816 , 67000 , 41 , 482  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 817 , 67000 , 41 , 483  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 817 , 67000 , 41 , 484  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 818 , 67000 , 41 , 485  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 818 , 67000 , 41 , 486  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 819 , 67000 , 41 , 487  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 819 , 67000 , 41 , 488  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 820 , 67000 , 41 , 489  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 820 , 67000 , 41 , 490  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 821 , 96000 , 42 , 271  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 821 , 96000 , 42 , 272  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 822 , 96000 , 42 , 273  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 822 , 96000 , 42 , 274  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 823 , 96000 , 42 , 275  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 823 , 96000 , 42 , 276  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 824 , 96000 , 42 , 277  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 824 , 96000 , 42 , 278  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 825 , 96000 , 42 , 279  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 825 , 96000 , 42 , 280  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 826 , 96000 , 42 , 281  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 826 , 96000 , 42 , 282  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 827 , 96000 , 42 , 283  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 827 , 96000 , 42 , 284  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 828 , 96000 , 42 , 285  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 828 , 96000 , 42 , 286  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 829 , 96000 , 42 , 287  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 829 , 96000 , 42 , 288  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 830 , 96000 , 42 , 289  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 830 , 96000 , 42 , 290  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 831 , 96000 , 42 , 291  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 831 , 96000 , 42 , 292  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 832 , 96000 , 42 , 293  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 832 , 96000 , 42 , 294  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 833 , 96000 , 42 , 295  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 833 , 96000 , 42 , 296  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 834 , 96000 , 42 , 297  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 834 , 96000 , 42 , 298  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 835 , 96000 , 42 , 299  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 835 , 96000 , 42 , 300  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 836 , 96000 , 42 , 301  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 836 , 96000 , 42 , 302  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 837 , 96000 , 42 , 303  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 837 , 96000 , 42 , 304  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 838 , 96000 , 42 , 305  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 838 , 96000 , 42 , 306  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 839 , 96000 , 42 , 307  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 839 , 96000 , 42 , 308  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 840 , 96000 , 42 , 309  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 840 , 96000 , 42 , 310  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 841 , 71000 , 43 , 1  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 841 , 71000 , 43 , 2  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 842 , 71000 , 43 , 3  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 842 , 71000 , 43 , 4  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 843 , 71000 , 43 , 5  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 843 , 71000 , 43 , 6  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 844 , 71000 , 43 , 7  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 844 , 71000 , 43 , 8  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 845 , 71000 , 43 , 9  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 845 , 71000 , 43 , 10  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 846 , 71000 , 43 , 11  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 846 , 71000 , 43 , 12  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 847 , 71000 , 43 , 13  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 847 , 71000 , 43 , 14  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 848 , 71000 , 43 , 15  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 848 , 71000 , 43 , 16  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 849 , 71000 , 43 , 17  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 849 , 71000 , 43 , 18  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 850 , 71000 , 43 , 19  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 850 , 71000 , 43 , 20  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 851 , 71000 , 43 , 21  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 851 , 71000 , 43 , 22  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 852 , 71000 , 43 , 23  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 852 , 71000 , 43 , 24  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 853 , 71000 , 43 , 25  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 853 , 71000 , 43 , 26  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 854 , 71000 , 43 , 27  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 854 , 71000 , 43 , 28  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 855 , 71000 , 43 , 29  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 855 , 71000 , 43 , 30  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 856 , 71000 , 43 , 31  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 856 , 71000 , 43 , 32  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 857 , 71000 , 43 , 33  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 857 , 71000 , 43 , 34  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 858 , 71000 , 43 , 35  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 858 , 71000 , 43 , 36  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 859 , 71000 , 43 , 37  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 859 , 71000 , 43 , 38  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 860 , 71000 , 43 , 39  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 860 , 71000 , 43 , 40  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 861 , 92000 , 44 , 181  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 861 , 92000 , 44 , 182  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 862 , 92000 , 44 , 183  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 862 , 92000 , 44 , 184  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 863 , 92000 , 44 , 185  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 863 , 92000 , 44 , 186  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 864 , 92000 , 44 , 187  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 864 , 92000 , 44 , 188  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 865 , 92000 , 44 , 189  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 865 , 92000 , 44 , 190  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 866 , 92000 , 44 , 191  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 866 , 92000 , 44 , 192  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 867 , 92000 , 44 , 193  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 867 , 92000 , 44 , 194  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 868 , 92000 , 44 , 195  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 868 , 92000 , 44 , 196  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 869 , 92000 , 44 , 197  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 869 , 92000 , 44 , 198  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 870 , 92000 , 44 , 199  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 870 , 92000 , 44 , 200  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 871 , 92000 , 44 , 201  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 871 , 92000 , 44 , 202  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 872 , 92000 , 44 , 203  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 872 , 92000 , 44 , 204  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 873 , 92000 , 44 , 205  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 873 , 92000 , 44 , 206  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 874 , 92000 , 44 , 207  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 874 , 92000 , 44 , 208  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 875 , 92000 , 44 , 209  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 875 , 92000 , 44 , 210  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 876 , 92000 , 44 , 211  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 876 , 92000 , 44 , 212  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 877 , 92000 , 44 , 213  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 877 , 92000 , 44 , 214  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 878 , 92000 , 44 , 215  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 878 , 92000 , 44 , 216  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 879 , 92000 , 44 , 217  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 879 , 92000 , 44 , 218  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 880 , 92000 , 44 , 219  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 880 , 92000 , 44 , 220  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 881 , 61000 , 45 , 451  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 881 , 61000 , 45 , 452  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 882 , 61000 , 45 , 453  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 882 , 61000 , 45 , 454  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 883 , 61000 , 45 , 455  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 883 , 61000 , 45 , 456  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 884 , 61000 , 45 , 457  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 884 , 61000 , 45 , 458  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 885 , 61000 , 45 , 459  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 885 , 61000 , 45 , 460  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 886 , 61000 , 45 , 461  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 886 , 61000 , 45 , 462  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 887 , 61000 , 45 , 463  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 887 , 61000 , 45 , 464  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 888 , 61000 , 45 , 465  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 888 , 61000 , 45 , 466  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 889 , 61000 , 45 , 467  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 889 , 61000 , 45 , 468  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 890 , 61000 , 45 , 469  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 890 , 61000 , 45 , 470  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 891 , 61000 , 45 , 471  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 891 , 61000 , 45 , 472  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 892 , 61000 , 45 , 473  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 892 , 61000 , 45 , 474  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 893 , 61000 , 45 , 475  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 893 , 61000 , 45 , 476  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 894 , 61000 , 45 , 477  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 894 , 61000 , 45 , 478  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 895 , 61000 , 45 , 479  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 895 , 61000 , 45 , 480  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 896 , 61000 , 45 , 481  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 896 , 61000 , 45 , 482  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 897 , 61000 , 45 , 483  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 897 , 61000 , 45 , 484  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 898 , 61000 , 45 , 485  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 898 , 61000 , 45 , 486  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 899 , 61000 , 45 , 487  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 899 , 61000 , 45 , 488  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 900 , 61000 , 45 , 489  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 900 , 61000 , 45 , 490  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 901 , 62000 , 46 , 181  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 901 , 62000 , 46 , 182  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 902 , 62000 , 46 , 183  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 902 , 62000 , 46 , 184  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 903 , 62000 , 46 , 185  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 903 , 62000 , 46 , 186  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 904 , 62000 , 46 , 187  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 904 , 62000 , 46 , 188  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 905 , 62000 , 46 , 189  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 905 , 62000 , 46 , 190  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 906 , 62000 , 46 , 191  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 906 , 62000 , 46 , 192  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 907 , 62000 , 46 , 193  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 907 , 62000 , 46 , 194  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 908 , 62000 , 46 , 195  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 908 , 62000 , 46 , 196  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 909 , 62000 , 46 , 197  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 909 , 62000 , 46 , 198  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 910 , 62000 , 46 , 199  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 910 , 62000 , 46 , 200  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 911 , 62000 , 46 , 201  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 911 , 62000 , 46 , 202  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 912 , 62000 , 46 , 203  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 912 , 62000 , 46 , 204  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 913 , 62000 , 46 , 205  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 913 , 62000 , 46 , 206  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 914 , 62000 , 46 , 207  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 914 , 62000 , 46 , 208  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 915 , 62000 , 46 , 209  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 915 , 62000 , 46 , 210  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 916 , 62000 , 46 , 211  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 916 , 62000 , 46 , 212  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 917 , 62000 , 46 , 213  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 917 , 62000 , 46 , 214  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 918 , 62000 , 46 , 215  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 918 , 62000 , 46 , 216  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 919 , 62000 , 46 , 217  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 919 , 62000 , 46 , 218  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 920 , 62000 , 46 , 219  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 920 , 62000 , 46 , 220  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 921 , 92000 , 47 , 361  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 921 , 92000 , 47 , 362  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 922 , 92000 , 47 , 363  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 922 , 92000 , 47 , 364  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 923 , 92000 , 47 , 365  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 923 , 92000 , 47 , 366  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 924 , 92000 , 47 , 367  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 924 , 92000 , 47 , 368  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 925 , 92000 , 47 , 369  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 925 , 92000 , 47 , 370  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 926 , 92000 , 47 , 371  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 926 , 92000 , 47 , 372  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 927 , 92000 , 47 , 373  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 927 , 92000 , 47 , 374  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 928 , 92000 , 47 , 375  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 928 , 92000 , 47 , 376  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 929 , 92000 , 47 , 377  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 929 , 92000 , 47 , 378  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 930 , 92000 , 47 , 379  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 930 , 92000 , 47 , 380  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 931 , 92000 , 47 , 381  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 931 , 92000 , 47 , 382  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 932 , 92000 , 47 , 383  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 932 , 92000 , 47 , 384  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 933 , 92000 , 47 , 385  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 933 , 92000 , 47 , 386  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 934 , 92000 , 47 , 387  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 934 , 92000 , 47 , 388  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 935 , 92000 , 47 , 389  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 935 , 92000 , 47 , 390  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 936 , 92000 , 47 , 391  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 936 , 92000 , 47 , 392  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 937 , 92000 , 47 , 393  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 937 , 92000 , 47 , 394  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 938 , 92000 , 47 , 395  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 938 , 92000 , 47 , 396  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 939 , 92000 , 47 , 397  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 939 , 92000 , 47 , 398  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 940 , 92000 , 47 , 399  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 940 , 92000 , 47 , 400  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 941 , 45000 , 48 , 451  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 941 , 45000 , 48 , 452  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 942 , 45000 , 48 , 453  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 942 , 45000 , 48 , 454  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 943 , 45000 , 48 , 455  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 943 , 45000 , 48 , 456  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 944 , 45000 , 48 , 457  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 944 , 45000 , 48 , 458  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 945 , 45000 , 48 , 459  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 945 , 45000 , 48 , 460  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 946 , 45000 , 48 , 461  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 946 , 45000 , 48 , 462  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 947 , 45000 , 48 , 463  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 947 , 45000 , 48 , 464  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 948 , 45000 , 48 , 465  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 948 , 45000 , 48 , 466  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 949 , 45000 , 48 , 467  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 949 , 45000 , 48 , 468  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 950 , 45000 , 48 , 469  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 950 , 45000 , 48 , 470  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 951 , 45000 , 48 , 471  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 951 , 45000 , 48 , 472  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 952 , 45000 , 48 , 473  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 952 , 45000 , 48 , 474  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 953 , 45000 , 48 , 475  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 953 , 45000 , 48 , 476  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 954 , 45000 , 48 , 477  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 954 , 45000 , 48 , 478  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 955 , 45000 , 48 , 479  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 955 , 45000 , 48 , 480  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 956 , 45000 , 48 , 481  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 956 , 45000 , 48 , 482  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 957 , 45000 , 48 , 483  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 957 , 45000 , 48 , 484  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 958 , 45000 , 48 , 485  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 958 , 45000 , 48 , 486  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 959 , 45000 , 48 , 487  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 959 , 45000 , 48 , 488  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 960 , 45000 , 48 , 489  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 960 , 45000 , 48 , 490  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 961 , 94000 , 49 , 361  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 961 , 94000 , 49 , 362  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 962 , 94000 , 49 , 363  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 962 , 94000 , 49 , 364  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 963 , 94000 , 49 , 365  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 963 , 94000 , 49 , 366  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 964 , 94000 , 49 , 367  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 964 , 94000 , 49 , 368  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 965 , 94000 , 49 , 369  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 965 , 94000 , 49 , 370  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 966 , 94000 , 49 , 371  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 966 , 94000 , 49 , 372  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 967 , 94000 , 49 , 373  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 967 , 94000 , 49 , 374  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 968 , 94000 , 49 , 375  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 968 , 94000 , 49 , 376  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 969 , 94000 , 49 , 377  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 969 , 94000 , 49 , 378  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 970 , 94000 , 49 , 379  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 970 , 94000 , 49 , 380  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 971 , 94000 , 49 , 381  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 971 , 94000 , 49 , 382  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 972 , 94000 , 49 , 383  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 972 , 94000 , 49 , 384  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 973 , 94000 , 49 , 385  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 973 , 94000 , 49 , 386  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 974 , 94000 , 49 , 387  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 974 , 94000 , 49 , 388  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 975 , 94000 , 49 , 389  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 975 , 94000 , 49 , 390  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 976 , 94000 , 49 , 391  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 976 , 94000 , 49 , 392  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 977 , 94000 , 49 , 393  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 977 , 94000 , 49 , 394  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 978 , 94000 , 49 , 395  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 978 , 94000 , 49 , 396  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 979 , 94000 , 49 , 397  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 979 , 94000 , 49 , 398  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 980 , 94000 , 49 , 399  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 980 , 94000 , 49 , 400  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 981 , 63000 , 50 , 451  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 981 , 63000 , 50 , 452  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 982 , 63000 , 50 , 453  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 982 , 63000 , 50 , 454  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 983 , 63000 , 50 , 455  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 983 , 63000 , 50 , 456  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 984 , 63000 , 50 , 457  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 984 , 63000 , 50 , 458  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 985 , 63000 , 50 , 459  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 985 , 63000 , 50 , 460  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 986 , 63000 , 50 , 461  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 986 , 63000 , 50 , 462  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 987 , 63000 , 50 , 463  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 987 , 63000 , 50 , 464  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 988 , 63000 , 50 , 465  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 988 , 63000 , 50 , 466  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 989 , 63000 , 50 , 467  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 989 , 63000 , 50 , 468  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 990 , 63000 , 50 , 469  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 990 , 63000 , 50 , 470  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 991 , 63000 , 50 , 471  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 991 , 63000 , 50 , 472  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 992 , 63000 , 50 , 473  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 992 , 63000 , 50 , 474  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 993 , 63000 , 50 , 475  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 993 , 63000 , 50 , 476  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 994 , 63000 , 50 , 477  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 994 , 63000 , 50 , 478  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 995 , 63000 , 50 , 479  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 995 , 63000 , 50 , 480  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 996 , 63000 , 50 , 481  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 996 , 63000 , 50 , 482  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 997 , 63000 , 50 , 483  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 997 , 63000 , 50 , 484  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 998 , 63000 , 50 , 485  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 998 , 63000 , 50 , 486  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 999 , 63000 , 50 , 487  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 999 , 63000 , 50 , 488  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 1000 , 63000 , 50 , 489  )
Go
INSERT INTO [dbo].[TICKET]([BOOKING_ID],[PRICE], [SCHEDULE_ID],[SEAT_ID])VALUES( 1000 , 63000 , 50 , 490  )
Go


----------------------------------------------------------------------------------------------

insert into FOOD_BOOKING VALUES ( 3 , 1 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 2 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 3 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 4 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 5 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 6 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 7 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 8 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 9 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 10 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 11 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 12 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 13 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 14 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 15 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 16 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 17 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 18 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 19 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 20 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 21 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 22 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 23 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 24 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 25 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 26 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 27 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 28 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 29 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 30 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 31 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 32 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 33 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 34 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 35 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 36 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 37 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 38 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 39 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 40 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 41 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 42 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 43 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 44 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 45 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 46 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 47 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 48 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 49 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 50 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 51 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 52 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 53 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 54 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 55 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 56 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 57 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 58 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 59 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 60 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 61 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 62 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 63 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 64 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 65 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 66 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 67 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 68 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 69 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 70 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 71 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 72 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 73 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 74 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 75 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 76 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 77 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 78 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 79 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 80 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 81 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 82 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 83 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 84 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 85 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 86 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 87 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 88 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 89 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 90 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 91 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 92 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 93 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 94 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 95 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 96 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 97 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 98 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 99 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 100 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 101 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 102 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 103 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 104 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 105 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 106 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 107 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 108 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 109 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 110 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 111 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 112 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 113 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 114 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 115 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 116 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 117 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 118 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 119 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 120 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 121 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 122 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 123 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 124 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 125 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 126 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 127 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 128 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 129 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 130 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 131 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 132 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 133 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 134 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 135 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 136 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 137 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 138 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 139 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 140 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 141 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 142 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 143 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 144 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 145 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 146 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 147 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 148 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 149 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 150 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 151 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 152 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 153 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 154 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 155 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 156 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 157 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 158 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 159 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 160 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 161 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 162 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 163 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 164 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 165 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 166 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 167 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 168 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 169 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 170 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 171 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 172 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 173 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 174 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 175 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 176 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 177 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 178 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 179 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 180 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 181 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 182 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 183 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 184 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 185 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 186 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 187 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 188 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 189 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 190 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 191 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 192 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 193 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 194 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 195 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 196 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 197 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 198 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 199 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 200 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 201 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 202 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 203 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 204 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 205 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 206 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 207 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 208 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 209 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 210 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 211 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 212 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 213 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 214 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 215 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 216 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 217 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 218 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 219 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 220 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 221 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 222 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 223 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 224 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 225 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 226 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 227 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 228 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 229 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 230 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 231 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 232 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 233 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 234 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 235 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 236 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 237 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 238 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 239 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 240 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 241 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 242 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 243 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 244 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 245 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 246 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 247 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 248 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 249 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 250 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 251 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 252 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 253 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 254 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 255 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 256 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 257 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 258 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 259 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 260 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 261 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 262 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 263 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 264 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 265 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 266 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 267 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 268 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 269 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 270 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 271 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 272 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 273 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 274 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 275 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 276 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 277 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 278 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 279 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 280 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 281 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 282 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 283 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 284 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 285 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 286 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 287 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 288 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 289 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 290 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 291 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 292 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 293 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 294 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 295 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 296 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 297 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 298 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 299 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 300 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 301 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 302 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 303 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 304 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 305 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 306 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 307 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 308 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 309 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 310 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 311 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 312 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 313 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 314 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 315 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 316 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 317 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 318 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 319 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 320 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 321 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 322 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 323 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 324 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 325 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 326 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 327 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 328 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 329 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 330 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 331 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 332 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 333 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 334 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 335 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 336 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 337 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 338 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 339 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 340 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 341 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 342 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 343 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 344 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 345 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 346 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 347 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 348 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 349 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 350 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 351 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 352 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 353 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 354 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 355 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 356 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 357 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 358 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 359 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 360 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 361 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 362 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 363 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 364 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 365 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 366 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 367 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 368 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 369 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 370 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 371 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 372 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 373 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 374 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 375 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 376 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 377 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 378 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 379 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 380 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 381 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 382 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 383 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 384 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 385 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 386 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 387 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 388 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 389 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 390 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 391 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 392 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 393 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 394 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 395 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 396 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 397 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 398 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 399 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 400 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 401 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 402 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 403 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 404 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 405 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 406 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 407 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 408 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 409 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 410 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 411 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 412 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 413 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 414 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 415 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 416 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 417 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 418 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 419 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 420 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 421 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 422 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 423 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 424 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 425 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 426 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 427 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 428 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 429 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 430 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 431 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 432 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 433 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 434 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 435 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 436 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 437 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 438 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 439 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 440 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 441 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 442 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 443 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 444 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 445 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 446 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 447 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 448 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 449 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 450 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 451 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 452 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 453 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 454 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 455 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 456 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 457 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 458 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 459 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 460 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 461 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 462 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 463 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 464 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 465 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 466 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 467 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 468 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 469 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 470 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 471 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 472 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 473 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 474 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 475 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 476 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 477 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 478 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 479 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 480 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 481 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 482 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 483 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 484 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 485 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 486 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 487 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 488 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 489 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 490 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 491 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 492 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 493 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 494 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 495 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 496 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 497 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 498 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 499 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 500 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 501 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 502 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 503 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 504 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 505 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 506 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 507 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 508 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 509 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 510 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 511 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 512 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 513 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 514 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 515 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 516 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 517 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 518 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 519 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 520 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 521 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 522 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 523 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 524 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 525 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 526 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 527 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 528 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 529 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 530 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 531 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 532 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 533 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 534 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 535 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 536 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 537 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 538 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 539 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 540 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 541 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 542 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 543 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 544 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 545 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 546 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 547 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 548 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 549 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 550 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 551 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 552 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 553 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 554 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 555 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 556 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 557 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 558 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 559 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 560 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 561 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 562 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 563 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 564 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 565 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 566 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 567 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 568 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 569 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 570 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 571 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 572 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 573 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 574 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 575 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 576 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 577 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 578 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 579 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 580 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 581 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 582 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 583 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 584 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 585 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 586 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 587 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 588 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 589 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 590 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 591 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 592 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 593 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 594 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 595 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 596 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 597 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 598 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 599 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 600 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 601 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 602 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 603 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 604 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 605 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 606 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 607 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 608 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 609 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 610 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 611 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 612 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 613 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 614 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 615 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 616 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 617 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 618 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 619 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 620 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 621 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 622 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 623 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 624 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 625 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 626 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 627 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 628 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 629 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 630 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 631 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 632 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 633 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 634 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 635 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 636 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 637 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 638 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 639 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 640 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 641 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 642 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 643 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 644 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 645 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 646 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 647 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 648 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 649 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 650 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 651 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 652 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 653 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 654 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 655 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 656 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 657 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 658 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 659 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 660 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 661 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 662 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 663 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 664 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 665 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 666 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 667 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 668 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 669 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 670 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 671 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 672 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 673 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 674 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 675 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 676 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 677 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 6 , 678 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 679 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 680 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 681 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 682 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 683 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 684 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 685 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 686 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 687 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 688 , 6 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 689 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 690 , 4 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 691 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 2 , 692 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 693 , 2 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 694 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 3 , 695 , 3 )
Go
insert into FOOD_BOOKING VALUES ( 1 , 696 , 5 )
Go
insert into FOOD_BOOKING VALUES ( 4 , 697 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 698 , 1 )
Go
insert into FOOD_BOOKING VALUES ( 5 , 699 , 6 )
Go
