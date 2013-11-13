require 'spec_helper'

describe "sentences/new" do
  before(:each) do
    assign(:sentence, stub_model(Sentence).as_new_record)
  end

  it "renders new sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sentences_path, "post" do
    end
  end
end
