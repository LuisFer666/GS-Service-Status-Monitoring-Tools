USE [Az-Ejemplo1]
GO

CREATE OR ALTER PROCEDURE [dbo].[ServicesStatus]
	@IdBTG int
AS
BEGIN
	SELECT
		s.IdService,
		s.[Name],
		s.IdStatus,
		(SELECT st.[Name] FROM dbo.Status as st WHERE s.IdStatus = st.IdStatus) as Status
	FROM dbo.Service as s
	WHERE s.IdBTG = @IdBTG
	ORDER BY s.IdStatus ASC
END