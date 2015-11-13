class Site::SiteController < ApplicationController
	def index
		@entries = Entry.last(5)
		render "site/index"
	end

	# keyword search
	def search

		# Using redis to avoid a lot of searches in database		
		if (entries = $redis.get(params[:keyword])).nil?
			entries = Entry.where("entries.entry like '%#{params[:keyword]}%' or entries.description like '%#{params[:keyword]}%' or entries.funny_description like '%#{params[:keyword]}%' ")			
			$redis.set(params[:keyword],entries)
			$redis.expire("params[:keyword]",1.hour.to_i)
		end
		
		@entries = JSON.parse(entries)
		render "site/search"
	end

	# letter search
	def letter
		# Using redis to avoid a lot of searches in database		
		if (entries = $redis.get(params[:letter])).nil?
			entries = Entry.where("entries.entry like '#{params[:letter]}%'")
			$redis.set(params[:letter],entries.to_json)
			$redis.expire("params[:letter]",5.minutes.to_i)
		end

		@entries = JSON.parse(entries)
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