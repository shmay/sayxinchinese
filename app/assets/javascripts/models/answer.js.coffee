# for more details see: http://emberjs.com/guides/models/defining-models/
App = @App
attr = Ember.attr
hasMany = Ember.hasMany
belongsTo = Ember.belongsTo

App.Answer = Ember.Object.extend()

App.Answer.url = 'answers'
App.Answer.rootKey = 'answer'
App.Answer.collectionKey = 'answers'
App.Answer.adapter = Ember.RESTAdapter.create()
