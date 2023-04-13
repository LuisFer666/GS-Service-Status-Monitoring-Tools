SELECT 
	s.IdService,
	s.Name,
	s.IdStatus,
	(SELECT d.Description FROM dbo.Status as d WHERE d.IdStatus = s.IdStatus) as Status 

INTO [dbo].[Research]

FROM [dbo].[Service] as s
WHERE s.IdBTG = 5