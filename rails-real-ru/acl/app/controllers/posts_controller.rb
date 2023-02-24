# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # @post = Post.new
    # authorize @post
    authorize Post
    @post = current_user.posts.build
  end

  def create
    authorize Post
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_post
  end

  def update
    set_post

    if @post.update(post_params)
      redirect_to @post, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    set_post
    @post.destroy
    redirect_to posts_url, notice: t('.success')
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
  # END
end
