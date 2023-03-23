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
      @article = Article.find(params[:id])
      @article.last_reading_date = Time.now
      @article.save!
    end
    # END
  end
end
