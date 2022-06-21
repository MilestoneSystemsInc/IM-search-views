
/****** Object:  Trigger [dbo].[trgRepoGlobalSettings]    Script Date: 21/06/2022 20:31:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================

-- Author:           Jubu - Justin Butterworth

-- Create date: 15/05/2020

-- Description:      Trigger to update reporting view when the column names are altered.

-- =============================================

CREATE  OR ALTER TRIGGER [dbo].[trgRepoGlobalSettings]

   ON  [dbo].[RepoGlobalSettings]

   AFTER  INSERT,DELETE,UPDATE

AS

BEGIN

    declare @ExtDropdown1 nvarchar(MAX);

       declare @ExtDropdown2 nvarchar(MAX);

       declare @ExtDropdown3 nvarchar(MAX);

       declare @ExtDropdown4 nvarchar(MAX);

       declare @ExtDropdown5 nvarchar(MAX);

       declare @ExtDropdown6 nvarchar(MAX);

  declare @ExtLong1 nvarchar(MAX);

  declare @ExtLong2 nvarchar(MAX);

  declare @ExtLong3 nvarchar(MAX);

  declare @ExtPropString1 nvarchar(MAX);

  declare @ExtPropString2 nvarchar(MAX);

  declare @ExtPropString3 nvarchar(MAX);

  declare @ExtPropBool1 nvarchar(MAX);

  declare @ExtPropBool2 nvarchar(MAX);

  declare @ExtPropBool3 nvarchar(MAX);

  declare @ExtPropdec1 nvarchar(MAX);

  declare @ExtPropdec2 nvarchar(MAX);

  declare @ExtPropdec3 nvarchar(MAX);

  declare @ExtPropdatetime1 nvarchar(MAX);

  declare @ExtPropdatetime2 nvarchar(MAX);

  declare @ExtPropdatetime3 nvarchar(MAX);


SELECT top 1

@ExtDropdown1=JSON_value(valueJSON, '$.DropDownProp1.Title'),

@ExtDropdown2=JSON_value(valueJSON, '$.DropDownProp2.Title'),

@ExtDropdown3=JSON_value(valueJSON, '$.DropDownProp3.Title'),

@ExtDropdown4=JSON_value(valueJSON, '$.DropDownProp4.Title'),

@ExtDropdown5=JSON_value(valueJSON, '$.DropDownProp5.Title'),

@ExtLong1=JSON_value(valueJSON, '$.Prop_Long1.Title'),

@ExtLong2=JSON_value(valueJSON, '$.Prop_Long2.Title'),

@ExtLong3=JSON_value(valueJSON, '$.Prop_Long3.Title'),

@ExtPropString1=JSON_value(valueJSON, '$.Prop_String1.Title'),

@ExtPropString2=JSON_value(valueJSON, '$.Prop_String2.Title'),

@ExtPropString3=JSON_value(valueJSON, '$.Prop_String3.Title'),

@ExtPropBool1=JSON_value(valueJSON, '$.Prop_Bool1.Title'),

@ExtPropBool2=JSON_value(valueJSON, '$.Prop_Bool2.Title'),

@ExtPropBool3=JSON_value(valueJSON, '$.Prop_Bool3.Title'),

@ExtPropdec1=JSON_value(valueJSON, '$.Prop_Decimal1.Title'),

@ExtPropdec2=JSON_value(valueJSON, '$.Prop_Decimal2.Title'),

@ExtPropdec3=JSON_value(valueJSON, '$.Prop_Decimal3.Title'),

@ExtPropdatetime1=JSON_value(valueJSON, '$.Prop_DateTime1.Title'),

@ExtPropdatetime2=JSON_value(valueJSON, '$.Prop_DateTime2.Title'),

@ExtPropdatetime3=JSON_value(valueJSON, '$.Prop_DateTime3.Title')

  FROM [dbo].[RepoGlobalSettings]

  where GlobalSettingsIndentificator='{incidentManager-incident-extendedInformationConfiguration}'


 

  declare @SQLEXEC nvarchar(MAX);

  set @SQLEXEC = 'create or alter view Reporting as SELECT I.[Id] as "Incident ID"

      ,I.Description as Description

      ,I.CreatedUserName as "created by"

      ,I.[TypeStr] as "Classification"

      ,I.TimeCreated as "Date of Incident"

        ,D.Title as ''' +@ExtDropdown1 + '''

        ,D2.Title as ''' +@ExtDropdown2 + '''

        ,D3.Title as ''' +@ExtDropdown3 + '''

        ,D4.Title as ''' +@ExtDropdown4 + '''

        ,D5.Title as''' +@ExtDropdown5 + '''   

              ,I.ExtPropLong1 as ''' +@ExtLong1 + '''

              ,I.ExtPropLong2 as ''' +@ExtLong2 + '''

        ,I.ExtPropLong3 as ''' +@ExtLong3 + '''

        ,i.ExtPropBool1 as ''' +@ExtPropBool1 + '''

              ,I.ExtPropBool2 as ''' +@ExtPropBool2 + '''

              ,I.ExtPropBool3 as ''' +@ExtPropBool3 + '''

              ,I.ExtPropDateTime1 as ''' + @ExtPropdatetime1 + '''

              ,I.ExtPropDateTime2 as ''' + @ExtPropdatetime2 + '''

              ,I.ExtPropDateTime3 as ''' + @ExtPropdatetime3 + '''

              ,I.ExtPropDecimal1 as ''' + @ExtPropdec1 + '''

              ,I.ExtPropDecimal2 as ''' + @ExtPropdec2 + '''

              ,I.ExtPropDecimal3 as ''' + @ExtPropdec3 + '''

              ,I.ExtPropString1 as ''' +@ExtPropString1 + '''

        ,I.ExtPropString2 as ''' +@ExtPropString2 + '''

        ,I.ExtPropString3  as ''' +@ExtPropString3 + '''

  FROM [dbo].[RepoIncident] as I

LEFT JOIN [dbo].[RepoDynamicalDataTypesAndOptions] as D

    ON D.Id=I.Category1Id

    LEFT JOIN [dbo].[RepoDynamicalDataTypesAndOptions] as D2

    ON D2.Id=I.Category2Id

        LEFT JOIN [dbo].[RepoDynamicalDataTypesAndOptions] as D3

    ON D3.Id=I.Category3Id

        LEFT JOIN [dbo].[RepoDynamicalDataTypesAndOptions] as D4

    ON D4.Id=I.Category4Id

        LEFT JOIN [dbo].[RepoDynamicalDataTypesAndOptions] as D5

    ON D5.Id=I.Category5Id;'


       exec(@SQLEXEC);


END
GO

ALTER TABLE [dbo].[RepoGlobalSettings] ENABLE TRIGGER [trgRepoGlobalSettings]
GO


