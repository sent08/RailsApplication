class CreateTableAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.integer :employee_id
      t.datetime :signin_datetime
      t.datetime :signout_datetime
      t.integer :attendance_type_id
      t.timestamps
    end
  end

  def self.down20091012155741_create_table_attendances
    drop_table :attendances
  end
end
