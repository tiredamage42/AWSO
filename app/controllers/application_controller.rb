class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'author'

    def authenticate_active_admin_user!
        authenticate_author!
        unless current_author.superadmin?
          flash[:alert] = "Unauthorized Access!"
          redirect_to root_path
        end
      end

end
