class EmployeesController < ApplicationController
  before_filter :login_required, :except => [:login, :signin]
  before_filter :load_employees, :only => [:index]
  before_filter :is_admin?, :except => [:login, :logout, :signin]
  
  def index
    if request.xhr?
      render :partial => "employees/index", :layout => false
    end
  end
  
  def signin
    unless current_user.id.blank?
      redirect_to :controller => :attendances, :action => :index
    else
      @employee = Employee.new
    end
  end

  def new
    @employee = Employee.new
    @employee_detail = EmployeeDetail.new
    @employee_roles = EmployeeRole.find(:all)
    render :partial => "employees/new"
  end

  def login
    session['return-to'] = '/' if session['return-to'].blank?
    @employee = Employee.new(params['employee'])
    if session['user'] = Employee.authenticate(params['employee']['user_name'], params['employee']['crypted_password'])
      set_current_user
      render :update do |page|
        page << "window.location = '/attendances/index' "
      end
    else
      render :update do |page|
        page.replace_html 'login_error', "Username/Password is not valid"
        page.visual_effect :highlight, 'login_error', :duration => 2.0
      end
    end
  end

  def logout
    Employee.current = nil
    session['user'] = nil
    render :update do |page|
      page << "window.location = '/employees/signin'"
    end
  end

  def create
    begin
      flash[:notice] = ""
      Employee.transaction do
        @employee = Employee.new(params[:employee])
        @employee.password_create = true
        @employee.employee_detail = @employee_detail = EmployeeDetail.new(params[:employee_detail])
        @employee.user_name = "emp#{Employee.count + 1}"
        @employee.valid?
        if @employee.valid? && @employee.save
          load_employees
          render :update do |page|
            page.replace_html "body_middle_content", :partial => "employees/index"
          end
        else
          @employee_roles = EmployeeRole.find(:all)
          @employee_detail.valid?
          render :update do |page|
            page.replace_html "body_middle_content", :partial => "employees/new"
          end
        end
      end
    rescue ActiveRecord::SecurityTransgression
      flash[:notice] = "You are allowed to access this page/data"
    end
  end

  private

  def load_employees
    @employees = Employee.find(:all)
  end
  
  def is_admin?
    unless current_user.admin?
      redirect_to :controller => "attendances", :action => "index"
    end
  end

end
