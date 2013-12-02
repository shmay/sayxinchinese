json.sentence do
  json.extract! @sentence, :id, :sentence, :created_at

  json.user do |json|
    json.id @user.id
    json.name @user.name
  end
end

json.partial! 'answers/index'
