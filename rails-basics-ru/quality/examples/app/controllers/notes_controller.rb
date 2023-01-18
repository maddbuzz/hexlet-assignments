class NotesController < ApplicationController
  def index
    @notes = Note.all.order(created_at: :desc)
  end

  def show
    # debugger
    @note = Note.find(params[:id])
  end
end
