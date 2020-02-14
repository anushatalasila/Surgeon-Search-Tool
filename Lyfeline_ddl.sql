CREATE DATABASE Lyfeline
go
USE Lyfeline
GO


CREATE TABLE [User]
(
 [UserID] varchar(10) NOT NULL,
 [FName] Varchar(40) NULL,
 [LName] Varchar(40) NULL,
 [Password] Varchar(10) NULL,
 [DOB] Date NULL,
 [Gender] Varchar(10) NULL,
 [PhoneNumber] Int NULL,
 [Address] Varbinary(30) NULL,
 [City] Varbinary(30) NULL,
 [State] Varchar(30) NULL,
 [Zip] Int NULL
)
go
ALTER TABLE [User] ADD CONSTRAINT [PK_User] PRIMARY KEY ([UserID])
go


CREATE TABLE [Doctor]
(
 [DoctorID] varchar(10) NOT NULL,
 [DFName] Varchar(40) NULL,
 [DLName] Varchar(40) NULL,
 [DSpecialization] Varchar(50) NULL,
 [HealthCareID] varchar(10) NULL
)
CREATE INDEX [IX_Relationship4] ON [Doctor] ([HealthCareID])
ALTER TABLE [Doctor] ADD CONSTRAINT [PK_Doctor] PRIMARY KEY ([DoctorID])
--ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [foreign_HealthCare] FOREIGN KEY([HealthCareID])
--REFERENCES [dbo].[HealthCareUnit] ([HealthCareID])


CREATE TABLE [CustomerFeedback]
(
 [DoctorID] varchar(10) NOT NULL,
 [UserID] varchar(10) NOT NULL,
 [DRating] Float NULL,
 [DReview] Varchar(max) NULL
)
go

ALTER TABLE [CustomerFeedback] ADD CONSTRAINT [PK_CustomerFeedback] PRIMARY KEY ([DoctorID],[UserID])

CREATE TABLE [HealthCareUnit]
(
 [HealthCareID] varchar(10) NOT NULL,
 [HAddress] Varchar(max) NULL,
 [HCity] Varchar(20) NULL,
 [HState] Varchar(20) NULL,
 [HZip] Int NULL,
 [HealthCareType] Char(20) NULL
)

ALTER TABLE [HealthCareUnit] ADD CONSTRAINT [PK_HealthCareUnit] PRIMARY KEY ([HealthCareID])
go

CREATE TABLE [Insurance]
(
 [InsuranceID] varchar(30) NOT NULL,
 [InsuranceType] Varchar(40) NULL
)
go

-- Add keys for table Insurance

ALTER TABLE [Insurance] ADD CONSTRAINT [PK_Insurance] PRIMARY KEY ([InsuranceID])
go

CREATE TABLE [AcceptedInsurance]
(
 [HealthCareID] varchar(10) NOT NULL,
 [InsuranceID] varchar(30) NOT NULL,
 [InsuranceProvider] Varchar(30) NULL
)
go

-- Add keys for table AcceptedInsurance

ALTER TABLE [AcceptedInsurance] ADD CONSTRAINT [PK_AcceptedInsurance] PRIMARY KEY ([HealthCareID],[InsuranceID])
go

CREATE TABLE [Visit]
(
 [VisitID] varchar(10) NOT NULL,
 [Time] Time NULL,
 [Date] Date NULL,
 [PaymentType] Varchar(10) NULL,
 [PaymentAmount] Float NULL,
 [DoctorID] varchar(10) NULL,
 [UserID] varchar(10) NULL,
 [DiagnosisID] varchar(10) NULL,
 [VisitStatus] Varchar(20) NULL
)
go

-- Create indexes for table Visit

CREATE INDEX [IX_Relationship8] ON [Visit] ([DoctorID])
go

CREATE INDEX [IX_Relationship12] ON [Visit] ([UserID])
go

CREATE INDEX [IX_Relationship19] ON [Visit] ([DiagnosisID])
go




-- Add keys for table Visit

ALTER TABLE [Visit] ADD CONSTRAINT [PK_Visit] PRIMARY KEY ([VisitID])
go

CREATE TABLE [DiagnosticCenter]
(
 [DcAddress] Varchar(40) NULL,
 [DcCity] Varchar(40) NULL,
 [DcState] Varchar(40) NULL,
 [DcZip] Int NULL,
 [Services] Varchar(40) NULL,
 [DiagnosisID] varchar(10) NOT NULL
)

ALTER TABLE [DiagnosticCenter] ADD CONSTRAINT [PK_Diagnosis] primary key (DiagnosisID)

CREATE TABLE [DiagnosticReport]
(
 [VisitID] Varchar(10),
 [DiagnosisID] varchar(10),
 [ReportDescription] varchar(100),
 CONSTRAINT [PK_DiagReport] primary key (VisitID, DiagnosisID),
 CONSTRAINT [FK_DiagReport1] foreign key (VisitID) references Visit(VisitID),
 Constraint [FK_DiagReport2] foreign key (DiagnosisID) references DiagnosticCenter(DiagnosisID)
)


