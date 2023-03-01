# frozen_string_literal: true

module Web
  module Movies
    class CommentsController < Web::Movies::ApplicationController
      def index
        @comments = resource_movie.comments.order(id: :desc)
      end

      def new
        # @comment = Comment.new
        @comment = resource_movie.comments.build
      end

      def edit
        @comment = Comment.find params[:id]
      end

      def create
        # @comment = Comment.new(permitted_comment_params)
        @comment = resource_movie.comments.build(permitted_comment_params)

        if @comment.save
          redirect_to movie_comments_path(resource_movie), notice: t('success')
        else
          flash[:notice] = t('fail')
          render :new, status: :unprocessable_entity
        end
      end

      def update
        @comment = Comment.find params[:id]

        if @comment.update(permitted_comment_params)
          redirect_to movie_comments_path(resource_movie), notice: t('success')
        else
          flash[:notice] = t('fail')
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @comment = Comment.find params[:id]

        if @comment.destroy
          redirect_to movie_comments_path(resource_movie), notice: t('.success')
        else
          redirect_to movie_comments_path(resource_movie), notice: t('.fail')
        end
      end

      private

      def permitted_comment_params
        # params.require(:comment).permit(:body, :movie_id)
        params.require(:comment).permit(:body)
      end
    end
  end
end
