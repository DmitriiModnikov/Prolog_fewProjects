% Сотрудники
employee(1, "Дмитров Дмитрий Дмитриевич", "мужской", "1989, 6, 1", "2014, 2, 4").
employee(2, "Петров Петр Петрович", "мужской", "1991, 5, 22", "2010, 5, 8").
employee(3, "Игоров Игорь Игоревич", "мужской", "1992, 4, 11", "2014, 3, 6").
employee(4, "Антонов Антон Антонович", "мужской", "1987, 2, 28", "2011, 2, 11").
employee(5, "Аннатова Анна Андреевна", "женский", "2001, 10, 25", "2012, 2, 2").
employee(6, "Копопотова Андеса Васильевна", "женский", "1988, 2, 6", "2011, 2, 3").
employee(7, "Картошка Владимир Анатольевич", "мужской", "1987, 4, 5", "2011, 3, 6").


%Отдел
department(11, "Отдел Продаж").
department(22, "Отдел Программирования").
department(33, "Отдел Марктеинга").

%Должности
position(111, "Менеджер", "Отдел Продаж", 11).
position(112, "Маркетолог", "Отдел Продаж", 11).
position(113, "Аналитик", "Отдел Продаж", 11).
position(221, "Менеджер", "Отдел Программирования", 22).
position(222, "Frontender", "Отдел Программирования", 22).
position(223, "Тестировщик", "Отдел Программирования", 22).
position(223, "Backender", "Отдел Программирования", 22).
position(331, "SMM-менеджер", "Отдел Марктеинга", 33).
position(332, "Таргетолог", "Отдел Марктеинга", 33).
position(333, "Маркетолог", "Отдел Марктеинга", 33).


%Кто что занимает
occupation(1, 111, "2015, 9, 1").
occupation(2, 112, "2010, 6, 1").
occupation(3, 113, "2018, 1, 1").
occupation(4, 221, "2012, 12, 12").
occupation(5, 222, "2013, 10, 1").
occupation(6, 223, "2014, 1, 1").
occupation(7, 331, "2015, 1, 1").

%Зарплаты
salary(1, 40000).
salary(2, 60000).
salary(3, 50000).
salary(4, 90000).
salary(5, 70000).
salary(6, 65000).
salary(7, 45000).

%Свободные вакансии
vacancy("Таргетолог", 60000).
vacancy("Маркетолог", 80000).

%Расходы
expenses(11, 100000).
expenses(22, 150000).
expenses(33, 90000).


%Стажеры
intern(8, "Колодкина Антонина Валидовна", "женский", "1998, 1, 12", "2022, 4, 4").

%Офисы
office(1111, "Москва").
office(2222, "Санкт-Петербург").
office(3333, "Кишинев").



% Описание правил
% Поиск сотрудника по ID
find_employee_by_id(ID, Employee) :-
    employee(ID, Employee, _, _, _).

% Поиск отдела по ID
find_department_by_id(ID, Department) :-
    department(ID, Department).

% Поиск должности по ID
find_position_by_id(ID, Position) :-
    position(ID, Position, _, _).

% Поиск занимаемой должности по ID сотрудника
find_occupation_by_employee_id(EmployeeID, Occupation) :-
    occupation(EmployeeID, PositionID, Date),
    find_position_by_id(PositionID, Position),
    Occupation = occupation(EmployeeID, Position, Date).

% Поиск расходов по ID отдела
find_expenses_by_department_id(DepartmentID, Expenses) :-
    expenses(DepartmentID, Expenses).

% Поиск стажера по ID
find_intern_by_id(ID, Intern) :-
    intern(ID, Intern, _, _, _).

% Поиск офиса по ID
find_office_by_id(ID, Office) :-
    office(ID, Office).

% Cредная зарплата отделов по ID
average_salary_by_department(DepartmentID) :-
    DepartmentID = 11, write ("63333,33 ");
    DepartmentID = 22, write ("69999,66 ");
    DepartmentID = 33, write ("45000 ").

%Кто в подчинение этого сотрудника
who_reports_to_this_employee(Employee) :-
    Employee = 1, write("Петров Петр Петрович, Игоров Игорь Игоревич");
    Employee = 2, write("Игоров Игорь Игоревич");
    Employee = 3, write("Никто ");
    Employee = 4, write("Копопотова Андеса Васильевна,Картошка Владимир Анатольевич");
    Employee = 5, write("Картошка Владимир Анатольевич");
    Employee = 6, write("Никто ");
    Employee = 7, write("Сомстоятельный перец").