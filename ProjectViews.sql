--	PatientName, DoctorName, AppointmentDetails, Venue 

CREATE VIEW v_AppointmentDetails
	(VisitID, PatientName, DoctorName, AppointmentDate, AppointmetTime, [Address], InsuranceIDNo)
AS
	SELECT 
	V.VisitID,concat (U.FName,' ', U.LName),concat (D.DFName,'', D.DLName), V.[Date], V.[Time],
		concat(H.[Address],',',H.[city],',',H.[State],',',H.[ZipCode]),A.insuranceID
	
	FROM Visit V JOIN [user] U ON V.UserID = U.UserID
		JOIN 
		Doctor D ON D.DoctorID = V.DoctorID 
		JOIN
		HealthCareUnit H ON H.HealthCareID = D.HealthCareID
		JOIN
		UserInsurance A ON A.UserID = U.UserID
	
GO

----------------------------------------------------------------------------------------------------------------------


--UserID, PatientName, MedicineName

CREATE VIEW UserMedicine
	(UserID, PatientName, MedicineName)
AS
	SELECT U.UserID, concat(U.FName, '', U.LName), M.MedName 
	
	FROM [User] U join Visit V on U.UserID = V.UserID 
		join 
		Prescription P on P.VisitID = V.VisitID 
		join
		PresMedList L on L.PrescriptionID = P.PrescriptionID 
		join
		Medicine M on M.MedId = L.MedId
GO








