# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/show', type: :feature do
  let!(:book) { create(:book) }

  before(:each) { visit book_path(book) }

  describe 'with labels' do
    it 'renders Title header' do
      assert_text 'Title:', count: 1
    end

    it 'renders Pages header' do
      assert_text 'Pages:', count: 1
    end

    it 'renders Isbn header' do
      assert_text 'Isbn:', count: 1
    end

    it 'renders In stock header' do
      assert_text 'In stock:', count: 1
    end
  end

  describe 'with book' do
    it 'renders book title' do
      assert_text book.title.capitalize, count: 1
    end

    it 'renders book pages' do
      assert_text book.pages.to_s
    end

    it 'renders book isbn' do
      assert_text book.isbn, count: 1
    end
  end

  describe 'with links' do
    subject { page }

    it { is_expected.to have_link('Edit this book', href: edit_book_path(book)) }
    it { is_expected.to have_link('Back to books', href: books_path) }
    it { is_expected.to have_button('Destroy this book') }

    context 'with edit button' do
      before(:each) { click_link 'Edit this book' }

      it 'will go to edit book' do
        expect(page).to have_content 'Editing book'
      end
    end

    context 'with Back to books button' do
      before(:each) { click_link 'Back to books' }

      it 'will go back to books' do
        expect(page).to have_content 'Books'
      end
    end

    context 'with Destroy this book button' do
      before(:each) do
        click_button 'Destroy this book'
        wait_for { current_path }.to eq(books_path)
      end

      it 'will destroy the book' do
        expect { click_button('Destroy this book').to change(Book, :count).by(-1) }
      end
    end
  end
end
