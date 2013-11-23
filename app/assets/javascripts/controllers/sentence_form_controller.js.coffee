App.SentenceFormController = Ember.Controller.extend
  explanation: ""
  sentence: ""

  createSentence: ->
    m = @get('model')
    m.setProperties @
    m.get('store').commit()

  reset: ->
    @set('explanation', '')
    @set('sentence', '')

  close: ->

  submit: ->
