-- =============================================

-- Author:           Jub - Justin Butterworth

-- Create date: 27/06/2022

-- Description: Create a reporting view tying together incidents and their associated cameras.
-- Important - This view is not dynamic and is just to read data. This script is provided as-is and not supported via Milestone. This script may fail to work between Milestone upgrades as Milestone reserves the right to alter the Database schema without warning.

-- =============================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[reporting_cameras]
AS
SELECT CameraTitle,StartTime,EndTime, IncidentId
FROM dbo.RepoIncidentSequence
GO


