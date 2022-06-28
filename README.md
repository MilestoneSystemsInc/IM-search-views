# IM search views
 SQL to create SQL views in the IM database for user reporting

These scripts are provided as is and with no support from Milestone. It is likely to break between upgrades as Milestone reserves the right to change SQL schema without notice.
These scripts will be retired once we have a public API to cover reporting.

For reporting you will either have to run the

Create SQL camera view.sql and Create SQL reporting view.sql scripts to create the 2 SQL reporting views in SQL. (this is recommended)

OR 

SQL View Trigger to update reporting view.sql and Create SQL camera view.sql to create the per incident camera reporting view and a trigger that will update the reporting view with whatever field names are set within the Incident manger, this is only meant for sites where you change incident headings often such as a demo site and not for production.

If you are running the trigger script, post run you should go into the Incident manger area of the Management Client and alter any of your catagory names, save and check the system saved the data. If you have issues then you can drop the created trigger with 

USE [Surveillance_IM]
GO

DROP TRIGGER [dbo].[trgRepoGlobalSettings]
GO

All scripts presume you are using default names for the Surveillance_IM database.

