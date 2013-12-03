App.SentenceAnswersController = Ember.ArrayController.extend
  answersLength: (->
    length = @get('length')
    term = if length == 1 then 'answer' else 'answers'
    "#{length} #{term}"
  ).property('controller')

  itemController: 'answer'
