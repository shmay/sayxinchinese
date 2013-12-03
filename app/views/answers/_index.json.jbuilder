json.answers do
  json.array!(@answers) do |answer|
    json.extract! answer, :created_at, :id, :answer, :sentence_id, :starred, :other_votes_count, :user_votes

    json.user do
      json.name answer.user.name
      json.id answer.user.id
    end
  end
end
