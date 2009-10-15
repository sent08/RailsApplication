module ActionController
  class Base
    before_filter :set_current_user

    def set_current_user
      Employee.current = session['user'] ? Employee.find_without_access_control(session['user'].id) : nil
    end

    def current_user
      Employee.current
    end
    helper_method :current_user
  end
end