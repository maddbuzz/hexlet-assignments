class PagesController < ApplicationController
  before_action :set_book, only: %i[ index new create ]
  before_action :set_page, only: %i[ show edit update destroy ]

  # GET /book/1/pages
  def index
    @pages = @book.pages
  end

  # GET /pages/1
  def show
  end

  # GET book/1//pages/new
  def new
    @page = @book.pages.build
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /book/1/pages
  def create
    @page = @book.pages.build(page_params)

    if @page.save
      redirect_to book_path(@book), notice: "Page was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to book_path(@page.book), notice: "Page was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    format.html { redirect_to pages_url, notice: "Page was successfully destroyed." }
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:body, :book_id)
  end
end
