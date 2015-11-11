class Admin::EntriesController < AdminController	
	def index
		@entries = Entry.all
		render 'admin/entries/index'
	end

	def new		
		@entry = Entry.new
		render 'admin/entries/new'
	end

	def create
	    @entry = Entry.new(entry_params)
		 
		if @entry.save
			redirect_to :controller => 'admin/entries', :action => 'index'
	    else
			flash.now[:notice] = "Erro"
	    	render 'new'
		end
	end

	def edit
		@entry = Entry.find(params[:id])
		render 'admin/entries/edit'
	end

	def update
		@entry = Entry.find(params[:id])

		if @entry.update(entry_params)
			redirect_to :controller => 'admin/entries', :action => 'index'
		else
			render 'edit'
		end
	end

	private
		def entry_params
			params.require(:entry).permit(:entry, :description, :funny_description, :picture, :category_id)
		end
end
