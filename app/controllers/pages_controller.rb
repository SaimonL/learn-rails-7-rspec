# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :find_book
  before_action :find_page, only: %i[ show edit update destroy ]

  def index
    @pages = @book.pages
  end

  def show; end

  def new
    @page = @book.pages.new
  end

  def edit; end

  def create
    @page = @book.pages.new(page_params)

    if @page.save
      redirect_to [@book, @page], notice: 'Page was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @page.update(page_params)
      redirect_to [@book, @page], notice: 'Page was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @page.destroy
    redirect_to book_pages_path(@book), notice: 'Page was successfully destroyed.'
  end

  private

    def page_params
      params.require(:page).permit(:content, :position, :is_published)
    end
end