CREATE TABLE [Pharmacy]
(
 [PharmaID] varchar(10) NOT NULL,
 [PAddress] Varchar(40) NULL,
 [PCity] Varchar(30) NULL,
 [PState] Varchar(40) NULL,
 [PZip] Int NULL,
 [PPhoneNumber] Int NULL,
 [PharmacyName] Varchar(40) NULL
)
go

-- Add keys for table Pharmacy

ALTER TABLE [Pharmacy] ADD CONSTRAINT [PK_Pharmacy] PRIMARY KEY ([PharmaID])

go

-- Add keys for table DiagnosticCenter

CREATE TABLE [UserInsurance]
(
 [UserID] varchar(10) NOT NULL,
 [InsuranceID] varchar(30) NOT NULL
)
go

-- Add keys for table UserInsurance

ALTER TABLE [UserInsurance] ADD CONSTRAINT [PK_UserInsurance] PRIMARY KEY ([UserID],[InsuranceID])
go

CREATE TABLE [Prescription]
(
 [PrescriptionID] varchar(10) NOT NULL,
 [VisitID] varchar(10) NOT NULL
)
go

ALTER TABLE [Prescription] ADD CONSTRAINT [FK_Prescription] FOREIGN KEY ([VisitID]) REFERENCES [Visit] ([VisitID]) ON UPDATE cascade ON DELETE cascade


-- Create indexes for table Prescription

CREATE INDEX [IX_Relationship21] ON [Prescription] ([VisitID])
go

-- Add keys for table Prescription

CREATE TABLE [Medicine]
(
 [MedId] Varchar(10) NOT NULL,
 [MedName] Varbinary(max) NULL
)
go

-- Add keys for table Medicine

ALTER TABLE [Medicine] ADD CONSTRAINT [PK_Medicine] PRIMARY KEY ([MedId])
go


-- Table PresMedList

CREATE TABLE [PresMedList]
(
 [MedId] Varchar(10) NOT NULL,
 [PrescriptionID] varchar(10) NOT NULL
)
go

-- Add keys for table PresMedList

ALTER TABLE [PresMedList] ADD CONSTRAINT [PK_PresMedList] PRIMARY KEY ([MedId],[PrescriptionID])
go

-- Table MedPharma

CREATE TABLE [MedPharma]
(
 [PharmaID] varchar(10) NOT NULL,
 [MedId] Varchar(10) NOT NULL
)
go

-- Add keys for table MedPharma

ALTER TABLE [MedPharma] ADD CONSTRAINT [PK_MedPharma] PRIMARY KEY ([PharmaID],[MedId])


ALTER TABLE [Prescription] ADD CONSTRAINT [PK_Prescription] PRIMARY KEY ([PrescriptionID])

ALTER TABLE [Visit] ADD CONSTRAINT [FK_Diagnosis] FOREIGN KEY ([DiagnosisID]) REFERENCES [DiagnosticCenter] ([DiagnosisID]) ON UPDATE cascade ON DELETE cascade

ALTER TABLE [CustomerFeedback] ADD CONSTRAINT [Given to] FOREIGN KEY ([DoctorID]) REFERENCES [Doctor] ([DoctorID]) ON UPDATE cascade ON DELETE cascade
go

ALTER TABLE [CustomerFeedback] ADD CONSTRAINT [Writes] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE cascade ON DELETE cascade
go



ALTER TABLE [Doctor] ADD CONSTRAINT [contains] FOREIGN KEY ([HealthCareID]) REFERENCES [HealthCareUnit] ([HealthCareID]) ON UPDATE cascade ON DELETE cascade
go



ALTER TABLE [AcceptedInsurance] ADD CONSTRAINT [Is compatible] FOREIGN KEY ([HealthCareID]) REFERENCES [HealthCareUnit] ([HealthCareID]) ON UPDATE cascade ON DELETE cascade
go



ALTER TABLE [AcceptedInsurance] ADD CONSTRAINT [is associated with] FOREIGN KEY ([InsuranceID]) REFERENCES [Insurance] ([InsuranceID]) ON UPDATE cascade ON DELETE cascade
go



ALTER TABLE [Visit] ADD CONSTRAINT [Consults] FOREIGN KEY ([DoctorID]) REFERENCES [Doctor] ([DoctorID]) ON UPDATE cascade ON DELETE cascade
go



ALTER TABLE [Visit] ADD CONSTRAINT [Schedules] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE cascade ON DELETE cascade
go



ALTER TABLE [UserInsurance] ADD CONSTRAINT [Has] FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID]) ON UPDATE cascade ON DELETE cascade
go



ALTER TABLE [UserInsurance] ADD CONSTRAINT [UserInsuranceKey] FOREIGN KEY ([InsuranceID]) REFERENCES [Insurance] ([InsuranceID]) ON UPDATE cascade ON DELETE cascade
go

ALTER TABLE AcceptedInsurance drop column InsuranceProvider
ALTER TABLE Insurance add InsuranceProvider varchar(30)
