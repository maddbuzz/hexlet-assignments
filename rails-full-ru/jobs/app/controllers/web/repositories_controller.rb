# frozen_string_literal: true

class Web::RepositoriesController < Web::ApplicationController
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
    
    # END
  end

  def update
    # BEGIN
    
    # END
  end

  def update_repos
    # BEGIN
    
    # END
  end

  # def to_moderate
  #   return unless @bulletin.may_to_moderate?

  #   @bulletin.to_moderate!
  #   redirect_to profile_path, notice: t('.success')
  # end

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
