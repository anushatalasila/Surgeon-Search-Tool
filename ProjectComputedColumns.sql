-- Based on rating of a doctor : Poor,Average, Good, Excellent

CREATE FUNCTION DoctorGrade
		(@Doctor_id VARCHAR(10))
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE 
        @DocGrade VARCHAR(10),
        @Rating FLOAT
    SELECT
        @Rating = AVG(cf.DRating)
    FROM
        CustomerFeedback cf
    GROUP BY
        cf.DoctorID
    HAVING
        @Doctor_id = cf.DoctorID
    IF @Rating <= 4 SET @DocGrade = 'Poor'
    ELSE IF @Rating <= 6 SET @DocGrade = 'Average'
    ELSE IF @Rating <= 8 SET @DocGrade = 'Good'
    ELSE SET @DocGrade = 'Excellent'
    RETURN
        @DocGrade
END
GO

----------------------------------------------------------------------------------------------------------------------







