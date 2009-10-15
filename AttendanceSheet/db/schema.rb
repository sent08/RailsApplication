# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091012164047) do

  create_table "attendance_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendances", :force => true do |t|
    t.integer  "employee_id"
    t.datetime "signin_datetime"
    t.datetime "signout_datetime"
    t.integer  "attendance_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_details", :force => true do |t|
    t.integer  "employee_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.string   "marital_status"
    t.datetime "dob"
    t.string   "passport_number"
    t.datetime "doj"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.integer  "employee_role_id"
    t.string   "user_name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees_groups", :force => true do |t|
    t.integer "group_id"
    t.integer "employee_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
