--Service being removed in Diagnostic Center

CREATE TABLE ServiceDelete_diagnostics
(
	ID	INT,
	Info 	VARCHAR(200),
CONSTRAINT PK_ServiceDeleteTR PRIMARY KEY (ID)
)
GO

ALTER TRIGGER TR_ServiceDelete
ON DiagnosticCenter
AFTER DELETE
AS

BEGIN

	DECLARE @ID BIGINT
	SELECT @ID = DiagnosisID FROM DELETED

	INSERT INTO ServiceDelete_diagnostics
	VALUES('The record no =' + CAST(@ID AS NVARCHAR(20)) + 'has been deleted at' + CAST(getdate() AS nvarchar(20)))
END
GO

-----------------------------------------------------------------------------------------------------------------------


--When a doctor changes the health care unit he is associated with

CREATE TABLE Update_tr
(
	ID	INT IDENTITY(1,1),
	Comment	VARCHAR(200),
CONSTRAINT PK_Update_tr PRIMARY KEY (ID)
)
GO


ALTER TRIGGER TR_DoctorHealthcareChange
ON Doctor
after UPDATE
AS
BEGIN
		
		DECLARE @ID	BIGINT
		DECLARE @OldHealthID	BIGINT, @NewHealthID	BIGINT
		Declare @string 	VARCHAR(MAX)

		SELECT @ID = DoctorID, @NewHealthID = HealthCareID
		FROM inserted

		SELECT @ID = DoctorID, @OldHealthID = HealthCareID
		FROM deleted

		IF(@NewHealthID != @OldHealthID)
			SET @string = ('Doctor changed the Hospital from' + CAST(@OldHealthID AS nvarchar(20)) + 'to' + CAST(@NewHealthID AS nvarchar(20)))

		

		INSERT INTO Update_tr 
		VALUES(@string)
END
GO

------------------------------------------------------------------------------------------------------------------------------------------------

--Doctor being removed

CREATE TABLE [dbo].[doctorAudit](
	DoctorAuditID INT PRIMARY KEY IDENTITY(1,1),
	DoctorID [varchar](10) NOT NULL,
	[DFName] [varchar](40) NULL,
	[DLName] [varchar](40) NULL,
	[DSpecialization] [varchar](50) NULL,
	[HealthCareID] [varchar](10) NOT NULL,
	[Action] CHAR(1),
	ActionDate DATETIME
);
GO


CREATE TRIGGER doctorremoved ON dbo.doctor
FOR DELETE 
AS
BEGIN
	INSERT INTO dbo.doctorAudit (DoctorID, DFName, DLName, DSpecialization, HealthCareID, [action], ActionDate)
	SELECT d.DoctorID, d.DFName, d.DLName, d.DSpecialization, d.HealthCareID, 'd',  GETDATE() FROM deleted d
END

DELETE FROM doctor WHERE DoctorID = 2000000001

SELECT * FROM doctorAudit
GO

-----------------------------------------------------------------------------------------------------------------------------------------------

--Medicines removed or added in pharmacy

CREATE TABLE [dbo].[MedPharmaAudit](
	PharmMedAuditID INT PRIMARY KEY IDENTITY(1,1),
	PharmaID [varchar](10) NOT NULL,
	MedId [varchar](10) NOT NULL,
	[Action] CHAR(1),
	ActionDate DATETIME
);
GO

-- delete trigger --

CREATE trigger medRemoved ON dbo.MedPharma
FOR DELETE 
AS
BEGIN
	INSERT INTO dbo.[MedPharmaAudit] (PharmaID, MedId, [Action], [ActionDate])
	SELECT d.PharmaID, d.MedId,'d',  GETDATE() FROM deleted d
END

DELETE FROM MedPharma WHERE PharmaID = 7000000001 AND MedId = 9000000001


-- INSERTION TRIGGER--

CREATE TRIGGER medAdded ON dbo.MedPharma
FOR INSERT
AS 
BEGIN
	INSERT INTO dbo.MedPharmaAudit (PharmaID, MedId, [Action], [ActionDate])
	SELECT i.PharmaID, i.MedId, 'i', GETDATE() FROM INSERTED i
END

INSERT INTO MedPharma VALUES (7000000001, 9000000002)

SELECT *FROM MedPharma
GO


