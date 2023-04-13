/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [IdBTG]
      ,[Name]
      ,[Description]
  FROM [dbo].[BTG];

  DELETE FROM dbo.BTG;

  DBCC CHECKIDENT ('BTG', RESEED, 1);

  SELECT TOP (1000) [IdBTG]
      ,[Name]
      ,[Description]
  FROM [dbo].[BTG]