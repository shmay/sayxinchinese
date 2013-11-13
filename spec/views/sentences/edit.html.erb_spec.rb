require 'spec_helper'

describe "sentences/edit" do
  before(:each) do
    @sentence = assign(:sentence, stub_model(Sentence))
  end

  it "renders the edit sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sentence_path(@sentence), "post" do
    end
  end
end
