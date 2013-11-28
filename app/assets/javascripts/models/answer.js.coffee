# for more details see: http://emberjs.com/guides/models/defining-models/
App = @App

App.Answer = Ember.Model.extend
  id: attr()
  answer: attr()
  explanation: attr()
  votes: attr(Number)
  created_at: attr(Date)

App.Answer.url = 'answers'
