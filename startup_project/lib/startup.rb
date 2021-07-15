require "employee"

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

    def >(diff_startup)
        self.funding > diff_startup.funding
    end

    def hire(name, title)
        raise "Not valid title" if !self.valid_title?(title)

        @employees << Employee.new(name, title)
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        amount = @salaries[employee.title]
        raise "The company does not have enough funding to pay the employee" if self.funding < amount

        employee.pay(amount)
        @funding -= amount
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        sum = 0
        @employees.each { |employee| sum += @salaries[employee.title] }
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(diff_startup)
        @funding += diff_startup.funding
        @salaries.merge!(diff_startup.salaries) { |key,old_value,new_value| old_value }
        @employees += diff_startup.employees
        diff_startup.close 
    end

end
