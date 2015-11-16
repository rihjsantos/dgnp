class Site::SiteController < ApplicationController
	def index
           @categories = Category.all
           @entries = Entry.all
           @tags = Tag.all
	render "site/index"
	end
end