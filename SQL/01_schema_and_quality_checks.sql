# Checking for orphan rows:

SELECT COUNT(*)
FROM checkin_data c
LEFT JOIN user_data u
	ON c.user_id = u.user_id
WHERE u.user_id IS NULL;

SELECT COUNT(*)
FROM checkin_data c
LEFT JOIN gym_data g
	ON c.gym_id = g.gym_id
WHERE g.gym_id IS NULL;

SELECT COUNT(*)
FROM user_data u
LEFT JOIN subs_data s
	ON u.subscription_plan = s.subs_plan
WHERE s.subs_plan IS NULL;

# formalizing checkin/signup issue

SELECT 
	COUNT(*) AS total_checkins_before_signups, 
	COUNT(DISTINCT c.user_id) AS users_with_checins_before_signups
FROM checkin_data c
LEFT JOIN user_data u
	ON c.user_id = u.user_id
WHERE c.checkin_time < u.sign_up_date;