class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable,
  #  :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :lockable #:token_authenticatable

  has_many :votes
  has_many :comments
  has_many :answers
  has_many :sentences
  has_many :starrings
  has_many :saved_answers, through: :starrings, source: :answer

  def self.karma(user_id)
    selects = [
      '(
          coalesce((sum(votes.direction) * 3), 0)  +
          coalesce(count(distinct(user_votes.id)),0) +
          coalesce(count(distinct(sentences.id)),0) +
          coalesce(count(distinct(answers.id)),0)
        ) as calculated_karma',
    ]
    query = select(selects).
    joins(%{
      LEFT JOIN "sentences" ON "sentences"."user_id" = "users"."id"
      LEFT JOIN "answers" ON "answers"."user_id" = "users"."id"
      LEFT JOIN "votes" ON "votes"."answer_id" = "answers"."id" OR
        "votes"."sentence_id" = "sentences"."id"
      LEFT JOIN "votes" AS user_votes ON "user_votes"."user_id" = "users"."id"
    }).
    where("users.id = #{user_id}").
    group("users.id").
    first.calculated_karma
  end
end
