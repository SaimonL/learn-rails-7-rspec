# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/books', type: :request do
  let(:invalid_attributes) { attributes_for(:book).merge(title: nil) }

  describe 'GET /index' do
    before(:each) do
      create(:book)
      get books_url
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    before(:each) do
      book = create(:book)
      get book_url(book)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    before { get new_book_url }

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    before(:each) do
      book = create(:book)
      get edit_book_url(book)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Book' do
        expect do
          post books_url, params: { book: attributes_for(:book) }
        end.to change(Book, :count).by(1)
      end

      it 'redirects to the created book' do
        post books_url, params: { book: attributes_for(:book) }
        expect(response).to redirect_to(book_url(Book.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Book' do
        expect do
          post books_url, params: { book: invalid_attributes }
        end.to change(Book, :count).by(0)
      end

      it 'to be unprocessable_entity' do
        post books_url, params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:book) { create(:book) }
      let(:new_title) { Faker::Book.title }

      it 'updates the requested book' do
        patch book_url(book), params: { book: { title: new_title } }
        book.reload
        expect(book.title).to eq(new_title)
      end

      it 'redirects to the book' do
        patch book_url(book), params: { book: { title: new_title } }
        book.reload
        expect(response).to redirect_to(book_url(book))
      end
    end

    context 'with invalid parameters' do
      let!(:book) { create(:book) }

      it 'renders a successful response (i.e. to display the \'edit\' template)' do
        patch book_url(book), params: { book: { title: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:book) { create(:book) }

    it 'destroys the requested book' do
      expect do
        delete book_url(book)
      end.to change(Book, :count).by(-1)
    end

    it 'redirects to the books list' do
      delete book_url(book)
      expect(response).to redirect_to(books_url)
    end
  end
end
