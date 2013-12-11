
class SalesController < ApplicationController
  def index
    @employees = Employee.get_employees
  end
end
