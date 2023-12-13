/*                                   Gaurav Meena    
                        Coding Challenges: CareerHub, The Job Board              
*/

--1 Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”. 
create database CareerHub;
use CareerHub;

--2. Create tables for Companies, Jobs, Applicants and Applications. 
-- Create Companies table
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Location VARCHAR(255)
);

-- Create Jobs table
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255),
    JobDescription TEXT,
    JobLocation VARCHAR(255),
    Salary DECIMAL,
    JobType VARCHAR(255),
    PostedDate DATETIME,
);

-- Create Applicants table
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Resume TEXT
);

-- Create Applications table
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter TEXT,
);

--3. Define appropriate primary keys, foreign keys, and constraints. 

-- Add foreign key to Jobs table
ALTER TABLE Jobs
ADD CONSTRAINT FK_Jobs_Companies FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID);

-- Add foreign key to Applications table referencing Jobs table
ALTER TABLE Applications
ADD CONSTRAINT FK_Applications_Jobs FOREIGN KEY (JobID) REFERENCES Jobs(JobID);

-- Add foreign key to Applications table referencing Applicants table
ALTER TABLE Applications
ADD CONSTRAINT FK_Applications_Applicants FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID);


-- Insert data into Companies table
INSERT INTO Companies
VALUES
    (1, 'TechCorp India', 'Bangalore'),
    (2, 'InnoTech Solutions', 'Mumbai'),
    (3, 'InfoTech Innovators', 'Hyderabad'),
    (4, 'DataMasters India', 'Chennai'),
    (5, 'SmartSys Technologies', 'Pune'),
    (6, 'SoftwareSolutions Ltd', 'Delhi'),
    (7, 'WebMasters India', 'Kolkata'),
    (8, 'MobileTech Innovations', 'Ahmedabad'),
    (9, 'EduTech Solutions', 'Jaipur'),
    (10, 'HealthTech Systems', 'Chandigarh');

-- Insert data into Jobs table
INSERT INTO Jobs 
VALUES
    (1, 1, 'Java Developer', 'Develop Java applications', 'Bangalore', 90000.00, 'Full-time', '2023-02-01 08:00:00'),
    (2, 1, 'UX/UI Designer', 'Design user interfaces', 'Bangalore', 75000.00, 'Full-time', '2023-02-02 10:30:00'),
    (3, 2, 'Business Analyst', 'Analyze business requirements', 'Mumbai', 80000.00, 'Full-time', '2023-02-03 12:00:00'),
    (4, 2, 'iOS Developer', 'Develop iOS applications', 'Mumbai', 95000.00, 'Full-time', '2023-02-04 14:30:00'),
    (5, 3, 'Data Scientist', 'Analyze and interpret data', 'Hyderabad', 100000.00, 'Full-time', '2023-02-05 09:45:00'),
    (6, 3, 'Network Engineer', 'Manage network infrastructure', 'Hyderabad', 85000.00, 'Full-time', '2023-02-06 11:15:00'),
    (7, 4, 'Software Tester', 'Test software applications', 'Chennai', 70000.00, 'Full-time', '2023-02-07 13:30:00'),
    (8, 4, 'Technical Writer', 'Create technical documentation', 'Chennai', 60000.00, 'Part-time', '2023-02-08 15:45:00'),
    (9, 5, 'Project Coordinator', 'Coordinate project activities', 'Pune', 85000.00, 'Full-time', '2023-02-09 17:00:00'),
    (10, 5, 'Android Developer', 'Develop Android applications', 'Pune', 90000.00, 'Full-time', '2023-02-10 19:15:00');

