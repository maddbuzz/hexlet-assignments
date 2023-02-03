# frozen_string_literal: true

class WelcomeController < ApplicationController
  # before_action :call_debugger

  def index; end

  private

  def call_debugger
    debugger
  end
end
