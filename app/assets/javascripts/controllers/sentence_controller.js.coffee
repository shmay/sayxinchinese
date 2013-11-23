App.SentenceController = Ember.Controller.extend
  explanation: ""
  sentence: ""
  isMobile: false
  preview: false

  notMobileOrPreview: (->
    !@get('isMobile') or @get('preview')
  ).property('preview', 'isMobile')

  showPreview: -> @set('preview', true)
  showForm: -> @set('preview', false)

  createSentence: ->
    m = @get('model')
    m.setProperties @
    m.get('store').commit()

  reset: ->
    @set('explanation', '')
    @set('sentence', '')

  close: ->
