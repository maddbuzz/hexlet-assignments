# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :set_post

    def edit
      @comment = Post::Comment.find(params[:id])
    end

    def create
      @comment = @post.comments.build(comment_params)

      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        redirect_to @post, alert: 'Comment has not been added'
      end
    end

    def update
      @comment = Post::Comment.find(params[:id])

      if @comment.update(comment_params)
        redirect_to @post, notice: 'Comment was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @comment = Post::Comment.find(params[:id])
      @comment.destroy

      redirect_to @post
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:post_comment).permit(:body)
    end
  end
end
