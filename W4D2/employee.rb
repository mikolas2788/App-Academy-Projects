class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end 

    def bonus(multiplier)
        salary * multiplier
    end 
end 

class Manager < Employee
    attr_reader :employees
    
    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        employees = []
    end 

    def total_subsalary
        total_salaries = 0
        employees.each do |employee|
            if employee.is_a?(Manager)
                total_salaries += employee.salary + employee.total_subsalary
            else 
                total_salaries += employee.salary
            end 
        end 

        total_salaries
    end 
end 