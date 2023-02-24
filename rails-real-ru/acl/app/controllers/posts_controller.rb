# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def index
    @posts = Post.all
  end

  def show
    set_post
  end

  def new
    raise Pundit::NotAuthorizedError, 'guest should raise error from new' unless signed_in?

    @post = current_user.posts.build
    authorize @post
  end

  def create
    raise Pundit::NotAuthorizedError, 'guest cant create post' unless signed_in?

    @post = current_user.posts.build(post_params)
    authorize @post

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
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
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    set_post
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :author_id
    )
  end
  # END
end
