/* make people rabbits */
UPDATE player
SET hitpoints = '[["face_hub",0.9999e],["neck",0.9999e],["head",0.9999e],["pelvis",0.9999e],["spine1",0.9999e],["spine2",0.9999e],["spine3",0.9999e],["body",0.9999e],["arms",0.9999e],["hands",0.9999e],["legs",0.9999e]]'
WHERE hitpoints = '[["face_hub",0],["neck",0],["head",0],["pelvis",0],["spine1",0],["spine2",0],["spine3",0],["body",0],["arms",0],["hands",0],["legs",0]]'
LIMIT 5

/* Remove empty containers */
DELETE FROM container
WHERE last_updated_at <= NOW() - INTERVAL 12 HOUR
LIMIT 5

/* remove vehicles */
DELETE FROM vehicles
WHERE last_updated_at <= NOW() - INTERVAL 12 HOUR
LIMIT 5