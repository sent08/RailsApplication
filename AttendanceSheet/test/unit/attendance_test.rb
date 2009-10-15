require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase

  def test_crud
    Employee.current = emp = employees(:admin)
    attendance = Attendance.new(:employee_id => emp.id, :signin_datetime => Time.now.to_s(:db) )
    assert attendance.save
    assert attendance.update_attribute(:signout_datetime, Time.now.to_s(:db))
    assert attendance.destroy
  end

  def test_access_control
    Employee.current = emp = employees(:admin)
    emp_t = employees(:employee_1)
    assert emp_t.attendances
  end
end
