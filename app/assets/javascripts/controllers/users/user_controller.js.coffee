App.UserController = Ember.ObjectController.extend
  actions:
    editName: ->
      @set("editingName", !@get('editingName'))

  setUp: (model) ->
    @set('model',model)

  saveModel: (attrs) ->
    @set('editingName', false)
    @get('model').save(attrs)
