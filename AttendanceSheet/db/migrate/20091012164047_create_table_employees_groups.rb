class CreateTableEmployeesGroups < ActiveRecord::Migration
  def self.up
    create_table :employees_groups do |t|
      t.integer :group_id
      t.integer :employee_id
    end
  end

  def self.down
    drop_table :group_employees
  end
end
