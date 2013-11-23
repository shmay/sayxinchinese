App.NewSentenceView = Ember.View.extend
  templateName: 'sentences/new'

  submit: (e) ->
    e.preventDefault()
    @get('controller').send('addShift')
