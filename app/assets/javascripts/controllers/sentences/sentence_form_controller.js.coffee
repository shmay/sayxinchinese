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

  submit: ->
    m = @get('model')
    m.setProperties @
    @save(m)

  save: (m) ->
    # Local commit - author record goes in Flight state
    m.get('transaction').commit()
