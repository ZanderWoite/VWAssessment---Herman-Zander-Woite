USE [VWModelsDB]
GO
/****** Object:  StoredProcedure [dbo].[SelectAvailableModels]    Script Date: 2021/02/23 10:26:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE SelectAvailableModels
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Model_ID, Model_Description
	FROM CarModel
END
