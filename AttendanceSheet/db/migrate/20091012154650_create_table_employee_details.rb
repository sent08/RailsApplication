class CreateTableEmployeeDetails < ActiveRecord::Migration
  def self.up
    create_table :employee_details do |t|
      t.integer :employee_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :marital_status
      t.datetime :dob
      t.string :passport_number
      t.datetime :doj
      t.timestamps
    end
  end

  def self.down
    drop_table :employee_details
  end
end
