DROP TABLE IF EXISTS user_activity_features;
CREATE TABLE user_activity_features AS
SELECT
	user_id,
    
    COUNT(*) AS total_checkins,
    COUNT(DISTINCT checkin_date) AS active_days,
    MIN(checkin_time) AS first_checkin,
    MAX(checkin_time) AS last_checkin,
    AVG(trening_duratation) AS avg_training_duratation,
    AVG(calories_burned) AS avg_calories_burned,
    COUNT(DISTINCT workout_type) AS workout_type_count,
    
    COUNT(CASE WHEN pre_signup_checkin = 0 THEN 1 END) AS total_checkins_post_signup,
	MIN(CASE WHEN pre_signup_checkin = 0 THEN checkin_time END) AS first_checkin_post_signup,
    MAX(CASE WHEN pre_signup_checkin = 0 THEN checkin_time END) AS last_checkin_post_signup
    
FROM clean_checkins
GROUP BY user_id;
	