--Primary key index for all the tables

--USER TABLE

CREATE INDEX [INDX_USERID] ON [User] ([UserID])
GO
----------------------------------------------------------------------------------------------------------------------
--HEALTHCAREUNIT

CREATE INDEX [INDX_HealthCareID] ON [HealthCareUnit] ([HealthCareID])
GO
----------------------------------------------------------------------------------------------------------------------
--DOCTORID

CREATE INDEX [INDX_[DoctorID] ON [Doctor] ([DoctorID])
GO
----------------------------------------------------------------------------------------------------------------------
--CUSTOMERFEEDBACK
--DOCTORID

CREATE INDEX [INDX_[DoctorID] ON [CustomerFeedback] ([DoctorID])
 GO

--USERID
CREATE INDEX [INDX_[UserID] ON [CustomerFeedback] ([UserID])
 GO
----------------------------------------------------------------------------------------------------------------------
--HEALTHCAREUNIT
CREATE INDEX [INDX_[HEALTHCAREID] ON [HealthCareUnit] ([HealthCareID])
GO 

--INSUARANCE
CREATE INDEX [INDX_InsuranceID] ON [Insurance] ([InsuranceID])
GO 
----------------------------------------------------------------------------------------------------------------------
--ACCEPTED INSUARANCE
 
CREATE INDEX [INDX_HealthCareID] ON [AcceptedInsurance] ([HealthCareID])
GO
----------------------------------------------------------------------------------------------------------------------
--DIAGNOSTIC CENTER
CREATE INDEX [INDX_DiagnosisID] ON [DiagnosticCenter] ([DiagnosisID])
GO 
--------------------------------------------------------------------------------------------------------------------- 
--DIAGNOSTIC REPORT
--VISITID
CREATE INDEX [INDX_VisitID] ON [DiagnosticReport] ([VisitID])
GO 

--DiagnosisID
CREATE INDEX [INDX_DiagnosisID] ON [DiagnosticReport] ([DiagnosisID])
GO
----------------------------------------------------------------------------------------------------------------------
--PHARMACY
CREATE INDEX [INDX_PharmaID] ON [Pharmacy] ([PharmaID])
GO
----------------------------------------------------------------------------------------------------------------------
--USER INSUARANCE
--USERID
CREATE INDEX [INDX_UserID] ON [UserInsurance] ([PharmaID])
GO 

--INSUARANCEID
CREATE INDEX [INDX_InsuranceID] ON [UserInsurance] ([InsuranceID])
GO
----------------------------------------------------------------------------------------------------------------------
--MEDICINE
CREATE INDEX [INDX_Medicine] ON [Medicine] ([MedId])
GO
----------------------------------------------------------------------------------------------------------------------
--PRESMEDLIST
--MEDID
CREATE INDEX [INDX_[PresMedList] ON [PresMedList] ([MedID])
GO

--PRESCRIPTIONID
CREATE INDEX [INDX_[PrescriptionID] ON [PresMedList] ([PrescriptionID])
GO
----------------------------------------------------------------------------------------------------------------------
--MEDPHARMA
--PHARMAID
CREATE INDEX [INDX_PHARMAID] ON [MedPharma] ([PharmaID])
GO

--MEDID
CREATE INDEX [INDX_MedID] ON [MedPharma] ([MedID])
GO