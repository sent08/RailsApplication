class CreateTableEmployeeRoles < ActiveRecord::Migration
  def self.up
    create_table :employee_roles do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
  end
end
