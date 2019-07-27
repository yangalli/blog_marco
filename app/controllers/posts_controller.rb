class PostsController < ApplicationController
  def index
    @categories = Category.all
    if params.has_key?(:category)
      @category = Category.find_by_name(params[:category])
      @posts = Post.where(category: @category)
    else
      @posts = Post.all.order("created_at DESC")
    end
  end

  def new
    @post = Post.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @post = Post.new(post_params)
    @post.category_id = params[:category_id] 

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.category_id = params[:category_id]

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :photo)
  end
end
