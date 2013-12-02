App.SentenceController = Ember.ObjectController.extend
  needs: ["composer"]

  answersLength: (->
    length = @get("answers").length
    term = if length == 1 then 'answer' else 'answers'
    "#{length} #{term}"
  ).property('answers')

  actions:
    addAnswer: ->
      controller = @get("controllers.composer")

      answer = App.Answer.create(sentence_id: @get('id'))

      title = "<h5>Add answer for <a href='#/sentences/#{@get('id')}'><i>#{@get('sentence')}</i></a></h5>"
      controller.toggle(App.ComposerFormView.create(
        controller: App.ComposerFormController.create(
          title: title
          nestedController:App.AnswerFormController(model:answer)
          type:'Answer'
        )
      ))

  setUp: (model) ->
    @set('model',model)
    @setProperties(model)
