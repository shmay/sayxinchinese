json.answer do
  json.extract! @answer, :id, :answer, :explanation, :sentence_id, :created_at
  json.sentence @answer.sentence_id
end

