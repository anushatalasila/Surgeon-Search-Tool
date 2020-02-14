--User Table - Password

CREATE MASTER KEY ENCRYPTION BY   
PASSWORD = 'IceCreamSandwich';

CREATE CERTIFICATE Password19 
   WITH SUBJECT = 'UserPassword';  
GO  

CREATE SYMMETRIC KEY Password_Key19  
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE Password19;  
GO 

ALTER TABLE [User]   
    ADD Password_Encrypted VARBINARY(MAX);   
GO  

OPEN SYMMETRIC KEY Password_Key19 DECRYPTION BY CERTIFICATE Password19;
GO

UPDATE [User] SET Password_Encrypted = ENCRYPTBYKEY(KEY_GUID('Password_Key19'),PASSWORD) FROM [User];
GO

CLOSE SYMMETRIC KEY Password_Key19;
GO

ALTER TABLE [User] drop column [Password]

SELECT * FROM [User]
GO

-----------------------------------------------------------------------------------------------------------------------

--To Read Data --

OPEN SYMMETRIC KEY Password_Key19 DECRYPTION BY CERTIFICATE Password19;
GO

SELECT UserID, [Password_Encrypted] AS 'Encrypted Password', CONVERT(VARCHAR,DECRYPTBYKEY(Password_Encrypted)) AS 'Decrypted Password' 
FROM dbo.[User];
CLOSE SYMMETRIC KEY Password_Key19;
GO

--Inserting data--
OPEN SYMMETRIC KEY Password_Key19 DECRYPTION BY CERTIFICATE Password19;
GO

INSERT INTO dbo.[User]([UserID] ,[FName],[LName],[DOB] ,[Gender],[PhoneNumber],[Address],[City],[State],[Zip],[Password_Encrypted])
 VALUES (1000000001, 'Jane', 'Doe', '05-20-1998', 'F', 9003001009, '4 Shan Colony', 'Salem', 'MA', 123456 ',',ENCRYPTBYKEY(KEY_GUID('Password_Key19'), CONVERT(VARCHAR,'anypassword')));
GO;