-- Insert data into Applicants table
INSERT INTO Applicants 
VALUES
     (1, 'Amit', 'Sharma', 'amit.sharma@email.com', '123-456-7890', 'Resume for Amit Sharma', 7),
    (2, 'Priya', 'Verma', 'priya.verma@email.com', '987-654-3210', 'Resume for Priya Verma', 5),
    (3, 'Rahul', 'Singh', 'rahul.singh@email.com', '345-678-9012', 'Resume for Rahul Singh', 6),
    (4, 'Anita', 'Gupta', 'anita.gupta@email.com', '567-890-1234', 'Resume for Anita Gupta', 8),
    (5, 'Sachin', 'Patil', 'sachin.patil@email.com', '789-012-3456', 'Resume for Sachin Patil', 9),
    (6, 'Pooja', 'Mehta', 'pooja.mehta@email.com', '901-234-5678', 'Resume for Pooja Mehta', 4),
    (7, 'Vivek', 'Chopra', 'vivek.chopra@email.com', '234-567-8901', 'Resume for Vivek Chopra', 6),
    (8, 'Swati', 'Nair', 'swati.nair@email.com', '456-789-0123', 'Resume for Swati Nair', 5),
    (9, 'Raj', 'Kumar', 'raj.kumar@email.com', '678-901-2345', 'Resume for Raj Kumar', 7),
    (10, 'Neha', 'Singhal', 'neha.singhal@email.com', '890-123-4567', 'Resume for Neha Singhal', 8);

-- Insert data into Applications table
INSERT INTO Applications 
VALUES
    (1, 1, 1, '2023-02-03 12:45:00', 'Cover letter for Java Developer from Amit Sharma'),
    (2, 1, 2, '2023-02-04 14:20:00', 'Cover letter for UX/UI Designer from Priya Verma'),
    (3, 2, 3, '2023-02-05 15:30:00', 'Cover letter for Business Analyst from Rahul Singh'),
    (4, 2, 4, '2023-02-06 16:45:00', 'Cover letter for iOS Developer from Anita Gupta'),
    (5, 3, 5, '2023-02-07 18:00:00', 'Cover letter for Data Scientist from Sachin Patil'),
    (6, 3, 6, '2023-02-08 19:15:00', 'Cover letter for Network Engineer from Pooja Mehta'),
    (7, 4, 7, '2023-02-09 20:30:00', 'Cover letter for Software Tester from Vivek Chopra'),
    (8, 4, 8, '2023-02-10 21:45:00', 'Cover letter for Technical Writer from Swati Nair'),
    (9, 5, 9, '2023-02-11 23:00:00', 'Cover letter for Project Coordinator from Raj Kumar'),
    (10, 5, 10, '2023-02-12 01:15:00', 'Cover letter for Android Developer from Neha Singhal');

/* 5.Write an SQL query to count the number of applications received for each job listing in the
"Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all
jobs, even if they have no applications */

SELECT
    J.JobID,
    J.JobTitle,
    COUNT(A.ApplicationID) AS ApplicationCount
FROM
    Jobs J
LEFT JOIN
    Applications A ON J.JobID = A.JobID
GROUP BY
    J.JobID, J.JobTitle;

/*6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary
range. Allow parameters for the minimum and maximum salary values. Display the job title,
company name, location, and salary for each matching job.*/
SELECT
    J.JobTitle,
    C.CompanyName,
    J.JobLocation,
    J.Salary
FROM
    Jobs J
JOIN
    Companies C ON J.CompanyID = C.CompanyID
WHERE
    J.Salary >= 50000
    AND J.Salary <= 80000;

/*7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a
parameter for the ApplicantID, and return a result set with the job titles, company names, and
application dates for all the jobs the applicant has applied to.*/

SELECT
    J.JobTitle,
    (SELECT CompanyName FROM Companies WHERE CompanyID = J.CompanyID) AS CompanyName,
    A.ApplicationDate
FROM
    Applications A
JOIN
    Jobs J ON A.JobID = J.JobID
WHERE
    A.ApplicantID = 1;

/*8. Create an SQL query that calculates and displays the average salary offered by all companies for
job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero.*/

SELECT
    AVG(Salary) AS AverageSalary
FROM
    Jobs
WHERE
    Salary > 0;


/*9. Write an SQL query to identify the company that has posted the most job listings. Display the
company name along with the count of job listings they have posted. Handle ties if multiple
companies have the same maximum count.*/

SELECT TOP 1 WITH TIES
    C.CompanyName,
    COUNT(J.JobID) AS JobCount
FROM
    Companies C
LEFT JOIN
    Jobs J ON C.CompanyID = J.CompanyID
GROUP BY
    C.CompanyID, C.CompanyName
