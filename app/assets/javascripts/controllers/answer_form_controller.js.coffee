App.AnswerFormController = Ember.Controller.extend
  reset: ->
    @set('explanation', '')
    @set('answer', '')
