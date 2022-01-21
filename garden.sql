--
-- File generated with SQLiteStudio v3.3.3 on Fri Jan 21 16:06:21 2022
--
-- Text encoding used: System
--

DROP DATABASE IF EXISTS garden;
CREATE DATABASE garden;
USE garden;

-- Table: HEALTH
DROP TABLE IF EXISTS HEALTH;
CREATE TABLE HEALTH (
illnessName VARCHAR(256) PRIMARY KEY,
symptoms TEXT,
cure TEXT
);
INSERT INTO HEALTH (illnessName, symptoms, cure) VALUES ('Healthy', NULL, NULL);
INSERT INTO HEALTH (illnessName, symptoms, cure) VALUES ('Damping-off', 'A plant disease occurring in excessively damp conditions, in particular the collapse and death of young seedlings as a result of a fungal infection.', 'Watering seedlings with an antifungal solution can help protect seedlings. You can also simmer mashed up garlic, and pour it over the seedlings once the water has cooled.');
INSERT INTO HEALTH (illnessName, symptoms, cure) VALUES ('Dehydrating', 'Leaves are turning brown around the edges, curling up or turning translucent they may be suffering from dehydration. Stick a finger 1 inch into soil. If it feels dry, the plant requires watering.', 'Stick a finger 1 inch into the plant''s soil. If it feels dry, your plant requires watering pick up smaller plants, before and after watering, and take note of their weigh');
INSERT INTO HEALTH (illnessName, symptoms, cure) VALUES ('Drowning', 'Plant is wilting, but seems to have plenty of water. Leaves will start to turn brown and wilt. Leaves will begin to yellow. When roots absorb too much the water is sent to leaves and they will begin to swell.', 'Bring the plant to a shaded area away from the sun. Check to make sure the pot is draining (adding holes if needed). Remove the pot from sitting in any still water. Do not re-­-water until the soil is dry to the touch. Check for Fungus or growth of any organisms. If you do not see steady growth and health in a week, re-­-pot the plant repeating the steps from transplanting (fill with 3/4-­-1/4 potting soil etc.)');
INSERT INTO HEALTH (illnessName, symptoms, cure) VALUES ('Lack of sunshine', 'Plants deprived of light have tiny leaves and yellow color because they don''t form chlorophyll. When plants lack sunlight, leaves begin to change colors from green to brown and yellow. Leaves will start to blister leaving tan, brown, or warty growths forming where the blisters were.', 'Check the area the plants are in. Make sure they have access to direct sunlight. If you cannot get quality sunlight, consider making or buying a grow light for the plants.');

-- Table: INSTRUCTIONS
DROP TABLE IF EXISTS INSTRUCTIONS;
CREATE TABLE INSTRUCTIONS (actionType VARCHAR(256) NOT NULL, stepNum INTEGER NOT NULL, plantName VARCHAR(256) NOT NULL REFERENCES PLANT (plantName) ON DELETE CASCADE ON UPDATE CASCADE, materialID INTEGER NOT NULL REFERENCES MATERIALS (materialID) ON DELETE CASCADE ON UPDATE CASCADE, instructionText TEXT, PRIMARY KEY (actionType, stepNum, plantName, materialID));
INSERT INTO INSTRUCTIONS (actionType, stepNum, plantName, materialID, instructionText) VALUES ('initial', 1, 'broccoli', 1, 'bury that seed.');
INSERT INTO INSTRUCTIONS (actionType, stepNum, plantName, materialID, instructionText) VALUES ('check up', 1, 'broccoli', 2, 'is it green? good');
INSERT INTO INSTRUCTIONS (actionType, stepNum, plantName, materialID, instructionText) VALUES ('harvest', 1, 'broccoli', 3, 'snip snap.');
INSERT INTO INSTRUCTIONS (actionType, stepNum, plantName, materialID, instructionText) VALUES ('initial', 1, 'bean', 4, 'bury that seed.');
INSERT INTO INSTRUCTIONS (actionType, stepNum, plantName, materialID, instructionText) VALUES ('check up', 1, 'bean', 3, 'does it look like a really small finger? good.');
INSERT INTO INSTRUCTIONS (actionType, stepNum, plantName, materialID, instructionText) VALUES ('harvest', 1, 'bean', 5, 'you should harvest it, but beans are gross.');
INSERT INTO INSTRUCTIONS (actionType, stepNum, plantName, materialID, instructionText) VALUES ('initial', 1, 'garlic', 2, 'bury that seed');
INSERT INTO INSTRUCTIONS (actionType, stepNum, plantName, materialID, instructionText) VALUES ('check up', 1, 'garlic', 6, 'leaf leaf leaf!!!');
INSERT INTO INSTRUCTIONS (actionType, stepNum, plantName, materialID, instructionText) VALUES ('harvest', 1, 'garlic', 8, 'scrumshis.');

