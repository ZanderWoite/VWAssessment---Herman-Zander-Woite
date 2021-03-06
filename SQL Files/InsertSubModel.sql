USE [VWModelsDB]
GO
/****** Object:  StoredProcedure [dbo].[InsertSubModel]    Script Date: 2021/02/23 10:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE InsertSubModel
	-- Add the parameters for the stored procedure here
	@Model_ID int,
	@SubModel_Description varchar(50),
	@Price int,
	@Stock int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert INTO SubModel (Model_ID, SubModel_Description, Price, Stock) Values(@Model_ID, @SubModel_Description, @Price, @Stock)
	END
