require 'rails_helper'

RSpec.describe 'books/edit', type: :feature do
  let(:title) { 'Alice with wonderland' }
  let(:pages) { 128 }
  let(:isbn)  { '123-456-789-0' }

  before(:each) do
    @book = create(:book, in_stock: false)

    visit edit_book_path(@book)

    within('form') do
      fill_in 'Title', with: title
      fill_in 'Pages', with: pages
      fill_in 'Isbn', with: isbn

      check 'In stock'
    end

    click_button 'Update Book'
    wait_for { current_path }.to eq(book_path(@book))
  end

  it 'will update the book' do
    expect(page).to have_content 'Book was successfully updated'
  end

  context 'with updated book' do
    subject { @book.reload }

    its([:title])     { is_expected.to eq(title) }
    its([:pages])     { is_expected.to eq(pages) }
    its([:isbn])      { is_expected.to eq(isbn) }
    its([:in_stock])  { is_expected.to eq(true) }
  end
end