-- Table: MATERIALS
DROP TABLE IF EXISTS MATERIALS;
CREATE TABLE MATERIALS (materialID INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL, name TEXT, price DECIMAL);
INSERT INTO MATERIALS (materialID, name, price) VALUES (1, 'soil', 12.99);
INSERT INTO MATERIALS (materialID, name, price) VALUES (2, 'water', 6.49);
INSERT INTO MATERIALS (materialID, name, price) VALUES (3, 'soil', 5.99);
INSERT INTO MATERIALS (materialID, name, price) VALUES (4, 'seeds', 4.49);
INSERT INTO MATERIALS (materialID, name, price) VALUES (5, 'water', 0);
INSERT INTO MATERIALS (materialID, name, price) VALUES (6, 'tray', 5.49);
INSERT INTO MATERIALS (materialID, name, price) VALUES (7, 'nursery pots', 5);
INSERT INTO MATERIALS (materialID, name, price) VALUES (8, 'gloves', 7);

-- Table: PLANT
DROP TABLE IF EXISTS PLANT;
CREATE TABLE PLANT (plantName VARCHAR(256) UNIQUE NOT NULL, depth REAL, growTemp TEXT, germTemp TEXT, illnessName TEXT REFERENCES HEALTH (illnessName) ON DELETE CASCADE ON UPDATE CASCADE, PRIMARY KEY (plantName));
INSERT INTO PLANT (plantName, depth, growTemp, germTemp, illnessName) VALUES ('basil', 0.125, '75', '80', 'Healthy');
INSERT INTO PLANT (plantName, depth, growTemp, germTemp, illnessName) VALUES ('broccoli', 0.5, '70', '77', 'Healthy');
INSERT INTO PLANT (plantName, depth, growTemp, germTemp, illnessName) VALUES ('bean', 1.0, '75', '65', 'Healthy');
INSERT INTO PLANT (plantName, depth, growTemp, germTemp, illnessName) VALUES ('garlic', 3.0, '70', '55', 'Healthy');

-- Table: PROJECT
DROP TABLE IF EXISTS PROJECT;
CREATE TABLE PROJECT (projectID INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL, gardenName TEXT);
INSERT INTO PROJECT (projectID, gardenName) VALUES (1, 'My Garden');
INSERT INTO PROJECT (projectID, gardenName) VALUES (2, 'Jacob''s veggies');
INSERT INTO PROJECT (projectID, gardenName) VALUES (3, 'Sunshine');

-- Table: PROJECT_PLANT
DROP TABLE IF EXISTS PROJECT_PLANT;
CREATE TABLE PROJECT_PLANT (projectID INTEGER REFERENCES PROJECT (projectID) ON DELETE CASCADE ON UPDATE CASCADE, plantName VARCHAR(256) REFERENCES PLANT (plantName) ON DELETE CASCADE ON UPDATE CASCADE, PRIMARY KEY (projectID, plantName));
INSERT INTO PROJECT_PLANT (projectID, plantName) VALUES (1, 'garlic');
INSERT INTO PROJECT_PLANT (projectID, plantName) VALUES (2, 'broccoli');
INSERT INTO PROJECT_PLANT (projectID, plantName) VALUES (3, 'bean');

-- Table: PROJECT_STATUS
DROP TABLE IF EXISTS PROJECT_STATUS;
CREATE TABLE PROJECT_STATUS (userID INTEGER REFERENCES USER (userID) ON DELETE CASCADE ON UPDATE CASCADE, projectID INTEGER REFERENCES PROJECT (projectID) ON DELETE CASCADE ON UPDATE CASCADE, status TEXT, PRIMARY KEY (userID, projectID));
INSERT INTO PROJECT_STATUS (userID, projectID, status) VALUES (1, 1, 'saved');
INSERT INTO PROJECT_STATUS (userID, projectID, status) VALUES (2, 2, 'saved');

-- Table: USER
DROP TABLE IF EXISTS USER;
CREATE TABLE USER (userID INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE NOT NULL, name TEXT, encryptedPassword VARCHAR (256));
INSERT INTO USER (userID, name, encryptedPassword) VALUES (1, 'Ben', 'Pwmf22gu');
INSERT INTO USER (userID, name, encryptedPassword) VALUES (2, 'Jacob', 'jgN2jKkW');

