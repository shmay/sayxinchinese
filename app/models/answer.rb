class Answer < ActiveRecord::Base
  belongs_to :sentence
  belongs_to :user
  has_many :votes
  has_many :comments

  has_many :starrings
  has_many :user_starrings, through: :starrings, source: :user

  def self.with_vote_data(sentence_id,current_user)
    selects = ['answers.*', 'sum(votes.direction) as votes_count']
    if current_user
      selects << "sum(case when votes.user_id = #{current_user.id} then votes.direction else 0 end) AS user_votes"
    end
    where("answers.sentence_id = ?", sentence_id).
    select(selects).
    joins(%{
      LEFT JOIN "votes" ON "votes"."answer_id" = "answers"."id"
    }).
    group("answers.id")
  end
end
