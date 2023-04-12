USE [Az-Ejemplo1]
GO

CREATE OR ALTER PROCEDURE [dbo].[AuthUser]
	@Username varchar(200),
	@Password varchar(200)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT * FROM [dbo].[User] as u WHERE u.Username = @Username and u.Password = @Password)
	BEGIN
		SELECT 1;
	END
	ELSE
	BEGIN
		SELECT 0;
	END
END