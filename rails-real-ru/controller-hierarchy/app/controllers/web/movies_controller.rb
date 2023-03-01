# frozen_string_literal: true

module Web
  class MoviesController < Web::ApplicationController
    def index
      @movies = Movie.all
    end

    def show
      @movie = Movie.find params[:id]
    end

    def new
      @movie = Movie.new
    end

    def edit
      @movie = Movie.find params[:id]
    end

    def create
      @movie = Movie.new(permitted_movie_params)

      if @movie.save
        redirect_to movie_path(@movie), notice: t('success')
      else
        flash[:notice] = t('fail')
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @movie = Movie.find params[:id]

      if @movie.update(permitted_movie_params)
        redirect_to @movie, notice: t('success')
      else
        flash[:notice] = t('fail')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @movie = Movie.find params[:id]

      if @movie.destroy
        redirect_to movies_path, notice: t('.success')
      else
        redirect_to movies_path, notice: t('.fail')
      end
    end

    private

    def permitted_movie_params
      params.require(:movie).permit(:title, :description)
    end
  end
end
