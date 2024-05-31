# BD: Guião 9


## ​9.1
 
### *a)*

```
CREATE PROCEDURE rem_func 
  @ssn char(9)
AS
BEGIN
  DELETE FROM Works_on WHERE Essn = @employee_ssn;

  DELETE FROM Dependent WHERE Essn = @employee_ssn;
  
  -- Remover funcionário
  DELETE FROM Employee WHERE Ssn = @employee_ssn;

  UPDATE Employee set Super_ssn = NULL where Super_ssn = @employee_ssn;
  
END;

Antes de realizar as exclusões, confirmar se o funcionário está presente nas tabelas. 
Estabeleçer restrições de foreign key para assegurar a integridade dos dados ao remover registos associados. 
Gerenciar erros durante a execução e interceptar exceções ao aplicar uma lógica de tratamento apropriada. 
Usar transações para garantir a consistência dos dados. 
Certificar que o usuário tem as permissões necessárias para acessar, alterar e remover os registos nas tabelas pertinentes.
```

### *b)* 

```
CREATE PROCEDURE getManagerInfo
AS
BEGIN

    DECLARE @currentDate AS DATE = GETDATE();

    WITH ManagerInfo AS (
        SELECT Mgr_ssn AS Ssn, DATEDIFF(YEAR, Mgr_start_date, @currentDate) AS YearsOfService
        FROM Department
        WHERE Mgr_ssn IS NOT NULL
    )

    SELECT E.Fname, E.Minit, E.LName, E.Ssn, D.Mgr_ssn, MI.YearsOfService
    FROM Employee E
    INNER JOIN Department D ON E.Ssn = D.Mgr_ssn
    INNER JOIN ManagerInfo MI ON E.Ssn = MI.Ssn;

    SELECT TOP 1 Ssn, YearsOfService
    FROM ManagerInfo
    ORDER BY YearsOfService DESC;
END;
```

### *c)* 

```
CREATE TRIGGER tr_verify_manager_assignment
ON Company.Department
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT D.Mgr_ssn
        FROM Department D
        INNER JOIN inserted I ON D.Mgr_ssn = I.Mgr_ssn
        GROUP BY D.Mgr_ssn
        HAVING COUNT(*) > 1
    )
    BEGIN
        RAISERROR ('The employee is already a manager of another department.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
```

### *d)* 

```
CREATE TRIGGER tr_check_salary
ON Company.Employee
AFTER INSERT, UPDATE
AS
BEGIN

    WITH InsertedEmployees AS (
        SELECT Ssn, Salary
        FROM inserted
    ),

    Managers AS (
        SELECT d.Mgr_ssn AS Ssn, manager.Salary
        FROM Department d
        INNER JOIN Employee manager ON d.Mgr_ssn = manager.Ssn
    )

    UPDATE e
    SET e.Salary = m.Salary - 1
    FROM Employee e
    INNER JOIN InsertedEmployees ie ON e.Ssn = ie.Ssn
    INNER JOIN Managers m ON e.Dno = m.Dnumber
    WHERE e.Salary > m.Salary;
END;

```

### *e)* 

```
CREATE FUNCTION getEmployeeProjects
(
    @employee_ssn VARCHAR(9)
)
RETURNS TABLE
AS
RETURN
(
    SELECT p.Pname, p.Plocation
    FROM Company.Project p
    WHERE p.Pnumber IN (
        SELECT w.Pno
        FROM Company.Works_on w
        WHERE w.Essn = @employee_ssn
    )
);

GO
SELECT * FROM getEmployeeProjects('183623612');
```

### *f)* 

```
CREATE FUNCTION udf_get_employees_above_avg_salary
(
    @dno INT
)
RETURNS TABLE
AS
RETURN
(
    WITH AvgSalary AS (
        SELECT AVG(Salary) AS AverageSalary
        FROM Employee
        WHERE Dno = @dno
    )
    SELECT e.Fname, e.Minit, e.Lname, e.Ssn, e.Salary
    FROM Employee e
    INNER JOIN Department d ON e.Dno = d.Dnumber
    INNER JOIN AvgSalary a
    WHERE d.Dnumber = @dno AND e.Salary > a.AverageSalary
);
```

### *g)* 

```
CREATE FUNCTION dbo.employeeDeptHighAverage (@Dno INT)
RETURNS @ProjectInfo TABLE
(
    Pname VARCHAR(30),
    Pnumber INT,
    Plocation VARCHAR(20),
    Dnum INT,
    Budget DECIMAL(10,2),
    TotalBudget DECIMAL(10,2)
)
AS
BEGIN
    DECLARE @TotalBudget DECIMAL(10,2) = 0;


    CREATE TABLE #tempProjects
    (
        Pname VARCHAR(30),
        Pnumber INT,
        Plocation VARCHAR(20),
        Dnum INT,
        EmployeeSalary DECIMAL(10,2)
    )


    INSERT INTO #tempProjects
    SELECT p.Pname, p.Pnumber, p.Plocation, p.Dnum, e.Salary
    FROM Company.Project p
    JOIN Company.Works_on w ON p.Pnumber = w.Pno
    JOIN Company.Employee e ON w.Essn = e.Ssn
    WHERE p.Dnum = @Dno;


    DECLARE @currentRow INT = 1;


    DECLARE @totalRows INT = (SELECT COUNT(*) FROM #tempProjects);


    WHILE @currentRow <= @totalRows
    BEGIN
    
        DECLARE @Pname VARCHAR(30), @Pnumber INT, @Plocation VARCHAR(20), @Dnum INT, @EmployeeSalary DECIMAL(10,2);
        SELECT @Pname = Pname, @Pnumber = Pnumber, @Plocation = Plocation, @Dnum = Dnum, @EmployeeSalary = EmployeeSalary
        FROM #tempProjects
        WHERE ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) = @currentRow;


        DECLARE @Budget DECIMAL(10,2) = @EmployeeSalary / 40;
        SET @TotalBudget = @TotalBudget + @Budget;


        INSERT INTO @ProjectInfo (Pname, Pnumber, Plocation, Dnum, Budget, TotalBudget)
        VALUES (@Pname, @Pnumber, @Plocation, @Dnum, @Budget, @TotalBudget);


        SET @currentRow = @currentRow + 1;
    END;


    DROP TABLE #tempProjects;

    RETURN;
END;

SELECT * FROM dbo.employeeDeptHighAverage(3);
```

### *h)* 

```

```

### *i)* 

```

```
