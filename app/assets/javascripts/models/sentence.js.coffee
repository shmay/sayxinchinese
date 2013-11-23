# for more details see: http://emberjs.com/guides/models/defining-models/

App.Sentence = DS.Model.extend
  sentence: DS.attr 'string', default: ''
  user: DS.belongsTo('App.User', {embedded:true})
  answers_count: DS.attr 'number'
  explanation: DS.attr 'string', default: ''
  created_at: DS.attr 'date'
