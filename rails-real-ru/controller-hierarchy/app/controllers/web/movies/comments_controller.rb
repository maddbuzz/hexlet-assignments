# frozen_string_literal: true

module Web
  module Movies
    class CommentsController < Web::Movies::ApplicationController
      def index
        @comments = resource_movie.comments.order(id: :desc)
      end

      def new
        @comment = resource_movie.comments.new
      end

      def edit
        @comment = resource_movie.comments.find params[:id]
      end

      def create
        @comment = resource_movie.comments.new(permitted_comment_params)

        if @comment.save
          redirect_to movie_comments_path, notice: t('success')
        else
          flash[:notice] = t('fail')
          render :new, status: :unprocessable_entity
        end
      end

      def update
        @comment = resource_movie.comments.find params[:id]

        if @comment.update(permitted_comment_params)
          redirect_to movie_comments_path, notice: t('success')
        else
          flash[:notice] = t('fail')
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @comment = resource_movie.comments.find params[:id]

        if @comment.destroy
          redirect_to movie_comments_path, notice: t('success')
        else
          redirect_to movie_comments_path, notice: t('fail')
        end
      end

      private

      def permitted_comment_params
        params[:comment].permit(:body)
      end
    end
  end
end
