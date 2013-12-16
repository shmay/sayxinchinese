App.AnswerController = Ember.ObjectController.extend
  needs: ["composer"]

  starAnswer: ->
    m = @get('model')

    m.toggleStarred
      error: (resp) ->
        m.set('starred',oldStarred)
        alert('there was an error while trying to perform this action')

  totalVotesCount: (->
    @get('other_votes_count') + @get('user_votes')
  ).property('other_votes_count', 'user_votes')


  upboated: (->
    @get('user_votes') == 1
  ).property('user_votes')

  downboated: (->
    @get('user_votes') == -1
  ).property('user_votes')

  upboat: -> @get('model').vote(1)

  downboat: -> @get('model').vote(-1)

  answerClasses: (->
    classes = "fa pointer tip"
    if @get('starred')
      classes += "starred fa-star"
    else
      classes += "fa-star-o"

    classes
  ).property('starred')

  actions:
    editAnswer: ->
      controller = @get("controllers.composer")

      m = @get('model')
      title = "<h5>Edit answer <i>#{m.get('answer')}</i></h5>"

      controller.toggle(
        model:m
        kind: 'answer'
      )
