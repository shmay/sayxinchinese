# for more details see: http://emberjs.com/guides/views/

App.SentencesView = Ember.View.extend
  templateName: 'sentences/sentences'

  didInsertElement: ->
    #@$('button').click()
    controller = @get('controller')
