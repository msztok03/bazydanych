
USE AdventureWorks2022;
--Zad 1
GO
CREATE PROCEDURE wygenFib
    @n INT
AS
BEGIN
    DECLARE @counter INT = 1;

    WHILE @counter <= @n
    BEGIN
        PRINT dbo.Fib1(@counter);
        SET @counter = @counter + 1;
    END
END;
GO

CREATE FUNCTION Fib1
(
    @n INT
)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;

    IF @n <= 1
        SET @result = @n;
    ELSE
        SET @result = dbo.Fib1(@n - 1) + dbo.Fib1(@n - 2);

    RETURN @result;
END;
GO
EXEC WygenFib1 @n = 12;  


--Zad 2

CREATE TRIGGER ModifyLastName
ON Person.Person
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE p
    SET LastName = UPPER(i.LastName)
    FROM Persons p
    INNER JOIN inserted i ON p.PersonID = i.PersonID;
END;


--Zad 3  
 
CREATE TRIGGER  PodWart
ON Person.Person
AFTER UPDATE
AS
BEGIN
	DECLARE @starPod DECIMAL(18, 2);
    DECLARE @nowyPod DECIMAL(18, 2);

    SELECT @starPod = Pod
    FROM deleted;

    SELECT @nowyPod = Pod
    FROM inserted;

    IF ABS(@nowyPod - @starPod) / NULLIF(@starPod, 0) > 0.3
    BEGIN
        RAISERROR ('Zmiana wartosci w polu Pod o wiecej niz 30% jest niedozwolona.', 16, 1);
        
	END;
END;