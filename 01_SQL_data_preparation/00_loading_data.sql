# 1. IMPORTING DATA
# when defining tables, already in the begining the data types are set to the correct ones.

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW  VARIABLES LIKE 'secure_file_priv';

DROP TABLE IF EXISTS user_data;
CREATE TABLE user_data (
	user_id VARCHAR(10),
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT,
    gender VARCHAR(10),
    birthdate DATE,
    sign_up_date DATE,
    user_location VARCHAR(50),
    subscription_plan VARCHAR(10)
);
# C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\user_data.csv
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/users_data.csv'
INTO TABLE user_data
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

DROP TABLE IF EXISTS checkin_data;
CREATE TABLE checkin_data (
	user_id VARCHAR(10),
    gym_id VARCHAR(10),
    checkin_time DATETIME,
    checkout_time DATETIME,
    workout_type VARCHAR(20),
    calories_burned INT
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/checkin_checkout_history_updated.csv'
INTO TABLE checkin_data
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

DROP TABLE IF EXISTS gym_data;
CREATE TABLE gym_data (
	gym_id VARCHAR(10),
    location VARCHAR(20),
    gym_type VARCHAR(10),
    facilities VARCHAR(50)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/gym_locations_data.csv'
INTO TABLE gym_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS subs_data;
CREATE TABLE subs_data (
	subs_plan VARCHAR(10),
    price_per_month FLOAT,
    features VARCHAR(120)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/subscription_plans.csv'
INTO TABLE subs_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
IGNORE 1 ROWS;

















