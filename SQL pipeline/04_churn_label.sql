ALTER TABLE user_activity_features
ADD COLUMN churned INT;

UPDATE user_activity_features
SET churned = 
	CASE 
		WHEN DATEDIFF(CURDATE(), last_checkin) > 21 THEN 1
        ELSE 0
	END;
