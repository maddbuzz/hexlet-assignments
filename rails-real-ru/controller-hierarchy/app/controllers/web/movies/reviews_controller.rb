# frozen_string_literal: true

module Web
  module Movies
    class ReviewsController < Web::Movies::ApplicationController
      def index
        @reviews = resource_movie.reviews.order(id: :desc)
      end

      def new
        # @review = Review.new
        @review = resource_movie.reviews.build
      end

      def edit
        @review = Review.find params[:id]
      end

      def create
        # @review = Review.new(permitted_review_params)
        @review = resource_movie.reviews.build(permitted_review_params)

        if @review.save
          redirect_to movie_reviews_path(resource_movie), notice: t('success')
        else
          flash[:notice] = t('fail')
          render :new, status: :unprocessable_entity
        end
      end

      def update
        @review = Review.find params[:id]

        if @review.update(permitted_review_params)
          redirect_to movie_reviews_path(resource_movie), notice: t('success')
        else
          flash[:notice] = t('fail')
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @review = Review.find params[:id]

        if @review.destroy
          redirect_to movie_reviews_path(resource_movie), notice: t('.success')
        else
          redirect_to movie_reviews_path(resource_movie), notice: t('.fail')
        end
      end

      private

      def permitted_review_params
        # params.require(:review).permit(:body, :movie_id)
        params.require(:review).permit(:body)
      end
    end
  end
end
