class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    if current_user.admin == false
      redirect_to root_path
      flash[:alert] = "Somente Admins podem fazer criação de novos posts."
    end
  end

  def create
    @post = Post.new(post_params)
    agora = Time.now
    @post.data = agora.strftime("%d/%m/%Y - %H:%M:%S")
    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :img_url, :data, :autor)
  end
end
