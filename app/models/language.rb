class Language < ActiveRecord::Base
  #extend FriendlyId
  #friendly_id :name, use: :slugged

  has_many :sentences
  has_many :targets, foreign_key: "convert_id", class_name: "Sentence"

  has_many :answers, through: :sentences
end
