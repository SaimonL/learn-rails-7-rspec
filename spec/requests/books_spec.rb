# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/books', type: :request do
  let(:invalid_attributes) { attributes_for(:book).merge(title: nil) }

  before(:all) { @book = create(:book) }

  describe 'GET /index' do
    before(:each) { get books_path }

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    before(:each) { get book_path(@book) }

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    before { get new_book_path }

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    before(:each) { get edit_book_path(@book) }

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Book' do
        expect do
          post books_path, params: { book: attributes_for(:book) }
        end.to change(Book, :count).by(1)
      end

      it 'redirects to the created book' do
        post books_path, params: { book: attributes_for(:book) }
        expect(response).to redirect_to(book_path(Book.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Book' do
        expect do
          post books_path, params: { book: invalid_attributes }
        end.to change(Book, :count).by(0)
      end

      it 'to be unprocessable_entity' do
        post books_path, params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:book) { create(:book) }
      let(:new_title) { Faker::Book.title }

      it 'updates the requested book' do
        patch book_path(book), params: { book: { title: new_title } }
        book.reload
        expect(book.title).to eq(new_title)
      end

      it 'redirects to the book' do
        patch book_path(book), params: { book: { title: new_title } }
        book.reload
        expect(response).to redirect_to(book_path(book))
      end
    end

    context 'with invalid parameters' do
      let!(:book) { create(:book) }

      it 'renders a successful response (i.e. to display the \'edit\' template)' do
        patch book_path(book), params: { book: { title: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:book) { create(:book) }

    it 'destroys the requested book' do
      expect do
        delete book_path(book)
      end.to change(Book, :count).by(-1)
    end

    it 'redirects to the books list' do
      delete book_path(book)
      expect(response).to redirect_to(books_path)
    end
  end
end
