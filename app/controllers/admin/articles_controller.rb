class Admin::ArticlesController < ApiController

	skip_before_action :authenticate_user_from_token!

	def create
		@user = User.find_for_database_authentication(email: params[:email])
		
		return invalid_login_attempt unless @user

      	if @user.valid_password?(params[:password])
      		@user.update_access_token!
        	sign_in :user, @user
        	render json: @user
      	else
        	invalid_login_attempt
      	end
	end

	private
	def invalid_login_attempt
      warden.custom_failure!
      render json: {error: t('sessions_controller.invalid_login_attempt')}, status: :unprocessable_entity
    end
end
