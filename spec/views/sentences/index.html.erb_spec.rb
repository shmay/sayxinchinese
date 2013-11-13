require 'spec_helper'

describe "sentences/index" do
  before(:each) do
    assign(:sentences, [
      stub_model(Sentence),
      stub_model(Sentence)
    ])
  end

  it "renders a list of sentences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
