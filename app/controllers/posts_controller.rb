class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy] 

  def follow 
    @user = User.find(params[:id])
    @rel = Relationship.new(follower_id: current_user.id, followed_id: @user.id)
    if @rel.save
      flash[:notice] = "You are now following " + @user.username 
      redirect_to posts_path
    else
      flash[:alert] = "Something went wrong with the follow"
      redirect_to posts_path
    end
  end

  def unfollow
    @user = User.find(params[:id])
    @rel = Relationship.where(follower_id: current_user.id, followed_id: @user.id).first
    if @rel && @rel.destroy 
      flash[:notice] = "Unfollowed!"
      redirect_to posts_path
    else
      flash[:alert] = "Something went wrong."
      redirect_to posts_path
    end
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @user = Post.find(params[:id]).user.id
  end

  def edit
  end

  def update
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: 'Post was deleted'
    else
      redirect_to posts_path, alert: 'There was a problem with deletion'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
