
--	Input : HealthCareID, Specialisation 
--	Output : DoctorID, Fname, Lname 

CREATE PROCEDURE HealthCareSpec
    @HealthID VARCHAR(10), 
    @SpecType VARCHAR(50)
    AS
BEGIN
    SELECT 
        d.DoctorID,
        d.DFName,
        d.DLName
    FROM
        Doctor d
    WHERE 
        d.HealthCareID = @HealthID AND
        d.DSpecialization = @SpecType
END
GO 

EXECUTE HealthCareSpec '106150808', 'Radiation Oncology'
GO
----------------------------------------------------------------------------------------------------------------------

--	Input : HealthCareID 
--	Output : Doc details (ID, Fname, Lname), Specialisation


CREATE PROCEDURE HealthUnitSearch
    @HealthID VARCHAR(10)
    AS
BEGIN
    SELECT
        d.DoctorID,
        d.DFName,
        d.DLName,
        d.DSpecialization
    FROM
        Doctor D
    WHERE d.HealthCareID = @HealthID
END
GO

EXECUTE HealthUnitSearch '106190385'
GO

----------------------------------------------------------------------------------------------------------------------

--	Input : HealthCareID - Anusha
--	Output : Insurance Providers they accept


CREATE PROCEDURE InsuranceProviderAccceptedByHealthcareUnit 
		@healthCareName NVARCHAR(255)
	AS
BEGIN
		SELECT i.InsuranceType
		FROM Insurance i
		WHERE InsuranceID IN

			(SELECT InsuranceID
				FROM AcceptedInsurance
				WHERE HealthCareID IN

						(SELECT HealthCareID
							FROM HealthCareUnit
							WHERE HealthCareType = @healthCareName))
END
GO

EXECUTE InsuranceProviderAccceptedByHealthcareUnit 'ADVENTIST HEALTH MEDICAL CENTER TEHACHAPI VALLEY'
GO

----------------------------------------------------------------------------------------------------------------------

--	Input : UserID- Anusha 
--	Output : The medications they are under


CREATE PROCEDURE PrescribedMedicationToTheUser
		@userID VARCHAR(40)
	AS
BEGIN
		SELECT l.MedId
		FROM PresMedList l
		WHERE PrescriptionID IN

			(SELECT PrescriptionID
				FROM Prescription
				WHERE VisitID IN

					(SELECT VisitID 
						FROM Visit 
						WHERE UserID IN

							(SELECT [UserID]
								FROM [User] u
								WHERE u.UserID = @userID)))
END
GO

EXECUTE PrescribedMedicationToTheUser 1000000001
GO




