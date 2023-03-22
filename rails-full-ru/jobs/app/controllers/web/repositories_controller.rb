# frozen_string_literal: true

require 'octokit'

module Web
  class RepositoriesController < Web::ApplicationController
    def index
      @repositories = Repository.all
    end

    def new
      @repository = Repository.new
    end

    def show
      @repository = Repository.find params[:id]
    end

    def create
      # BEGIN
      @repository = Repository.new(permitted_params)
      if @repository.save
        perform_fetchin_later(@repository)
        redirect_to repository_url(@repository)
        # redirect_to repositories_url
      else
        flash[:alert] = t('fail')
        render :new, status: :unprocessable_entity
      end
      # END
    end

    def update
      # BEGIN
      @repository = Repository.find params[:id]
      if @repository.update(permitted_params)
        perform_fetchin_later(@repository)
      else
        flash[:alert] = t('fail')
      end
      redirect_to repositories_url
      # END
    end

    def update_repos
      # BEGIN
      Repository.all.each do |repository|
        perform_fetchin_later(repository)
      end
      redirect_to repositories_url
      flash[:notice] = t('repos updated?')
      # END
    end

    def destroy
      @repository = Repository.find params[:id]

      if @repository.destroy
        redirect_to repositories_path, notice: t('success')
      else
        redirect_to repositories_path, notice: t('fail')
      end
    end

    private

    def perform_fetchin_later(repository)
      return unless repository.may_to_fetching?

      repository.to_fetching!
      RepositoryLoaderJob.perform_later(repository.id)
    end

    def permitted_params
      # params.require(:repository).permit(:link)
      # debugger
      params.require(:repository).permit(:link, :id)
    end
  end
end
