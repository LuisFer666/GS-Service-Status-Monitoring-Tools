CREATE OR ALTER TRIGGER dbo.ServiceChanged 
   ON  dbo.Service 
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	-- Guardar el IdBTG del Service actualizado
	DECLARE @IdBTGInserted int;
	SET @IdBTGInserted = (SELECT TOP 1 IdBTG FROM inserted)
	-- Buscar si hay algun servicio no disponible
	IF ( (SELECT COUNT(*) FROM [dbo].[Service] WHERE IdStatus != 3 and IdBTG=@IdBTGInserted) > 0)
	BEGIN
		-- Guardar el IdStatus
		DECLARE @IdStatus int;
		SET @IdStatus = (SELECT TOP 1 IdStatus FROM dbo.Service WHERE IdBTG=@IdBTGInserted and IdStatus != 3 order by IdStatus ASC);
		-- Status depende del IdStatus
		DECLARE @Status varchar(200);
		IF (@IdStatus = 1)
		BEGIN
			SET @Status = 'Disruption';
		END ELSE
		IF (@IdStatus = 2)
		BEGIN
			SET @Status = 'Warning';
		END ELSE
		IF (@IdStatus = 3)
		BEGIN
			SET @Status = 'Running';
		END
		-- Poner estado de acuerdo en Red o Ambar (Segun prioridad)
		UPDATE dbo.BTG
		SET IdStatus = @IdStatus,
			Status = @Status
		WHERE IdBTG=@IdBTGInserted
	END ELSE
	BEGIN -- Poner estado en Green
		UPDATE dbo.BTG
		SET IdStatus = 3,
			Status = 'Running'
		WHERE IdBTG=@IdBTGInserted
	END
END
GO
