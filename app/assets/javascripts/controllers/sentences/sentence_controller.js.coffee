App.SentenceController = Ember.ObjectController.extend
  needs: ["composer"]

  actions:
    addAnswer: ->
      controller = @get("controllers.composer")

      answer = App.Answer.create(sentence_id: @get('id'))

      title = "<h5>Add answer for <a href='#/sentences/#{@get('id')}'><i>#{@get('sentence')}</i></a></h5>"
      controller.toggle(App.ComposerFormView.create(
        controller: App.ComposerFormController.create(
          title: title
          nestedController:App.AnswerFormController.create(model:answer)
          type: 'Answer'
        )
      ))

  setUp: (model) ->
    @set('model',model)
    @setProperties(model)
