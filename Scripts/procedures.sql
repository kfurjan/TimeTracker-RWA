USE [PRA20-Kevin-Furjan]
GO

-- inserting initial data
INSERT INTO EmployeeType (Name) VALUES
	('Director'),
	('Team lead'),
	('Employee'),
	('Contract'),
	('Student')
GO

INSERT INTO Employee (Firstname, Lastname, Password, Email, Phone, EmployeeTypeID, TeamID) VALUES
	('Ivan', 'Director', 'test', 'director@mail.com', '123-456-789', 1, null)
GO

INSERT INTO TeamLead (EmployeeID) VALUES (1)
INSERT INTO Team (Name, TeamLeadID) VALUES
	('TestTeam', 1)
GO

UPDATE Employee SET TeamID = 1 WHERE IDEmployee = 1
GO

INSERT INTO Employee (Firstname, Lastname, Password, Email, Phone, EmployeeTypeID, TeamID) VALUES
	('Marko', 'Employee', 'test', 'employee@mail.com', '123-456-789', 3, 1)
GO

INSERT INTO Employee (Firstname, Lastname, Password, Email, Phone, EmployeeTypeID, TeamID) VALUES
	('Ana', 'TeamLead', 'test', 'teamlead@mail.com', '789-456-123', 2, null)
GO

INSERT INTO TeamLead (EmployeeID) VALUES (3)
INSERT INTO Team (Name, TeamLeadID) VALUES
	('AnotherTestTeam', 2),
	('Tim Bube Ingenii', 1),
	('Tim CeliCni Ingenii', 2),
	('Tim Dijamantni Ingenii', 2),
	('Tim Duh Ingenii', 2),
	('Tim Električni Ingenii', 1),
	('Tim Kameni Ingenii', 2),
	('Tim Ledeni Ingenii', 2),
	('Tim Legendarni Ingenii', 2),
	('Tim Leteći Ingenii', 2),
	('Tim Mračni Ingenii', 2),
	('Tim Normalni Ingenii', 2),
	('Tim Otrovni Ingenii', 1),
	('Tim Početni Ingenii', 1),
	('Tim Završni Ingenii', 1),
	('Tim Travnati Ingenii', 2),
	('Tim Vatreni Ingenii', 2),
	('Tim Vodeni Ingenii', 1),
	('Tim Zemljani Ingenii', 2),
	('Tim Zmaj Ingenii', 2),
	('Tim Svemir Ingenii', 1)
GO

UPDATE Employee SET TeamID = 2 WHERE IDEmployee = 3
GO

/* EMPLOYEE TABLE */
-- procedues for EMPLOYEE
CREATE PROCEDURE selectEmployees
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

CREATE PROCEDURE selectAllEmployees
AS 
BEGIN 
	SELECT 
		e.*,
		e.Firstname + ' ' + e.Lastname as FullName
	FROM Employee as e
	where e.IsDeleted is null
END
GO

CREATE PROCEDURE selectEmployee
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

CREATE PROCEDURE selectEmployeeByEmail
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

CREATE PROCEDURE selectEmployeeEmail
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

CREATE PROCEDURE selectEmployeeLogin
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

CREATE PROCEDURE createEmployee
	@Firstname nvarchar(50),
	@Lastname nvarchar(50),
	@Password nvarchar(50),
	@Email nvarchar(50),
	@Phone nvarchar(50),
	@IDEmployeeType int,
	@IDTeam int
AS 
BEGIN 
	INSERT INTO Employee (Firstname, Lastname, Password, Email, Phone, EmployeeTypeID, TeamID) VALUES
		(@Firstname, @Lastname, @Password, @Email, @Phone, @IDEmployeeType, @IDTeam)
	
	-- Check if Employee is Director or Team lead
	DECLARE @IDEmployee int
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

CREATE PROCEDURE updateEmployee
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

CREATE PROCEDURE softDeleteEmployee
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

CREATE PROCEDURE changeEmployeePassword
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

/* EmployeeType TABLE */
-- procedues for EmployeeType

CREATE PROCEDURE selectEmployeeTypes
AS 
BEGIN 
	SELECT
		IDEmployeeType as [ID],
		Name
	FROM
		EmployeeType
END
GO

