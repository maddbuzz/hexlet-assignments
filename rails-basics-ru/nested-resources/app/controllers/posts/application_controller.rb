# frozen_string_literal: true

module Posts
  class ApplicationController < ApplicationController
    def resource_post
      @resource_post ||= Post.find params[:post_id]
    end
  end
end
