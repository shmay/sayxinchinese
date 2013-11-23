json.sentences do
  json.array!(@sentences) do |sentence|
    json.extract! sentence, :id, :sentence

    json.answers_count sentence.answers.count

    json.user do |json|
      json.id sentence.user_id
      json.name sentence.user_name
    end
  end
end
