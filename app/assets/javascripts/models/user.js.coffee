App.User = Ember.Object.extend
  save: (attrs) ->
    @setProperties attrs
    @set('isSaving', true)
    $.ajax
      url: "/users/#{@id}"
      dataType: 'json'
      type: 'PATCH'
      data:
        user: attrs
      success: (resp) =>
        @setProperties resp.user
        @set('isSaving', false)
      error: (resp) =>
        # @setProperties resp.oldProperties
        @set('isSaving', false)
        @set('hasErred', true)

App.User.reopenClass
  find: (id) ->
    $.getJSON("/profiles/#{id}").then(
      ((response) =>
        user = App.User.create(response.user)

        user.set('isLoaded', true)
      ),
      ((errResp) =>
        debugger
      )
    )
