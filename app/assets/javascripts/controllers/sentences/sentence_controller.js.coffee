App.SentenceController = Ember.Controller.extend
  needs: ["composer"]

  answersLength: (->
    length = @get("answers").length
    term = if length == 1 then 'answer' else 'answers'
    "#{length} #{term}"
  ).property('answers')

  actions:
    addAnswer: ->
      controller = @get("controllers.composer")

      title = "<h5>Add answer for <a href='#/sentences/#{@id}'><i>#{@get('sentence')}</i></a></h5>"
      controller.toggle(App.ComposerFormView.create(
        controller: App.ComposerFormController.create(title: title, type:'Answer')
      ))
