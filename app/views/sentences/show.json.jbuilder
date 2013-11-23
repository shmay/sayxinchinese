json.sentence do
  json.extract! @sentence, :id, :sentence, :created_at

  json.answers_count @sentence.answers.count

  json.user do |json|
    json.id @user.id
    json.name @user.name
  end
end
