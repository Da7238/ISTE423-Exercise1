SELECT * FROM user INNER JOIN project_status USING (userID)
        INNER JOIN project USING (projectID) 
        INNER JOIN project_plant USING (projectID)
        INNER JOIN plant USING (plantID)
        
        ;
        
SELECT * FROM plant INNER JOIN instructions USING (plantName)
        INNER JOIN materials USING (materialID);
        

SELECT * FROM plant INNER JOIN health using (illnessName);

SELECt * FROM plant;

SELECT * FROM user;

SELECT * FROM project_status;

SELECT * FROM project_plant;

SELECT * FROM project;

SELECT * FROM materials;

SELECT * FROM instructions;

SELECT * FROM health;



        
