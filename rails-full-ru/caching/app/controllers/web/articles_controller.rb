# frozen_string_literal: true

module Web
  class ArticlesController < Web::ApplicationController
    # BEGIN
    caches_action :show
    # END

    def index
      @articles = Article.all
    end

    # BEGIN
    def show
      @article = Article.find params[:id]
    end
    # END
  end
end
