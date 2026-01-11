ALTER TABLE user_activity_features
ADD COLUMN days_since_last_checkin INT,
ADD COLUMN churned INT;

SET @last_date = (
	SELECT MAX(checkin_time)
    FROM checkin_data
);

UPDATE user_activity_features
SET 
	days_since_last_checkin = DATEDIFF(@last_date, last_checkin),
	churned = 
		CASE 
			WHEN days_since_last_checkin > 21 THEN 1
			ELSE 0
		END;