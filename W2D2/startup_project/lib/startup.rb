require "employee"
require 'byebug'

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end 

    def valid_title?(title)
        @salaries.has_key?(title)
    end 

    def >(startup2)
        self.funding > startup2.funding
    end

    def hire(employee, title)
        if valid_title?(title)
            @employees << Employee.new(employee, title)
        else
            raise "We have no position for this employee"
        end 
    end     

    def size 
        @employees.size
    end 

    def pay_employee(employee)
        employee_salary = @salaries[employee.title]
        if @funding > employee_salary
            employee.pay(employee_salary)
            @funding -= employee_salary
        else 
            raise "We're too broke to pay this employee"
        end 
    end 

    def payday
        @employees.each { |employee| self.pay_employee(employee)}
    end 

    def average_salary
        total_salary = 0

        @employees.each do |employee|
            total_salary += @salaries[employee.title]
        end

        total_salary / @employees.length
    end 

    def close
        @employees = []
        @funding = 0
    end 

    def acquire(startup2)
        @funding += startup2.funding 
        # @salaries = startup2.salaries.merge(@salaries)
        # @employees = @employees.concat(startup2.employees)
        @salaries = { **startup2.salaries, **@salaries }
        @employees = [ *@employees, *startup2.employees ]
        startup2.close
    end 
end
