# for more details see: http://emberjs.com/guides/models/defining-models/
attr = Ember.attr
hasMany = Ember.hasMany

Sentence = @App.Sentence = Ember.Model.extend
  id: attr()
  sentence: attr()
  explanation: attr()
  answers: hasMany('App.Answer', {key: 'answers', embedded: true})

Sentence.url = 'sentences'
Sentence.rootKey = 'sentence'

Sentence.collectionKey = 'sentences'
Sentence.adapter = Ember.RESTAdapter.create()