/* TEAM TABLE */
-- procedues for TEAM
CREATE PROCEDURE selectTeams
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

CREATE PROCEDURE softDeleteTeam
	@IDTeam int
AS 
BEGIN 
	UPDATE Team SET IsDeleted = 1 
		WHERE IDTeam = @IDTeam
END
GO

CREATE PROCEDURE updateTeam
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

CREATE PROCEDURE createTeam
	@TeamName nvarchar(50),
	@IDTeamLead int
AS
BEGIN
	INSERT INTO Team (Name, TeamLeadID) VALUES
		(@TeamName, @IDTeamLead)
END
GO

/* TEAMLEAD TABLE */
-- procedues for TEAMLEAD
CREATE PROCEDURE selectTeamLeads
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

/* CLIENT TABLE */
-- procedues and data inserting for CLIENT
INSERT INTO Client (Name, Email) VALUES
	('Algebra', 'algebra@mail.com'),
	('FakeCompany', 'fake.company@mail.com'),
	('Google', 'google@mail.com')
GO

CREATE PROCEDURE selectClients
AS 
BEGIN 
	SELECT 
		IDClient,
		Name,
		Email
	FROM Client
END
GO

CREATE PROCEDURE insertClient
	@clientName nvarchar(50),
	@clientEmail nvarchar(50)
AS 
BEGIN 
	INSERT INTO Client (Name, Email) VALUES
		(@clientName, @clientEmail)
END
GO

/* PROJECT TABLE */
-- procedues and data inserting for PROJECT
INSERT INTO Project (Name, Description, ClientID) VALUES
	('Godišnji odmor', 'Godišji odmor djelatnika', null),
	('Bolovanje', 'Bolovanje djelatnika', null),
	('Poslovno putovanje', 'Putovanje djelatnika', null),
	('Pauza', 'Pauza djelatnika', null),
	('RWA-PRA-TimeTracker', 'Projekt za RWA i PRA kolegije', 1),
	('Fake project', 'Lazni projekt', 2),
	('Google', 'Improvments to Google search engine', 3)
GO

INSERT INTO TeamsProjects (TeamID, ProjectID) VALUES (1, 5), (1, 6), (2, 7), (1, 7)
GO

CREATE PROCEDURE selectProjects
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

CREATE PROCEDURE softDeleteProject
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

CREATE PROCEDURE updateProject
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

CREATE PROCEDURE createProject
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

CREATE PROCEDURE addTeamToExistingProject
	@IDProject int,
	@IDTeam int
AS
BEGIN
	INSERT INTO TeamsProjects (ProjectID, TeamID) VALUES
		(@IDProject, @IDTeam)
END
GO

CREATE PROCEDURE getProjectsByIDEmployee
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

CREATE PROCEDURE updateTimeWorkedByIDEmployee
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

INSERT INTO TimeSheet (TimeWorked, EmployeeID, ProjectID) VALUES
	(10, 1, 5),
	(20, 1, 6),
	(80, 1, 7),
	(5, 2, 5),
	(5, 2, 6),
	(15, 2, 7)
GO

CREATE PROCEDURE getProjectsTimeByIDClient
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

CREATE PROCEDURE getIdTeamLead
	@IDEmployee int
AS
BEGIN
	SELECT 
		t.IDTeamLead
	FROM Employee as e
	INNER JOIN TeamLead as t
		ON t.EmployeeID = e.IDEmployee
	WHERE e.IDEmployee = @IDEmployee
END
GO

CREATE PROCEDURE getAllEmployeesByIdTeamLead
	@IDTeamLean int
AS
BEGIN
	SELECT DISTINCT
	e.Firstname + ' ' + e.Lastname as Fullname,
	p.Name as Project,
	t.Name as Team,
	ts.TimeWorked
	FROM Team as t
	INNER JOIN TeamsProjects as tp
		on tp.TeamID = t.IDTeam
	INNER JOIN Project as p
		on p.IDProject = tp.ProjectID
	INNER JOIN TimeSheet as ts
		on ts.ProjectID = p.IDProject
	INNER JOIN Employee as e
		on e.IDEmployee = ts.EmployeeID
	WHERE t.TeamLeadID = @IDTeamLean
	ORDER BY Fullname
END
GO

exec getAllEmployeesByIdTeamLead 4