class Admin::EntriesController < AdminController
	def index
		@entries = Entry.all
		render 'admin/entries/index'
	end

	def new		
		@entry = Entry.new
		render 'admin/entries/new'
	end
end
