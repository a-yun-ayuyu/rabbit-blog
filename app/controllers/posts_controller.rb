class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_post, only: [:edit, :show, :destroy, :update]

  def index
    @posts = Post.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end
  
  def create
    Post.create(post_params)
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if post.user_id == current_user.id
  end 

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  private
  def post_params
    params.permit(:image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
   redirect_to action: :index unless user_signed_in?
  end

  def set_post
    @post = Post.find(params[:id])
  end
end