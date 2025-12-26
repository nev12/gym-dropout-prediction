DROP TABLE IF EXISTS clean_checkins;
CREATE TABLE clean_checkins AS
SELECT 
	c.*,
	TIMESTAMPDIFF(MINUTE, checkin_time, checkout_time) AS trening_duratation,
    DATE(checkin_time) AS checkin_date,
    DAYOFWEEK(checkin_time) AS day_of_week,
    HOUR(checkin_time) AS hour_of_day,
    CASE
		WHEN c.checkin_time < u.sign_up_date THEN 1
        ELSE 0
	END AS pre_signup_checkin
FROM checkin_data c
LEFT JOIN user_data u
	ON c.user_id = u.user_id;