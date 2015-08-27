/* =================== DELETES =================== */

DELETE from player
WHERE is_alive = 0;

/* =================== UDPATES =================== */

UPDATE construction 
SET is_locked = -1
WHERE pin_code <> '000000' 
AND is_locked = 0;