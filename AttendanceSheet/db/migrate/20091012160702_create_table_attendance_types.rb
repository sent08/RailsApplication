class CreateTableAttendanceTypes < ActiveRecord::Migration
  def self.up
    create_table :attendance_types do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :attendance_types
  end
end
