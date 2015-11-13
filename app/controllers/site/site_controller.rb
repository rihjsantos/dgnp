class Site::SiteController < ApplicationController
	def index
		@entries = Entry.last(5)
		render "site/index"
	end

	# keyword search
	def search
		@entries = Entry.where("entries.entry like '%#{params[:keyword]}%' or entries.description like '%#{params[:keyword]}%' or entries.funny_description like '%#{params[:keyword]}%' ")
		render "site/search"
	end

	# letter search
	def letter
		@entries = Entry.where("entries.entry like '#{params[:letter]}%'")
		render "site/search"
	end

	# slugged URL
	def detail
		# here, the rails is smart enough to get the id before text slug, so don't worry
		@entry = Entry.find_by_id(params[:slug])

		# for smarty guys who type anything in URL to test our search engine (or delete the id)
		unless @entry
			@entry = Entry.where("entries.slug like '%#{params[:slug]}%' OR entries.entry like '%#{params[:slug]}%'").first
		end

		render "site/detail"
	end
end