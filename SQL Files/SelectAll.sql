Use VWModelsDB
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SelectAll
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.Model_Description, b.SubModel_Description, b.Stock, b.Price, b.SubModel_ID
	FROM CarModel a INNER JOIN SubModel b
	ON a.Model_ID = b.Model_ID
END
GO
