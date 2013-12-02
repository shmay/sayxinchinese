# for more details see: http://emberjs.com/guides/models/defining-models/
App = @App
attr = Ember.attr
hasMany = Ember.hasMany
belongsTo = Ember.belongsTo

App.Answer = Ember.Model.extend
  id: attr()
  answer: attr()
  explanation: attr()
  votes: attr(Number)
  created_at: attr(Date)
  sentence: belongsTo('App.Sentence', 'sentence_id')

App.Answer.url = 'answers'
App.Answer.rootKey = 'answer'
App.Answer.collectionKey = "answer"
App.Answer.adapter = Ember.RESTAdapter.create()
