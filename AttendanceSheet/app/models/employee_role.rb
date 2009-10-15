class EmployeeRole < ActiveRecord::Base
  has_many :employees
end
