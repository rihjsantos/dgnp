class Admin::CategoriesController < AdminController
	def index
		render 'admin/category/index'
	end

	def new		
		render 'admin/category/new'
	end

	def create
	    @category = Category.new(category_params)
		 
		if @category.save
			redirect_to 'admin/categories'
	    else
	    	render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])

		if @category.update(category_params)
			redirect_to 'admin/categories'
		else
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy

		redirect_to 'admin/categories'
	end
 
	private
		def category_params
			params.require(:category).permit(:description)
		end
end
