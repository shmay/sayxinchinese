# for more details see: http://emberjs.com/guides/models/defining-models/

App.Sentence = Ember.Object.extend
  save: ->
    debugger

App.Sentence.reopenClass
  find: (id) ->
    $.getJSON("/sentences/#{id}").then(
      ((response) =>
        sentence = App.Sentence.create(response.sentence)
        answers = Em.A()
        for ans in response.answers
          answers.pushObject(App.Answer.create(ans))

        sentence.set('answers',answers)
        sentence.set('isLoaded', true)
      ),
      ((errResp) =>
        debugger
      )
    )
  findAll: (subreddit) ->
    $.getJSON('/sentences').then ( (response) ->
      response.sentences.map (sentence) -> App.Sentence.create sentence
    ), ( (errResp) =>
      debugger
    )
