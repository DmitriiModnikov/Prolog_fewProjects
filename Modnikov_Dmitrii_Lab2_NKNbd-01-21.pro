implement main
    open core, stdio

domains
            name = string.
class facts
    emp : (integer Id, string Gender, name, string Birthday).

clauses
    emp(1, "Валерий Уткин", "Мужской", "04/09/1988").
    emp(2, "Роза Григорьева", "Женский", "05/04/1994").
    emp(3, "Антуан Звездов", "Мужской", "02/04/1999").
    emp(4, "Асмана Голдаева", "Женский", "08/05/1993").
    emp(5, "Дуан Башкиров", "Мужской", "09/06/1997").

class predicates
    printEmployees : ().
    updateEmployee : (integer Id, name, string Gender, string Birthday).

clauses
    printEmployees() :-
        emp(Id, name, Gender, Birthday),
        write(Id, "\t", name, "\t", Gender, "\t", Birthday),
        nl,
        fail.
    printEmployees() :-
        write("Все сотрудники выше\n").

clauses
    updateEmployee(Id, name, Gender, Birthday) :-
        retract(emp(Id, _, _, _)),
        asserta(emp(Id, name, Gender, Birthday)),
        fail.
    updateEmployee(_, _, _, _).

clauses
    run() :-
        printEmployees(),
        write("Введите идентификатор сотрудника для обновления: "),
        X = stdio::readLine(),
        write("Введите имя сотрудника: "),
        Y = stdio::readLine(),
        write("Введите пол сотрудника: "),
        Z = stdio::readLine(),
        write("Введите день рождения сотрудника: "),
        W = stdio::readLine(),
        updateEmployee(toTerm(X), toTerm(Y), toTerm(Z), toTerm(W)),
        printEmployees(),
        _ = stdio::readLine().

class facts
    dep : (integer Id, name).

clauses
    dep(11, "Отдел Продаж").
    dep(33, "Отдел Маркетинга").
    dep(22, "Отдел Программирования").


class predicates
    printDepartments : ().
    updateDepartment : (integer Id, name).

clauses
    printDepartments() :-
        dep(Id, name),
        write(Id, "\t", name),
        nl,
        fail.
    printDepartments() :-
        write("Все отделы выше\n").

clauses
    updateDepartment(Id, name) :-
        retract(dep(Id, _)),
        asserta(dep(Id, name)),
        fail.
    updateDepartment(_, _).

clauses
    run() :-
        printDepartments(),
        write("Введите идентификатор отдела для обновления:"),
        X = stdio::readLine(),
        write("Введите название отдела: "),
        Y = stdio::readLine(),
        updateDepartment(toTerm(X), toTerm(Y)),
        printDepartments(),
        _ = stdio::readLine(),

class facts
        position:(integer Id, name, name, integer Id).

clauses
    position(111, "Менеджер", "Отдел Продаж", 11).
    position(112, "Маркетолог", "Отдел Продаж", 11).
    position(113, "Аналитик", "Отдел Продаж", 11).
    position(221, "Дата сайнтист", "Отдел Программирования", 22).
    position(222, "Фронтендер", "Отдел Программирования", 22).
    position(223, "Бэкендер", "Отдел Программирования", 22).
    position(223, "Тестировщик", "Отдел Программирования", 22).
    position(331, "SMM-Специалист", "Отдел Маркетинга", 33).
    position(332, "Таргетолог", "Отдел Маркетинга", 33).
    position(333, "Дизайнер", "Отдел Маркетинга", 33).

class facts
        occupation:(integer Id, integer Id, name).
clauses
    occupation(1, 111, "2013, 05, 02").
    occupation(2, 112, "2016, 06, 01").
    occupation(3, 113, "2017, 07, 03").
    occupation(4, 221, "2011, 08, 05").
    occupation(5, 222, "2012, 09, 07").


class facts
        salary:(integer Id, integer Salary).
clauses
    salary(1, 40000).
    salary(2, 50000).
    salary(3, 60000).
    salary(4, 70000).
    salary(5, 80000).

class predicates
    printSalaries: ().
    average_salary: ().
    increaseSalary: ().

clauses
    average_salary(Avg) :-
    findall(Salary, salary(_, Salary), Salaries),
    sum_list(Salaries, Total),
    length(Salaries, Count),
    Avg = Total / Count.

clauses
    printSalaries :-
    format("ID\tSalary~n"),
    forall(salary(ID, Salary),
    format("~w\t~w~n", [ID, Salary])).

clauses
    increaseSalary(Increase) :-
        retract(salary(ID, Salary)),
        NewSalary = Salary + Increase,
        assert(salary(ID, NewSalary)),
    fail.
    increaseSalary(_).

clauses
    printSalaries :-
        average_salary(Avg),
        format("Средняя заработная плата: ~w~n~n", [Avg]),
        write("Введите число для увеличения зарплаты: "),
        read_line_to_string(user_input, Input),
        atom_number(Input, Increase),
        increaseSalary(Increase),
        printSalaries,
        average_salary(NewAvg),
        format("Новая средняя зарплата: ~w~n", [NewAvg]).

clauses
       run() :-
        printSalaries(),
        X = stdio::readLine(),
        increaseSalary(toTerm(X)),
        printStips(),
        _ = stdio::readLine(),

class facts
        vacancy:(name, integer Salary ).
clauses
vacancy("Таргетолог", 60000).
vacancy("Дизайнер", 70000).

class facts
        expenses:(integer Id, integer Salary ).
clauses
    expenses(11, 100000).
    expenses(22, 150000).
    expenses(33, 90000).

class facts
        intern:(integer Id, name, string Gender, string Birthday).
clauses
        intern(8, "Ковалева Антонина Васильева", "Женский", "1989, 07, 16").

class facts
        office:(integer Id, name).
clauses
     office(1111, "Москва").
     office(2222, "Санкт-Петербург").
     office(3333, "Кишинев").

class predicates
    printFindOffice: ().

clauses
printFindOffice() :-
        office(Id, name),
        write(Id, ":\t", City, " - "),
        nl,
        fail.
    printFindOffice() :-
        nl.

class facts
        dismissal:(integer Id, name).
clauses
        dismissal(3, "Антуан Звездов").
        dismissal(5, "Антуан Звездов").

class facts
        increase:(integer Id, name, integer Salary1,integer Salary1).

clauses
        increase(1, "Валерий Уткин", 40000, 50000).
        increase(2, "Дуан Башкиров", 70000, 80000).
        increase(4, "Асмана Голдаева", 50000, 60000).

class predicates
        is_it_possible: (integer X, integer Y [out]).

clauses
          is_it_possible(X, Y) :-
        X - Y < 25000,
        !,
        write("Можно").

          is_it_possible(X, Y) :-
        X - Y > 25000,
        !,
         write("Не подходит! Прям вообще никак! ").


class facts
        intern:(integer Id, name, string Gender, string Birthday).
clauses
        intern(8, "Ковалева Антонина Васильева", "Женский", "1989, 07, 16").

class facts
        intern:(integer Id, name, string Gender, string Birthday).
clauses
        intern(8, "Ковалева Антонина Васильева", "Женский", "1989, 07, 16").

class facts
        intern:(integer Id, name, string Gender, string Birthday).
clauses
        intern(8, "Ковалева Антонина Васильева", "Женский", "1989, 07, 16").

end implement main

goal
    console::runUtf8(main::run).
