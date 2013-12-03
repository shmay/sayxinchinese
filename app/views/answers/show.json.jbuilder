json.answer do
  json.extract! @answer, :id, :answer, :explanation, :sentence_id, :created_at, :voted, :other_votes_count
  json.user do
    json.name @answer.user.name
    json.id @answer.user.id
  end
end
