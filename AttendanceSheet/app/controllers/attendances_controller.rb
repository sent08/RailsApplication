class AttendancesController < ApplicationController
  before_filter :login_required
  before_filter :load_attendances, :only => [:index]
  
  def index
    if request.xhr?
      render :partial => "attendances/index", :layout => false
    end
  end

  def signin
    @attendance = current_user.attendances.signed_in_for(Date.today).first
    unless @attendance.blank?
      render :update do |page|
        page.replace_html "message", :text => "You have already signed in."
        page.visual_effect :highlight, 'message', :duration => 4.5
      end
    else
      @attendance = Attendance.create(:signin_datetime => Time.now.to_s(:db), :employee_id => current_user.id)
      load_attendances
      render :update do |page|
        page.replace_html "body_middle_content", :partial => "attendances/index"
      end
    end
  end

  def signout
    signed_in = current_user.attendances.signed_in_for(Date.today).first
    unless signed_in.blank?
      @attendance = current_user.attendances.signed_out_for(Date.today).first
      unless @attendance.blank?
        render :update do |page|
          page.replace_html "message", :text => "You have already signed out."
          page.visual_effect :highlight, 'message', :duration => 4.5
        end
      else
        @attendance = signed_in
        @attendance.update_attribute(:signout_datetime, Time.now.to_s(:db))
        load_attendances
        render :update do |page|
          page.replace_html "body_middle_content", :partial => "attendances/index"
        end
      end
    else
      render :update do |page|
        page.replace_html "message", :text => "You have not signed in yet."
        page.visual_effect :highlight, 'message', :duration => 4.5
      end
    end
  end

  private

  def load_attendances
    begin
      @employee_user = Employee.find_by_id(params[:employee_id] || current_user.id)
      @attendances = @employee_user.attendances(:order => "signin_datetime desc")
    rescue ActiveRecord::SecurityTransgression
      flash[:notice] = "You are allowed to access this page/data"
    end
  end
end
