class Sentence < ActiveRecord::Base
  belongs_to :language
  belongs_to :user
  has_many :answers

  validates :convert_id, presence: true
  validates :language_id, presence: true
  validates :sentence, presence: true, length: { minimum: 10 }

  belongs_to :target, foreign_key: "convert_id", class_name: "Language"

  def self.all_with_data
    selects = [
      'sentences.*',
      'count(distinct(answers.id))',
      'users.name as user_name',
      'users.id as user_id' ]
    select(selects).
    joins(%{
      LEFT JOIN users ON users.id = sentences.user_id
      LEFT JOIN "answers" ON "answers"."sentence_id" = "sentences"."id"
    }).
    group('sentences.id,users.id')
  end

  def target_name
    target ? target.name : ""
  end

  def translation
    Answer.where(sentence_id: self.id).first
  end

end
