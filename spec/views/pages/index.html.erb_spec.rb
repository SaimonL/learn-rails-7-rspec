require 'rails_helper'

RSpec.describe "pages/index", type: :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        book: nil,
        content: "MyText",
        position: 2,
        is_published: false
      ),
      Page.create!(
        book: nil,
        content: "MyText",
        position: 2,
        is_published: false
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
