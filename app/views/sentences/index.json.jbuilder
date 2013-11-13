json.sentences do
  json.array!(@sentences) do |sentence|
    json.extract! sentence, :id, :sentence

    json.user do |json|
      json.id sentence.user.id
      json.name sentence.user.name
    end
  end
end
