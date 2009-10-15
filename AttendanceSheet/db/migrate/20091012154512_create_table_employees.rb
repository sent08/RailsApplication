class CreateTableEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.integer :employee_role_id
      t.string :user_name
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :employees
  end
end
