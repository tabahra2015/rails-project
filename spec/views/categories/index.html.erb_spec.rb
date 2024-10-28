require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        nickname: "Nickname",
        title: "Title"
      ),
      Category.create!(
        nickname: "Nickname",
        title: "Title"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", text: "Nickname".to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
