json.answers do
  json.array!(@answers) do |answer|
    json.extract! answer, :id, :answer
    json.voted true
  end
end
