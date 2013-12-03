require 'spec_helper'

describe Answer do
  let(:user) { FactoryGirl.create(:user) }

  describe "answer load with data" do
    it "loads answers" do
      sentence = FactoryGirl.create(:sentence)
      FactoryGirl.create_list(:answer, 1, user_id: 1, sentence_id: sentence.id)

      answers = Answer.with_vote_data(sentence.id, user)
      answers.length.should eq(1)
    end

    it "calculate correctly" do
      sentence = FactoryGirl.create(:sentence)
      answer = FactoryGirl.create(:answer, sentence_id:sentence.id, user_id:user.id)

      FactoryGirl.create_list(:answer, 1, user_id: 1, sentence_id: sentence.id)
      FactoryGirl.create(:starring, user_id: user.id, answer_id: answer.id)

      answers = Answer.with_vote_data(sentence.id, user)
      yup = answers.find {|a| a.id == answer.id}
      yup.starred.should be_true

      nope = answers.find {|a| a.id != answer.id}
      nope.starred.should be_false

      # user.answers.count.should eq(1)
    end

    it "should have zero vote_count" do
      sentence = FactoryGirl.create(:sentence)
      answer = FactoryGirl.create(:answer, sentence_id:sentence.id, user_id:user.id)

      answers = Answer.with_vote_data(sentence.id, user)

      nocount = answers.find {|a| a.id == answer.id}

      nocount.other_votes_count.should == 0
    end

    it "should have negative vote_count" do
      sentence = FactoryGirl.create(:sentence)
      answer = FactoryGirl.create(:answer, sentence_id:sentence.id, user_id:user.id)

      vote = FactoryGirl.create_list(:other_downboat, 2, answer_id:answer.id)

      answers = Answer.with_vote_data(sentence.id, user)

      negcount = answers.find {|a| a.id == answer.id}

      negcount.other_votes_count.should == -2
    end
  end
end
