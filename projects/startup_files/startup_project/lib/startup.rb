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

  def >(startup)
    @funding > startup.funding
  end

  def hire(name, title)
    if self.valid_title?(title)
      @employees << Employee.new(name, title)
    else
      raise_error
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    value = @salaries[employee.title]
    if @funding >= value
      employee.pay(value)
      @funding -= value
    else
      raise_error
    end
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee) }
  end

  def average_salary
    titles = @employees.map(&:title)
    titles_values = titles.map { |title| @salaries[title] }
    return titles_values.sum * 1.0 / titles_values.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    @salaries = startup.salaries.merge(@salaries)
    @employees += startup.employees
    startup.close
  end
end
