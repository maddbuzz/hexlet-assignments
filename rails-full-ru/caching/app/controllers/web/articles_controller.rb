# frozen_string_literal: true

class Web::ArticlesController < Web::ApplicationController
  # BEGIN
  
  # END

  def index
    @articles = Article.all
  end

  # BEGIN
  
  # END
end
