USE [VWModelsDB]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCar]    Script Date: 2021/02/23 10:24:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE DeleteCar
	-- Add the parameters for the stored procedure here
	@SubModel_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DELETE FROM SubModel WHERE @SubModel_ID = SubModel_ID
	DELETE FROM Feature WHERE @SubModel_ID = SubModel_ID
END
