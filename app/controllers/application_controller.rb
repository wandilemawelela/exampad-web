class ApplicationController < ActionController::Base
    before_action :authenticate_user!
  
    def require_teacher!
      unless current_user.teacher?
        redirect_to root_path, alert: 'Access denied!'
      end
    end
  end