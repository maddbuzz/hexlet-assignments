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
        RepositoryLoaderJob.perform_later @repository.id
  
        redirect_to repository_path(@repository), notice: t('success')
      else
        flash[:notice] = t('fail')
        render :new, status: :unprocessable_entity
      end
      # END
    end

    def update
      # BEGIN
      @repository = Repository.find params[:id]

      RepositoryLoaderJob.perform_later @repository.id
  
      redirect_to repositories_path, notice: t('success')
      # END
    end

    def update_repos
      # BEGIN
      repositories = Repository.all

      repositories.each do |repository|
        RepositoryLoaderJob.perform_later repository.id
      end
  
      redirect_to repositories_path, notice: t('success')
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
