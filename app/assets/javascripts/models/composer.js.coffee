CLOSED = 'closed'
OPEN = 'open'

App.Composer = Ember.Object.extend
  message: "new sentence"
  togglePreview: ->
    @toggleProperty('showPreview')
    App.KeyValueStore.set({ key: 'composer.showPreview', value: this.get('showPreview') })

  getComposeState: ->
    state = @get('composeState')
    if not state
      @set('composeState', OPEN)
      state = OPEN

    state
