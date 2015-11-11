class AdminController < ApplicationController
 	layout "admin"
	before_action :logged_in_user

	def index
		@entries = Entry.count
		@suggestions = Suggestion.count
		@suggestions_list = Suggestion.take(10)

		@foods = Entry.find_by_sql("SELECT e.* FROM entries e JOIN categories c ON c.id = e.category_id WHERE upper(c.description) like '%COMIDA%'").count;
		@drinks = Entry.find_by_sql("SELECT e.* FROM entries e JOIN categories c ON c.id = e.category_id WHERE upper(c.description) like '%BEBIDA%'").count;
		@desserts = Entry.find_by_sql("SELECT e.* FROM entries e JOIN categories c ON c.id = e.category_id WHERE upper(c.description) like '%SOBREMESA%'").count;

		render "admin/dashboard/index"
	end
end
