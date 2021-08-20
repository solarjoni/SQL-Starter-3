/* 
	This line loads the database so you have access to 
	the data. Do not change or remove this line. 
	
	You can always click "Run" to start over.
*/
.read m3.sql

/*
	These lines will print the schematics of the table and show you a few rows of the data as examples. Keep in mind that the actual table is longer than the displayed rows.
*/
.schema Students
SELECT * FROM Students LIMIT 3;

/*** WRITE YOUR QUERIES BELOW ***/

/* Q1: Matchmaker */
.print ''
.print Matchmaker:
CREATE TABLE matchmaker AS 
	SELECT a.time, b.time, a.pet, a.song, a.color, b.color
  FROM students a, students b
  ON a.time <> b.time
  AND a.time < b.time
  AND a.pet = b.pet
  AND a.song = b.song
  AND a.color = b.color;
SELECT * FROM matchmaker LIMIT 100;

/* Q2: The Smallest Unique Positive Integer */
.print ''
.print The Smallest Unique Positive Integer:
CREATE TABLE smallest_int_having AS 
	SELECT time, number AS smallest
  FROM students;
.mode tab
SELECT time, MIN(smallest) FROM smallest_int_having;
.mode list

/* Q3 [OPTIONAL]: The Smallest Unique Positive Integer (Part 2) */
.print ''
.print The Smallest Unique Positive Integer (Part 2):
CREATE TABLE smallest_int_count AS 
	SELECT smallest, COUNT(smallest)
  FROM smallest_int_having
  GROUP BY smallest;
SELECT * FROM smallest_int_count LIMIT 10;