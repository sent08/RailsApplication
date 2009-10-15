class Attendance < ActiveRecord::Base
  belongs_to :employee
  belongs_to :attendance_type

  # Named Scopes
  named_scope :signed_in_for, lambda{|date| {:conditions => "signin_datetime between '#{date.to_datetime.beginning_of_day.to_s(:db)}' and '#{date.to_datetime.end_of_day.to_s(:db)}'"}}
  named_scope :signed_out_for, lambda{|date| {:conditions => "signout_datetime between '#{date.to_datetime.beginning_of_day.to_s(:db)}' and '#{date.to_datetime.end_of_day.to_s(:db)}'"}}

  def updatable_by?(employee)
    self.employee == employee || employee.admin?
  end

  def readable_by?(employee)
    self.employee == employee || employee.admin?
  end

  def creatable_by?(employee)
    self.employee == employee || employee.admin?
  end

  def deletable_by?(employee)
    employee.admin?
  end
end
