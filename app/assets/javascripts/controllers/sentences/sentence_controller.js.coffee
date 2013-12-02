App.SentenceController = Ember.ObjectController.extend
  needs: ["composer"]

  answersLength: (->
    model = @get('model')
    if model.isLoaded
      length = model.get("answers").content.length
      term = if length == 1 then 'answer' else 'answers'
      "#{length} #{term}"
  ).property('answers')

  actions:
    addAnswer: ->
      controller = @get("controllers.composer")

      sentence = @get('model')
      answer = sentence.get('answers').create(
        answer: ''
        sentence: sentence
      )

      title = "<h5>Add answer for <a href='#/sentences/#{@get('id')}'><i>#{@get('sentence')}</i></a></h5>"
      controller.toggle(App.ComposerFormView.create(
        controller: App.ComposerFormController.create(
          title: title
          type:'Answer'
          model: answer
          sentence: sentence
        )
      ))
