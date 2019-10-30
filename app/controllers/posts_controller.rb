class PostsController < ApplicationController
	 # before_action :find_post, only: [:show, :update, :edit, :destroy]

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def new
		if session[:user_id].present?
@post = Post.new
else
redirect_to root_url
	end

		
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
		@alllikes = Like.where(:post_uid=>params[:id]).count
	end

	def update
@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path

	end

	private

	def post_params
		params.require(:post).permit(:title, :content,:image,:userid)
	end

	# def find_post
	# 	@post = Post.find(params[:id])
	# end

end