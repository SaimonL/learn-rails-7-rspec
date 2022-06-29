require 'rails_helper'

RSpec.describe "pages/edit", type: :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      book: nil,
      content: "MyText",
      position: 1,
      is_published: false
    ))
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", page_path(@page), "post" do

      assert_select "input[name=?]", "page[book_id]"

      assert_select "textarea[name=?]", "page[content]"

      assert_select "input[name=?]", "page[position]"

      assert_select "input[name=?]", "page[is_published]"
    end
  end
end
