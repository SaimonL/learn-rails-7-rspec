# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/index', type: :feature do
  let!(:books) { [create(:book), create(:book)] }

  before(:each) { visit books_path }

  describe 'with headers' do
    it 'renders Title header' do
      assert_text 'Title:', count: 2
    end

    it 'renders Pages header' do
      assert_text 'Pages:', count: 2
    end

    it 'renders Isbn header' do
      assert_text 'Isbn:', count: 2
    end

    it 'renders In stock header' do
      assert_text 'In stock:', count: 2
    end
  end

  it 'will have new book link' do
    expect(page).to have_link('New book', href: new_book_path)
  end

  describe 'with first book' do
    let(:book) { books.first }

    it 'renders book title' do
      assert_text book.title.capitalize, count: 1
    end

    it 'renders book pages' do
      assert_text book.pages.to_s
    end

    it 'renders book isbn' do
      assert_text book.isbn, count: 1
    end

    it 'will have show link' do
      expect(page).to have_link('Show', href: book_path(book))
    end
  end

  describe 'with second book' do
    let(:book) { books.second }

    it 'renders book title' do
      assert_text book.title.capitalize, count: 1
    end

    it 'renders book pages' do
      assert_text book.pages.to_s
    end

    it 'renders book isbn' do
      assert_text book.isbn, count: 1
    end

    it 'will have show link' do
      expect(page).to have_link('Show', href: book_path(book))
    end
  end

  describe 'with new book click' do
    before(:each) do
      click_link 'New book'
      wait_for { current_path }.to eq(new_book_path)
    end

    it 'will go to new book' do
      expect(page).to have_content 'New book'
    end
  end
end
