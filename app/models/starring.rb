class Starring < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  belongs_to :sentence
end
