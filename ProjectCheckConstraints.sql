--Pharmacy table check for STATE

ALTER TABLE Pharmacy ADD
CONSTRAINT Pharma_CHK CHECK
   	 ( PsState IN ('Alaska', 'Arizona', 'Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia', 'Florida',
	 'Georgia','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan',
	 'Minnesota','Mississippi','Missouri', 'Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina',
	 'North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas',
	 'Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming'))
GO

------------------------------------------------------------------------------------------------------------------------------------------------

--DiagnosticCenter check for STATE

ALTER TABLE DiagnosticCenter ADD
CONSTRAINT DCState_CHK CHECK
   	 ( DcState IN ('Alaska', 'Arizona', 'Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia', 'Florida',
	 'Georgia','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan',
	 'Minnesota','Mississippi','Missouri', 'Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina',
	 'North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas',
	 'Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming'))
GO

-----------------------------------------------------------------------------------------------------------------------------------------------

--HealthCareUnit check for STATE

ALTER TABLE HealthCareUnit ADD
CONSTRAINT HCState_CHK CHECK
   	 ( HState IN ('Alaska', 'Arizona', 'Arkansas','California','Colorado','Connecticut','Delaware','District of Columbia', 'Florida',
	 'Georgia','Hawaii','Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana','Maine','Maryland','Massachusetts','Michigan',
	 'Minnesota','Mississippi','Missouri', 'Montana','Nebraska','Nevada','New Hampshire','New Jersey','New Mexico','New York','North Carolina',
	 'North Dakota','Ohio','Oklahoma','Oregon','Pennsylvania','Puerto Rico','Rhode Island','South Carolina','South Dakota','Tennessee','Texas',
	 'Utah','Vermont','Virginia','Washington','West Virginia','Wisconsin','Wyoming'))
GO


