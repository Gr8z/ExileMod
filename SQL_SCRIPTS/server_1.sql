/* =================== DELETES =================== */

/* DELETE Dead Players */
DELETE from player_1
WHERE is_alive = 0;

/* DELETE Inactive Players */
DELETE FROM player_1
WHERE account_uid IN (SELECT uid FROM account WHERE last_connect_at < NOW() - INTERVAL 7 DAY 
AND total_connections < 10);

/* DELETE Bugged Players */
DELETE FROM player_1 
WHERE is_alive = 1 
and damage = 1;

DELETE FROM player_1 
WHERE account_uid = 'SomethingWentWrong'
OR account_uid = '';

/* DELETE old Players */
DELETE FROM player_1
WHERE LastUpdated < NOW() - INTERVAL 14 DAY;

/* DELETE old accounts */
DELETE FROM account
WHERE last_connect_at < NOW() - INTERVAL 30 DAY;

/* DELETE old Vehicles */
DELETE FROM vehicle_1
WHERE LastUpdated < NOW() - INTERVAL 7 DAY;

/* =================== UDPATES =================== */

/* Unlock Old Vehicles */
UPDATE `vehicle_1`
SET `is_locked` = '0' , `pin_code` = '0000' 
WHERE `LastUpdated` < now() - INTERVAL 5 DAY;

/* Unlock Old Safes */
UPDATE `container_1`
SET `is_locked` = '0' , `pin_code` = '0000' 
WHERE `last_accessed` < now() - INTERVAL 7 DAY;

/* fix players unable to log in */
UPDATE player_2
set damage = 0, hitpoint_head = 0, hitpoint_body = 0, hitpoint_hands = 0, hitpoint_legs = 0 
where is_alive = 1 
and damage = 1;