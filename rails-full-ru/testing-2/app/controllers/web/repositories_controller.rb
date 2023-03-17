# frozen_string_literal: true

# BEGIN
require 'octokit'
# END

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
      repo_link = permitted_params[:link]
      repo_full_name = repo_link.remove 'https://github.com/'
      client = Octokit::Client.new
      response = client.repo repo_full_name

      @repository = Repository.new
      @repository.link = repo_link
      @repository.owner_name = response.owner.login
      @repository.repo_name = response.name
      @repository.description = response.description
      @repository.default_branch = response.default_branch
      @repository.watchers_count = response.watchers_count
      @repository.language = response.language
      @repository.repo_created_at = response.created_at
      @repository.repo_updated_at = response.updated_at

      if @repository.save
        redirect_to repositories_path, notice: t('success')
      else
        flash[:alert] = t('fail')
        render :new, status: :unprocessable_entity
      end
      # END
    end

    def edit
      @repository = Repository.find params[:id]
    end

    def update
      @repository = Repository.find params[:id]

      if @repository.update(permitted_params)
        redirect_to repositories_path, notice: t('success')
      else
        flash[:notice] = t('fail')
        render :edit, status: :unprocessable_entity
      end
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

    def permitted_params
      params.require(:repository).permit(:link)
    end
  end
end
