module Admin
  class ApplicationController < Administrate::ApplicationController
    #helper Admin::Engine.helpers

    before_action :authenticate_admin

    def authenticate_admin
      if !current_user&.has_role?(:admin) && !user_signed_in?
        redirect_to new_user_session_path
      end
    end


    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
