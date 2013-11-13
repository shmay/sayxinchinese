# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sentences = File.open("#{Rails.root}/db/data/sentences.txt").read.split(/\n/)
languages = ["Mandarin", "Spanish", "English", "Hindi", "Arabic", "Portuguese", "Bengali", "Russian", "Japanese", "Punjabi", "German", "Javanese", "Wu", "Malay/Indonesian", "Telugu", "Vietnamese", "Korean", "French", "Marathi", "Tamil", "Urdu", "Persian", "Turkish", "Italian", "Cantonese", "Thai", "Gujarati", "Jin", "Min Nan", "Polish", "Pashto", "Kannada", "Xiang", "Malayalam", "Sundanese", "Hausa", "Oriya", "Burmese", "Hakka", "Ukrainian", "Bhojpuri", "Tagalog", "Yoruba", "Maithili", "Swahili", "Uzbek", "Sindhi", "Amharic", "Fula", "Romanian", "Oromo", "Igbo", "Azerbaijani", "Awadhi", "Gan", "Cebuano", "Dutch", "Kurdish", "Serbo-Croatian", "Malagasy", "Saraiki", "Nepali", "Sinhalese", "Chittagonian", "Zhuang", "Khmer", "Assamese", "Madurese", "Somali", "Marwari", "Magahi", "Haryanvi", "Hungarian", "Chhattisgarhi", "Greek", "Chewa", "Deccan", "Akan", "Kazakh", "Min Bei", "Sylheti", "Zulu", "Czech", "Kinyarwanda", "Dhundhari", "Haitian Creole", "Min Dong", "Ilokano", "Quechua", "Kirundi", "Swedish", "Hmong", "Shona", "Uyghur", "Hiligaynon", "Mossi", "Xhosa", "Belarusian", "Balochi", "Konkani"]

languages.each do |lang|
  Language.find_or_create_by_name lang
end

infos = ['sup bro', 'nah way', 'yer way']
names = ['Kyle Murph', 'jeebs', 'hurrr']
emails = ['kmurph73@gmail.com', 'heebs@jeebs.com', 'hurrdurr@jurr.com']

emails.length.times do |n|
  email = emails[n]

  if not User.find_by_email email
    User.create! email: email, password: 'pass1212', password_confirmation: 'pass1212', name:names[n], info:infos[n]
  end
end

english = Language.find_by_name "English"
mandarin = Language.find_by_name "Mandarin"

sentences.each do |s|
  if not Sentence.find_by_sentence s
    Sentence.create! sentence: s, language: english, user_id: 1, convert_id: mandarin.id
  end
end
