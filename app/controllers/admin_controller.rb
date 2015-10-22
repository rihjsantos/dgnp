class AdminController < ApplicationController
 	layout "admin"
	before_action :logged_in_user

	def index
		render "admin/dashboard/index"
	end
end
