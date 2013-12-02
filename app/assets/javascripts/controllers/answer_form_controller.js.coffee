App.AnswerFormController = Ember.Controller.extend
  reset: ->
    @set('explanation', '')
    @set('answer', '')

  submit: ->
    m = @get('model')
    m.setProperties @
    #@get('sentence').get('answers').save()
    m.on 'didSaveRecord', (model) =>
      @get('sentence').get('answers').pushObject m

    m.save()

