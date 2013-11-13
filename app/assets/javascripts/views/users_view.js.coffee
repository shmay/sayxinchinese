App.UsersView = Ember.View.extend
  templateName: 'users/users'

  didInsertElement: ->
    @_super()
    App.page = 'users'
