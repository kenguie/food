class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_comment, only: [:edit, :update, :destroy]
	before_action :set_post, only: [:new, :create, :edit, :update, :destroy]

	def index

	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = @post.comments.create(comments_params)
		@comment.user_id = current_user.id

		if @comment.save
			UserMailer.commented_email(current_user, @post).deliver
			redirect_to @post
		else
			render :new
		end
	end

	def show

	end

	def edit

	end

	def update
		if @comment.update(comments_params)
			flash[:notice] = 'Comment Updated.'
			redirect_to @post
		else
			flash[:alert] = 'There was a problem.'
			render :edit
		end
	end

	def destroy
		if @comment.destroy
			flash[:notice] = 'Comment deleted.'
			redirect_to post_path(@post)
		else
			flash[:alert] = 'There was a problem with comment deletion.'
			redirect_to @post
		end
	end

	private

	def comments_params
		params.require(:comment).permit(:title, :body).merge(post_id: current_user.id)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end

	def set_comment
		@comment = Comment.find(params[:id])
	end

end
