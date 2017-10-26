class BlogsController < ApplicationController

	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def create
		@blog = Blog.new(blog_params)

		respond_to do |format|
			if @blog.save
				format.html { redirect_to @blog, notice: 'Your post is now live.' }
			else
				format.html { render :new }
			end
		end
	end

	def update
		@blog = Blog.find(params[:id])

		respond_to do |format|
			if @blog.update(blog_params)
				format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		respond_to do |format|
			format.html { redirect_to blogs_url, notice: 'Post was removed.' }
			format.json { head :no_content }
		end
	end

	def show
		@blog = Blog.find(params[:id])
	end

	private

	def blog_params
		params.require(:blog).permit(:title, :body, :author)
	end

end
