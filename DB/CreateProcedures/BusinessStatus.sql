USE [Az-Ejemplo1]
GO

CREATE OR ALTER PROCEDURE [dbo].[BusinessStatus]
AS
BEGIN
	SELECT
		b.IdBTG,
		b.[Name],
		b.[Description],
		b.IdStatus,
		(SELECT s.[Name] FROM dbo.Status as s WHERE s.IdStatus = b.IdStatus) as Status
	FROM dbo.BTG as b
	ORDER BY b.IdStatus ASC
END