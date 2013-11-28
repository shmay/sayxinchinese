json.answers do
  json.array!(@answers) do |answer|
    json.extract! sentence, :id, :answer
  end
end
