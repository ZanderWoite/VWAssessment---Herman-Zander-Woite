USE [VWModelsDB]
GO
/****** Object:  StoredProcedure [dbo].[InsertMake]    Script Date: 2021/02/23 10:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE InsertMake
	-- Add the parameters for the stored procedure here
	@Model_Description varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert INTO CarModel (Model_Description) Values(@Model_Description)
	END
