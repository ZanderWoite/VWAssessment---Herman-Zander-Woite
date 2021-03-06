USE [VWModelsDB]
GO
/****** Object:  StoredProcedure [dbo].[UpdateSubModel]    Script Date: 2021/02/23 10:27:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE UpdateSubModel
	-- Add the parameters for the stored procedure here
	@Model_ID int,
	@SubModel_Description varchar(50),
	@Price int,
	@Stock int,
	@SubModel_ID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE SubModel
	SET Model_ID = @Model_ID, SubModel_Description = @SubModel_Description, Price = @Price, Stock = @Stock
	WHERE SubModel_ID = @SubModel_ID;
	END
