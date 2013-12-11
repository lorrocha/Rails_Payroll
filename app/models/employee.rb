require 'CSV'

class Employee
  def initialize(row)
    @attributes = row
  end

  def self.get_employees
    employees = []

    CSV.foreach(Rails.root.join("db/data/employees.csv"), headers: true) do |attributes|
      employee = Employee.new(attributes)
      employees << employee
    end

    employees
  end

  def first_name
    @attributes["first_name"]
  end

  def last_name
    @attributes["last_name"]
  end

  def title
    @attributes["type"].capitalize
  end

  def salary
    @attributes["salary"]
  end

  def net_pay
    #Call on salary to get the number of the salary that we have to add to the bonus/whatever
    #Call on Sale.new(last_name) so it gives us his total number of sales
    # and then if it matches the quota, we add the commision to the salary
    salary.to_i + determine_commission
  end

  def determine_commission
    title == "Commission" ? (@attributes["commibonus"].to_f*Sale.new.get_sales(last_name)) : 0
  end
end
