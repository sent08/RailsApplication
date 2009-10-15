class EmployeeDetail < ActiveRecord::Base
  belongs_to :employee

  # Validations
  validates_presence_of :first_name, :last_name
end
