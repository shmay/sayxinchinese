class Answer < ActiveRecord::Base
  belongs_to :sentence
  belongs_to :user
  has_many :votes
  has_many :comments

  has_many :starrings
  has_many :user_starrings, through: :starrings, source: :user

  def self.with_vote_data(sentence_id,current_user)
    selects = [
      'answers.*',
      "coalesce(sum(case when votes.user_id != #{current_user.id} then votes.direction else 0 end),0) as other_votes_count",
      'bool(count(starrings.user_id) > 0) AS starred'
    ]

    if current_user
      selects << "sum(case when votes.user_id = #{current_user.id} then votes.direction else 0 end) AS user_votes"
    end

    where("answers.sentence_id = ?", sentence_id).
    select(selects).
    joins(%{
      LEFT JOIN "votes" ON "votes"."answer_id" = "answers"."id"
      LEFT JOIN "starrings" ON "starrings"."answer_id" = "answers"."id" AND "starrings"."user_id" = #{current_user.id}
    }).
    group("answers.id")
  end
end
