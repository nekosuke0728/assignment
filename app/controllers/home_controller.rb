class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new   
  end

  # def show
  #   @post = Post.find_by(id: params[:id])
  # end

  def create
    @post = Post.new(content: params[:content])
    @post.user_id = current_user.id
    @post.save
    # @post = Post.create(post_params)
    redirect_to("/")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to('/')    
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to('/')  
  end

  private
  
  def post_params
    params.permit(:content, :user_id)
  end

end
