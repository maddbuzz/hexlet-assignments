# frozen_string_literal: true

module Web
  module Movies
    class ReviewsController < Web::Movies::ApplicationController
      def index
        @reviews = resource_movie.reviews.order(id: :desc)
      end

      def new
        @review = resource_movie.reviews.new
      end

      def edit
        @review = resource_movie.reviews.find params[:id]
      end

      def create
        @review = resource_movie.reviews.new(permitted_review_params)

        if @review.save
          redirect_to movie_reviews_path, notice: t('success')
        else
          flash[:notice] = t('fail')
          render :new, status: :unprocessable_entity
        end
      end

      def update
        @review = resource_movie.reviews.find params[:id]

        if @review.update(permitted_review_params)
          redirect_to movie_reviews_path, notice: t('success')
        else
          flash[:notice] = t('fail')
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @review = resource_movie.reviews.find params[:id]

        if @review.destroy
          redirect_to movie_reviews_path, notice: t('success')
        else
          redirect_to movie_reviews_path, notice: t('fail')
        end
      end

      private

      def permitted_review_params
        params[:review].permit(:body)
      end
    end
  end
end
