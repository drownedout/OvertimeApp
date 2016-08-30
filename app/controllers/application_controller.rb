class ApplicationController < ActionController::Base
	include Pundit	
	protect_from_forgery with: :exception
	before_action :authenticate_user!

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	def admin_types
		['AdminUser']
	end
	
	private
	def user_not_authorized
		flash[:alert] = "You are not authorized to view this page"
		redirect_to(request.referrer || root_path)
	end
end
