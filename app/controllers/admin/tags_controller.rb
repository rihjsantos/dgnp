class Admin::TagsController < AdminController
	def index
		@tags = Tag.all
		render 'admin/tags/index'
	end

	def new
		@tag = Tag.new
		render 'admin/tags/new'
	end

	def create
		@tag = Tag.new(tag_params)

		if @tag.save
			redirect_to :controller => 'admin/tags', :action => 'index'
		else
			flash.now[:notice] = "Erro"
			render 'new'
		end
	end

	def edit
		@tag = Tag.find(params[:id])
		render 'admin/tags/edit'
	end

	def update
		@tag = Tag.find(params[:id])

		if @tag.update(tag_params)
			redirect_to :controller => 'admin/tags', :action => 'index'
		else
			render 'edit'
		end
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		redirect_to 'admin/tags'
	end

	private
		def tag_params
			params.require(:tag).permit(:description)
		end
end
