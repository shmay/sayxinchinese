# for more details see: http://emberjs.com/guides/models/defining-models/

App.Sentence = DS.Model.extend
  sentence: DS.attr 'string'
  user: DS.belongsTo('App.User', {embedded:true})
  answers_count: DS.attr 'number'
