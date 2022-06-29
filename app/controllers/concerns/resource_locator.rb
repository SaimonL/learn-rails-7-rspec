# frozen_string_literal: true

# Move set methods in one place
module ResourceLocator
  extend ActiveSupport::Concern

  def find_book
    @book = Book.find(params[:book_id] || params[:id])
  end

  def find_page
    @page = Page.find(params[:page_id] || params[:id])
  end
end
