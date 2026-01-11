DROP TABLE IF EXISTS user_activity_features;
CREATE TABLE user_activity_features AS
SELECT
	user_id,
    
    COUNT(*) AS active_days,
    MIN(checkin_time) AS first_checkin,
    MAX(checkin_time) AS last_checkin,
    AVG(trening_duratation) AS avg_training_duratation,
    AVG(calories_burned) AS avg_calories_burned,
    COUNT(DISTINCT workout_type) AS workout_type_count
FROM clean_checkins
GROUP BY user_id;