/* =================== DELETES =================== */

/* DELETE Inactive Players */
DELETE FROM player_1
WHERE account_uid IN (SELECT uid FROM account WHERE last_connect_at < NOW() - INTERVAL 7 DAY 
AND total_connections < 10);

/* DELETE Bugged Players */
DELETE FROM player_1 
WHERE damage = 1;

DELETE FROM player_1 
WHERE direction = 0
AND position_x = 0
AND position_y = 0
AND position_z = 0;

DELETE FROM player_1 
WHERE account_uid = 'SomethingWentWrong'
OR account_uid = '';

/* DELETE old Players */
DELETE FROM player_1
WHERE LastUpdated < NOW() - INTERVAL 14 DAY;

/* DELETE old accounts */
DELETE FROM account
WHERE last_connect_at < NOW() - INTERVAL 30 DAY;

/* Remove empty containers */
DELETE FROM container_1
WHERE last_updated_at <= NOW() - INTERVAL 48 HOUR
AND cargo_items = '[[],[]]' 
AND cargo_magazines = '[]' 
AND cargo_weapons = '[]' 
AND cargo_container = '[]';

/* DELETE old kills */
DELETE FROM `kills`
WHERE id NOT IN (
  SELECT id
  FROM (
    SELECT id
    FROM `kills`
    ORDER BY id DESC
    LIMIT 100
  ) foo
);


/* =================== UDPATES =================== */

/* fix players unable to log in */
UPDATE player_1
set damage = 0, hitpoints = '[]'
where hitpoints = '[["'
OR hitpoints = '[["!'
and damage = 1;