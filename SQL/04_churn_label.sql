ALTER TABLE user_activity_features
ADD COLUMN churned INT;

SET @last_date = (
	SELECT MAX(checkin_time)
    FROM checkin_data
);

UPDATE user_activity_features
SET churned = 
	CASE 
		WHEN DATEDIFF(@last_date, last_checkin) > 14 THEN 1
        ELSE 0
	END;
    
SELECT *
FROM user_activity_features
WHERE churned = 1;

SELECT * 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/user_activity_features.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
FROM user_activity_features