/****** Object:  View [dbo].[reporting_cameras]    Script Date: 21/06/2022 20:35:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[reporting_cameras]
AS
SELECT CameraTitle,StartTime,EndTime, IncidentId
FROM dbo.RepoIncidentSequence
GO