ORDER BY
    JobCount DESC;


/*10. Find the applicants who have applied for positions in companies located in 'CityX' and have at
least 3 years of experience.*/

-- NOTE : we don't have experience cloumn in schema so adding here 

ALTER TABLE Applicants
ADD Experience INT;

UPDATE Applicants
SET Experience = 5 
WHERE ApplicantID = 1; 

SELECT DISTINCT
    A.*
FROM
    Applicants A
JOIN
    Applications App ON A.ApplicantID = App.ApplicantID
JOIN
    Jobs J ON App.JobID = J.JobID
JOIN
    Companies C ON J.CompanyID = C.CompanyID
WHERE
    C.Location = 'Location A'
    AND A.Experience >= 3;


-- 11.Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.

SELECT 
    JobTitle,
    Salary
FROM
    Jobs
WHERE
    Salary BETWEEN 60000 AND 80000;

-- 12. Find the jobs that have not received any applications

SELECT
    J.*
FROM
    Jobs J
LEFT JOIN
    Applications A ON J.JobID = A.JobID
WHERE
    A.ApplicationID IS NULL;

/* 13. Retrieve a list of job applicants along with the companies they have applied to and the positions
they have applied for. */

SELECT
    A.FirstName,
    A.LastName,
    C.CompanyName,
    J.JobTitle
FROM
    Applicants A
JOIN
    Applications App ON A.ApplicantID = App.ApplicantID
JOIN
    Jobs J ON App.JobID = J.JobID
JOIN
    Companies C ON J.CompanyID = C.CompanyID;

/* 14 . Retrieve a list of companies along with the count of jobs they have posted, even if they have not
received any applications */

SELECT
    C.CompanyName,
    COUNT(J.JobID) AS JobCount
FROM
    Companies C
LEFT JOIN
    Jobs J ON C.CompanyID = J.CompanyID
GROUP BY
    C.CompanyID, C.CompanyName;

/* 15 List all applicants along with the companies and positions they have applied for, including those
who have not applied */

SELECT a.FirstName , a.LastName ,c.CompanyName ,j.JobTitle
FROM Applicants a
LEFT JOIN Applications ap ON a.ApplicantID=ap.ApplicantID
LEFT JOIN Jobs j ON ap.JobID =j.JobID
LEFT JOIN Companies c ON j.CompanyID = c.CompanyID;

--16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.

SELECT DISTINCT
    C.CompanyName
FROM
    Companies C
JOIN
    Jobs J ON C.CompanyID = J.CompanyID
WHERE
    J.Salary > (SELECT AVG(Salary) FROM Jobs);

/*17. Display a list of applicants with their names and a concatenated string of their city and state.
NOTE: we have not given city and state in the table schema so i am adding them */

ALTER TABLE Applicants
ADD City VARCHAR(255),
    State VARCHAR(255);

UPDATE Applicants
SET City = 'SampleCity', State = 'SampleState'
WHERE ApplicantID = 1;


SELECT
    ApplicantID,
    FirstName,
    LastName,
    CONCAT(City, ', ', State) AS Location
FROM
    Applicants;

--18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.SELECT
    *
FROM
    Jobs
WHERE
    JobTitle LIKE '%Developer%'
    OR JobTitle LIKE '%Engineer%';

/* 19. Retrieve a list of applicants and the jobs they have applied for, including those who have not
applied and jobs without applicants. */

SELECT 
    A.FirstName,
    A.LastName,
    J.JobTitle
FROM 
    Applicants A
LEFT JOIN 
    Applications AP ON A.ApplicantID = AP.ApplicantID
LEFT JOIN 
    Jobs J ON AP.JobID = J.JobID;

/*20. List all combinations of applicants and companies where the company is in a specific city and the
applicant has more than 2 years of experience. For example: city=Chennai */

SELECT
    A.ApplicantID,
    A.FirstName,
    A.LastName,
    A.Experience,
    C.CompanyID,
    C.CompanyName,
    C.Location AS CompanyLocation
FROM
    Applicants A
CROSS JOIN
    Companies C
WHERE
    C.Location = 'Chennai'
    AND A.Experience > 2;













