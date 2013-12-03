# for more details see: http://emberjs.com/guides/models/defining-models/

App.Answer = Ember.Object.extend
  save: (options) ->

  vote: (dir) ->
    dir = parseInt(dir)
    oldDir = @get('user_votes')
    newDir = if dir == oldDir then 0 else dir

    @set('user_votes', newDir)

    $.ajax
      url: "/answers/#{@get('id')}/vote"
      method: 'POST'
      dataType: 'json'
      data:
        newDir: newDir
      success: (resp) => @set('user_votes', resp.dir)
      error: =>
        @set('user_votes', oldDir)
        alert('error')

  toggleStarred: (options) ->
    @set('user_votes', dir)

    $.ajax
      url: "/answers/#{@get('id')}/toggle_starring"
      method: 'POST'
      dataType: 'json'
      success: (resp) => @set('starred', resp.starred)
      error: options.error
