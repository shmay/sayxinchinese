App.ComposerController = Ember.ObjectController.extend
  toggleComposer: ->
    @toggle @get('view').get('nestedView')

  toggle: (props) ->
    view = @get('view')

    view = @createView(nestedView) if not view

    @setProperties props

    if view.state == 'inDOM'
      if @get('composeState') == 'closed'
        @open(view, nestedView)
      else
        @close()
    else
      view.appendTo('body')

  open: (view,nestedView) ->
    el = view.$()
    if view.state == 'inDOM'
      el.slideDown()
    else
      view.appendTo('body')

    @set('composeState', 'open')

  close: ->
    view = @get('view')
    el = view.$()
    if @get('composeState') != 'closed'
      console.log 'yes'
      el.slideUp()
      @set('composeState', 'closed')

  actions:
    cancelCompose: (e) ->
      @toggle()
