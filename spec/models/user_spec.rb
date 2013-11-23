require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  describe "karma calculation" do
    it "should calc with just votes" do
      list = FactoryGirl.create_list(:upboat_for_answer, 25, user_id: 1)
      karma = User.karma(user.id)
      karma.should eq(25)
      # user.answers.count.should eq(1)
    end

    it "should calc with votes on user's answers" do
      answer = FactoryGirl.create(:answer, user_id: 1)
      vote = FactoryGirl.create_list(:rand_user_boat, 2, answer_id: answer.id)

      karma = User.karma(user.id)
      karma.should eq(7)
      # user.answers.count.should eq(1)
    end

    it "should calc with votes with sentence, answers, votes" do
      # +2
      answer = FactoryGirl.create(:answer, user_id: 1)
      sentence = FactoryGirl.create(:sentence, user_id: 1)

      # +6
      vote = FactoryGirl.create_list(:rand_user_boat, 2, answer_id: answer.id)
      # +6
      vote = FactoryGirl.create_list(:rand_user_boat, 2, sentence_id: sentence.id)

      karma = User.karma(user.id)
      karma.should eq(14)
      # user.answers.count.should eq(1)
    end
  end
end
