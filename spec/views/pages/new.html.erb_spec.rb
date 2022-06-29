require 'rails_helper'

RSpec.describe "pages/new", type: :view do
  before(:each) do
    assign(:page, Page.new(
      book: nil,
      content: "MyText",
      position: 1,
      is_published: false
    ))
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "input[name=?]", "page[book_id]"

      assert_select "textarea[name=?]", "page[content]"

      assert_select "input[name=?]", "page[position]"

      assert_select "input[name=?]", "page[is_published]"
    end
  end
end
