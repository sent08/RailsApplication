require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_crud
    Employee.current = employees(:admin)
    emp = Employee.new(:user_name => "emp3", :email => "somemail@somedomain.com", :password => "somepassword", :employee_role_id => 2)
    assert emp.save
    assert emp.update_attribute(:email, "some@some.com")
    assert emp_t = Employee.find_by_id(emp.id)
    assert emp_t.destroy
  end

  def test_unauthorize_access
    Employee.current = employees(:employee_1)
    emp = Employee.new(:user_name => "emp3", :email => "somemail@somedomain.com", :password => "somepassword", :employee_role_id => 2)
    assert_raise ActiveRecord::SecurityTransgression do
     emp.save
    end
    assert_raise ActiveRecord::SecurityTransgression do
     emp.update_attribute(:email, "some@some.com")
    end
    assert emp_t = Employee.find_by_id(2)
    assert_raise ActiveRecord::SecurityTransgression do
      emp_t.destroy
    end
  end
end
