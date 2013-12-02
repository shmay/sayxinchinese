require 'spec_helper'
require 'debugger'

describe "Answers" do
  describe "POST 'create'" do
    before(:each) do
      @answer = FactoryGirl.create(:answer)
      post '/answers', answer: FactoryGirl.attributes_for(:answer, sentence_id: 1), :format => :json
    end

    it "should be successful" do
      response.should be_success
    end

    it "it should return correct json" do
      body = JSON.parse(response.body)
      ans = body['answer']
      ans['answer'].should == @answer.answer
      ans['explanation'].should == 'yup'
      ans['sentence_id'].should == 1
    end
  end
  #it "should create answer"
  #  answer = Factory(:answer)
  #  post :create, answer: answer
  #end
end
