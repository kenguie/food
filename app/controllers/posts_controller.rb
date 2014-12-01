class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :follow, :unfollow] 

  def follow 
    @user = User.find(params[:id])
    @rel = Relationship.new(follower_id: current_user.id, followed_id: @user.id)
    if @rel.save
      UserMailer.followed_email(current_user, @post).deliver
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
      UserMailer.unfollowed_email(current_user, @post).deliver
      flash[:notice] = "Unfollowed!"
      redirect_to posts_path
    else
      flash[:alert] = "Something went wrong."
      redirect_to posts_path
    end
  end

  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 8)
    if current_user.posts.first != nil 
      @post = current_user.posts.first.id
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      @post.update :postname => @post.user.restname
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @user = Post.find(params[:id]).user.id
    @hash = Gmaps4rails.build_markers(@post.user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow user.restname
    end
  end

  def postuser
    @posts = Post.all
    @post = Post.find(params[:post_id])
  end

  def edit
  end

  def update
    if @post.update(post_params) 
      redirect_to @post
    else
      render :edit
    end
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
    params.require(:post).permit(:title, :body, :postname).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
