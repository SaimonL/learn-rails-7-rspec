# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/new', type: :feature do
  let(:title) { 'Alice with wonderland' }
  let(:pages) { 128 }
  let(:isbn)  { '123-456-789-0' }

  describe 'with new book form' do
    before(:each) do
      visit '/books/new'

      within('form') do
        fill_in 'Title', with: title
        fill_in 'Pages', with: pages
        fill_in 'Isbn', with: isbn

        check 'In stock'
      end

      click_button 'Create Book'
    end

    it 'will create a new book' do
      expect(page).to have_content 'Book was successfully created'
    end

    context 'with created book' do
      subject { Book.last }

      its([:title])     { is_expected.to eq(title) }
      its([:pages])     { is_expected.to eq(pages) }
      its([:isbn])      { is_expected.to eq(isbn) }
      its([:in_stock])  { is_expected.to eq(true) }
    end
  end
end
