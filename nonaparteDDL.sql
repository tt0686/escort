--CREATE DATABASE 
-- MYSQL DOES NOT HAVE TWO CONCEPTS REGARDING SCHEMA AND DATABASE LIKE ORACLE HAS 
CREATE DATABASE IF NOT EXISTS NONAPORTA; 

--User Tables 
--CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), birth DATE, death DATE); 
--HOW STORE PASSWORDS USERS ? 
-- USE HASH ALGORITHM SHA-256 , ALL THE HASHES HAS THE SAME LENGHT 
-- TWO EQUALS PASSWORDS GENERATE THE SAME HASH SO THE CROOKERS CAN GENERATE RAINBOWS TABLES TO MATCH 
-- USE SALT -> SO WE ARE PREVENTING TWO EQUAL PASSWORDS TO HAVE THE SAME HASH AND TO PREVENT RAINBOWS TABLES ATTACK !!! 
-- BUT WHERE DO WE STORE THE SALT , IF AN ATTACKER HAS ACCESS TO THE DATABASE HW WILL HAS ACCESS TO SALT 
-- THE RAINBOWS TABLES ARE CREATED IN THE ADVANCE AND DISTRIBUTED EN MASS TO SAVE CALCULATIONS FOR OTHERS SO HAVING ACCESS TO THE SALT 
-- http://www.appsdeveloperblog.com/encrypt-user-password-example-java/ 
-- https://security.stackexchange.com/questions/11221/how-big-should-salt-be 
-- https://howtodoinjava.com/security/how-to-generate-secure-password-hash-md5-sha-pbkdf2-bcrypt-examples/ 
-- https://blogs.msdn.microsoft.com/tzink/2012/08/29/how-rainbow-tables-work/ 
-- INSTEAD OF USING AN CRYPTOGRAPHICALLY SECURE HASH FUNCTION (SHA) WE WILL USE AN PASSWORD BASED KEY DERIVATION FUNCTION 
-- THIS FUNCTION WILL BE SLOW ENOUGH TO IMPEDE THE ATTACK BUT STILL FAST ENOUGH TO NOT CAUSE A NOTICEABLE DELAY FOR THE USE. 
-- THESE ALGORITHMS TAKE A WORK FACTOR (ALSO KNOWN AS SECURITY FACTOR) OR ITERATION COUNT AS AN ARGUMENT. THIS VALUE DETERMINES HOW SLOW THE HASH FUNCTION WILL BE. 
-- WHEN COMPUTERS BECOME FASTER NEXT YEAR WE CAN INCREASE THE WORK FACTOR TO BALANCE IT OUT. 
-- WE GONNA USE THE org.springframework.security.crypto.bcrypt.BCrypt CLASS TO GENERATE THE HASH AND THE SALT AND TO COMPARE PASSWORDS 
-- THE BCRYPT HASHES FOLLOW A STRUCTURE REFERRED TO AS A MODULAR CRYPT FORMAT(MCF)
-- $<id>$<cost>$<salt><digest>
-- VARCHAR IS VARIABLE LENGHT / CHAR IS FIXED LENGHT
-- THEY ALSO DIFFER IN MAXIMUM LENGTH AND IN WHETHER TRAILING SPACES ARE RETAINED !!!
--
-- CHAR(60) || BINARY || BINARY(60) 

CREATE TABLE IF NOT EXISTS NONAPORTA.USERS_LOGIN ( 
        ID INT PRIMARY KEY AUTO_INCREMENT, 
        LOGIN_NAME NOT NULL VARCHAR, 
        PASSWORD NOT NULL BINARY(60) 
); 

CREATE TABLE IF NOT EXISTS NONAPORTA.USERS_INFORMATION( 
ID, 
FIRST_NAME VARCHAR NULL, 
LAST_NAME, 
MAIL, 
REGISTER_DATE, 
SEX, 
PHOTO, 
PROFESSION 
);
