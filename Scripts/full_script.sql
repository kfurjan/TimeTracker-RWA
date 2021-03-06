USE [PRA20-Kevin-Furjan]
GO
/****** Object:  User [tcp-login]    Script Date: 7.7.2020. 11:42:23 ******/
CREATE USER [tcp-login] FOR LOGIN [tcp-login] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [tcp-login]
GO
ALTER ROLE [db_datareader] ADD MEMBER [tcp-login]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [tcp-login]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[IDClient] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[IDClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[IDEmployee] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NULL,
	[EmployeeTypeID] [int] NULL,
	[TeamID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IDEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeType]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeType](
	[IDEmployeeType] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NULL,
 CONSTRAINT [PK_EmployeeType] PRIMARY KEY CLUSTERED 
(
	[IDEmployeeType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[IDProject] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[ClientID] [int] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[IDProject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[IDTeam] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TeamLeadID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[IDTeam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamLead]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamLead](
	[IDTeamLead] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_TeamLead] PRIMARY KEY CLUSTERED 
(
	[IDTeamLead] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamsProjects]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamsProjects](
	[IDTeamsProjects] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_TeamsProjects] PRIMARY KEY CLUSTERED 
(
	[IDTeamsProjects] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[IDTimeSheet] [int] IDENTITY(1,1) NOT NULL,
	[TimeWorked] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ProjectID] [int] NOT NULL,
 CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED 
(
	[IDTimeSheet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmployeeType] FOREIGN KEY([EmployeeTypeID])
REFERENCES [dbo].[EmployeeType] ([IDEmployeeType])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmployeeType]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([IDTeam])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Team]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([IDClient])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Client]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_TeamLead] FOREIGN KEY([TeamLeadID])
REFERENCES [dbo].[TeamLead] ([IDTeamLead])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_TeamLead]
GO
ALTER TABLE [dbo].[TeamLead]  WITH CHECK ADD  CONSTRAINT [FK_TeamLead_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([IDEmployee])
GO
ALTER TABLE [dbo].[TeamLead] CHECK CONSTRAINT [FK_TeamLead_Employee]
GO
ALTER TABLE [dbo].[TeamsProjects]  WITH CHECK ADD  CONSTRAINT [FK_TeamsProjects_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([IDProject])
GO
ALTER TABLE [dbo].[TeamsProjects] CHECK CONSTRAINT [FK_TeamsProjects_Project]
GO
ALTER TABLE [dbo].[TeamsProjects]  WITH CHECK ADD  CONSTRAINT [FK_TeamsProjects_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([IDTeam])
GO
ALTER TABLE [dbo].[TeamsProjects] CHECK CONSTRAINT [FK_TeamsProjects_Team]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([IDEmployee])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Employee]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([IDProject])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Project]
GO
/****** Object:  StoredProcedure [dbo].[addTeamToExistingProject]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addTeamToExistingProject]
	@IDProject int,
	@IDTeam int
AS
BEGIN
	INSERT INTO TeamsProjects (ProjectID, TeamID) VALUES
		(@IDProject, @IDTeam)
END
GO
/****** Object:  StoredProcedure [dbo].[changeEmployeePassword]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[changeEmployeePassword]
	@IDEmployee int,
	@Password nvarchar(50)
AS
BEGIN
	UPDATE
		Employee
	SET
		Password = @Password
	WHERE
		IDEmployee = @IDEmployee
END
GO
/****** Object:  StoredProcedure [dbo].[createEmployee]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[createEmployee]
	@Firstname nvarchar(50),
	@Lastname nvarchar(50),
	@Password nvarchar(50),
	@Email nvarchar(50),
	@Phone nvarchar(50),
	@IDEmployeeType int,
	@IDTeam int
AS 
BEGIN 
	DECLARE @IDEmployee int
	INSERT INTO Employee (Firstname, Lastname, Password, Email, Phone, EmployeeTypeID, TeamID) VALUES
		(@Firstname, @Lastname, @Password, @Email, @Phone, @IDEmployeeType, @IDTeam)
	
	-- Check if Employee is Director or Team lead
	SET @IDEmployee = SCOPE_IDENTITY()
	IF @IDEmployeeType IN (1, 2)
		INSERT INTO TeamLead (EmployeeID) VALUES (@IDEmployee)

	-- Add employee to projects that are part of his team
	INSERT INTO TimeSheet (TimeWorked, EmployeeID, ProjectID)
	SELECT
		0 as [TimeWorked], @IDEmployee as [EmployeeID], p.IDProject as [ProjectID]
	FROM Team as t
	INNER JOIN TeamsProjects as tp
		ON tp.TeamID = t.IDTeam
	INNER JOIN Project as p
		on p.IDProject = tp.ProjectID
	where t.IDTeam = @IDTeam
END
GO
/****** Object:  StoredProcedure [dbo].[createProject]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[createProject]
	@ProjectName nvarchar(50),
	@Description nvarchar(50),
	@IDClient int,
	@IDTeam int
AS
BEGIN
	INSERT INTO Project (Name, Description, ClientID) VALUES
		(@ProjectName, @Description, @IDClient)

	declare @IDProject int
	set @IDProject = SCOPE_IDENTITY()

	INSERT INTO TeamsProjects (ProjectID, TeamID) VALUES
		(@IDProject, @IDTeam)
END
GO
/****** Object:  StoredProcedure [dbo].[createTeam]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[createTeam]
	@TeamName nvarchar(50),
	@IDTeamLead int
AS
BEGIN
	INSERT INTO Team (Name, TeamLeadID) VALUES
		(@TeamName, @IDTeamLead)
END
GO
/****** Object:  StoredProcedure [dbo].[getProjectsByIDEmployee]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getProjectsByIDEmployee]
	@IDEmployee int
AS
BEGIN
	SELECT DISTINCT
	p.IDProject,
	p.Name,
	p.Description,
	ts.TimeWorked
	FROM Employee as e
	INNER JOIN Team as t
		ON t.IDTeam = e.TeamID
	INNER JOIN TeamsProjects as tp
		ON tp.TeamID = t.IDTeam
	INNER JOIN Project as p
		ON p.IDProject = tp.ProjectID
	INNER JOIN TimeSheet as ts
		on ts.ProjectID = p.IDProject
	INNER JOIN Employee
		on e.IDEmployee = ts.EmployeeID
	WHERE e.IDEmployee = @IDEmployee
END
GO
/****** Object:  StoredProcedure [dbo].[getProjectsTimeByIDClient]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getProjectsTimeByIDClient]
	@IDClient int
AS
BEGIN
	SELECT 
	c.Name as [Client],
	p.Name as [Project],
	SUM(ts.TimeWorked) as [Time]
	FROM Client as c
	INNER JOIN Project as p
		ON p.ClientID = c.IDClient
	INNER JOIN TimeSheet as ts
		ON ts.ProjectID = p.IDProject
	WHERE c.IDClient = @IDClient
	GROUP BY c.Name, p.Name
END
GO
/****** Object:  StoredProcedure [dbo].[insertClient]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[insertClient]
	@clientName nvarchar(50),
	@clientEmail nvarchar(50)
AS 
BEGIN 
	INSERT INTO Client (Name, Email) VALUES
		(@clientName, @clientEmail)
END
GO
/****** Object:  StoredProcedure [dbo].[selectAllEmployees]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[selectAllEmployees]
AS 
BEGIN 
	SELECT 
		e.*,
		e.Firstname + ' ' + e.Lastname as FullName
	FROM Employee as e
	where e.IsDeleted is null
END
GO
/****** Object:  StoredProcedure [dbo].[selectClients]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[selectClients]
AS 
BEGIN 
	SELECT 
		IDClient,
		Name,
		Email
	FROM Client
END
GO
/****** Object:  StoredProcedure [dbo].[selectEmployee]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[selectEmployee]
	@IDEmployee int
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Employee
	WHERE 
		IDEmployee = @IDEmployee
END
GO
/****** Object:  StoredProcedure [dbo].[selectEmployeeByEmail]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[selectEmployeeByEmail]
	@Email nvarchar(50)
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Employee
	WHERE 
		Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[selectEmployeeEmail]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[selectEmployeeEmail]
	@Email nvarchar(50)
AS
BEGIN
	SELECT 
		* 
	FROM 
		Employee
	WHERE 
		Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[selectEmployeeLogin]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[selectEmployeeLogin]
	@Email nvarchar(50),
	@Password nvarchar(50)
AS 
BEGIN 
	SELECT 
		* 
	FROM 
		Employee
	WHERE 
		Email = @Email AND
		Password = @Password
END
GO
/****** Object:  StoredProcedure [dbo].[selectEmployees]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* EMPLOYEE TABLE */
-- procedues for EMPLOYEE
CREATE PROCEDURE [dbo].[selectEmployees]
AS 
BEGIN 
	SELECT 
		e.IDEmployee as ID,
		e.Firstname as [First name],
		e.Lastname as [Last name],
		e.Email,
		e.Phone,
		et.Name as [Employee type],
		et.IDEmployeeType as [IDEmployeeType],
		t.Name as [Team name],
		t.IDTeam as [IDTeam]
	FROM Employee as e
	INNER JOIN EmployeeType as et
		ON et.IDEmployeeType = e.EmployeeTypeID
	INNER JOIN Team as t
		ON t.IDTeam = e.TeamID
	where e.IsDeleted is null
END
GO
/****** Object:  StoredProcedure [dbo].[selectEmployeeTypes]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* EmployeeType TABLE */
-- procedues for EmployeeType

CREATE PROCEDURE [dbo].[selectEmployeeTypes]
AS 
BEGIN 
	SELECT
		IDEmployeeType as [ID],
		Name
	FROM
		EmployeeType
END
GO
/****** Object:  StoredProcedure [dbo].[selectProjects]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[selectProjects]
AS 
BEGIN 
	SELECT
		p.IDProject as [IDProject],
		p.Name as [Project name],
		p.Description,
		c.Name as [Client name],
		t.Name as [Team name],
		t.IDTeam as [IDTeam]
	FROM Project as p
	INNER JOIN TeamsProjects as tp
		ON tp.ProjectID = p.IDProject
	INNER JOIN Team as t
		ON tp.TeamID = t.IDTeam
	INNER JOIN Client as c
		ON c.IDClient = p.ClientID
	WHERE 
		tp.IsDeleted is null
END
GO
/****** Object:  StoredProcedure [dbo].[selectTeamLeads]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* TEAMLEAD TABLE */
-- procedues for TEAMLEAD
CREATE PROCEDURE [dbo].[selectTeamLeads]
AS 
BEGIN 
	SELECT DISTINCT
		tl.IDTeamLead as IdTeamLead,
		e.Firstname + ' ' + e.Lastname as Name
	FROM TeamLead as tl
	INNER JOIN Employee as e
		ON tl.EmployeeID = e.IDEmployee
	WHERE e.IsDeleted is null
END
GO
/****** Object:  StoredProcedure [dbo].[selectTeams]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* TEAM TABLE */
-- procedues for TEAM
CREATE PROCEDURE [dbo].[selectTeams]
AS 
BEGIN 
	SELECT
		t.IDTeam as [ID],
		t.Name,
		e.Firstname + ' ' + e.Lastname as [Team lead],
		tl.IDTeamLead
	FROM Team as t
	INNER JOIN TeamLead as tl
		ON t.TeamLeadID = tl.IDTeamLead
	INNER JOIN Employee as e
		ON e.IDEmployee = tl.EmployeeID
	WHERE t.IsDeleted is null
END
GO
/****** Object:  StoredProcedure [dbo].[softDeleteEmployee]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[softDeleteEmployee]
	@IDEmployee int
AS
BEGIN
	UPDATE
		Employee
	SET
		IsDeleted = 1
	WHERE
		IDEmployee = @IDEmployee
END
GO
/****** Object:  StoredProcedure [dbo].[softDeleteProject]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[softDeleteProject]
	@IDProject int,
	@IDTeam int
AS 
BEGIN 
	UPDATE 
		TeamsProjects 
	SET 
		IsDeleted = 1
	WHERE 
		TeamID = @IDTeam AND
		ProjectID = @IDProject
END
GO
/****** Object:  StoredProcedure [dbo].[softDeleteTeam]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[softDeleteTeam]
	@IDTeam int
AS 
BEGIN 
	UPDATE Team SET IsDeleted = 1 
		WHERE IDTeam = @IDTeam
END
GO
/****** Object:  StoredProcedure [dbo].[updateEmployee]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateEmployee]
	@IDEmployee int,
	@Firstname nvarchar(50),
	@Lastname nvarchar(50),
	@Email nvarchar(50),
	@Phone nvarchar(50),
	@IDEmployeeType int,
	@IDTeam int
AS 
BEGIN  
	UPDATE
		Employee
	SET
		Firstname = @Firstname,
		Lastname = @Lastname,
		Email = @Email,
		Phone = @Phone,
		EmployeeTypeID = @IDEmployeeType,
		TeamID = @IDTeam
	WHERE
		IDEmployee = @IDEmployee

	IF @IDEmployeeType IN (1, 2)
		INSERT INTO TeamLead (EmployeeID) VALUES (@IDEmployee)

	-- Add employee to projects that are part of his team
	INSERT INTO TimeSheet (TimeWorked, EmployeeID, ProjectID)
	SELECT
		0 as [TimeWorked], @IDEmployee as [EmployeeID], p.IDProject as [ProjectID]
	FROM Team as t
	INNER JOIN TeamsProjects as tp
		ON tp.TeamID = t.IDTeam
	INNER JOIN Project as p
		on p.IDProject = tp.ProjectID
	where t.IDTeam = @IDTeam
END
GO
/****** Object:  StoredProcedure [dbo].[updateProject]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateProject]
	@IDProject int,
	@OldIdTeam int,
	@ProjectName nvarchar(50),
	@Description nvarchar(50),
	@IDClient int,
	@NewIDTeam int
AS 
BEGIN 
	UPDATE 
		Project
	SET 
		Name = @ProjectName,
		Description = @Description,
		ClientID = @IDClient
	WHERE 
		IDProject = @IDProject

	UPDATE
		TeamsProjects
	SET
		TeamID = @NewIDTeam
	WHERE
		ProjectID = @IDProject AND
		TeamID = @OldIdTeam
END
GO
/****** Object:  StoredProcedure [dbo].[updateTeam]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateTeam]
	@IDTeam int,
	@TeamName nvarchar(50),
	@IDTeamLead int
AS
BEGIN
	UPDATE Team SET 
		Name = @TeamName,
		TeamLeadID = @IDTeamLead
	WHERE IDTeam = @IDTeam
END
GO
/****** Object:  StoredProcedure [dbo].[updateTimeWorkedByIDEmployee]    Script Date: 7.7.2020. 11:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateTimeWorkedByIDEmployee]
	@IDEmployee int,
	@IDProject int,
	@TimeWorked int
AS
BEGIN
	UPDATE
		TimeSheet
	SET
		TimeWorked = @TimeWorked
	WHERE
		EmployeeID = @IDEmployee AND
		ProjectID = @IDProject
END
GO
