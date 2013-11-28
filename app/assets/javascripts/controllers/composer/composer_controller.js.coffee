App.ComposerController = Ember.Controller.extend
  toggleComposer: ->
    @toggle @get('view').get('nestedView')

  toggle: (nestedView) ->
    view = @get('view')

    view = @createView(nestedView) if not view

    if view.state == 'inDOM'
      if @get('composeState') == 'closed'
        @open(view, nestedView)
      else
        @close()
    else
      view.appendTo('body')

  createView: (nestedView) ->
    view = App.ComposerView.create
      message: "New Sentence"
      controller: @
      nestedView: nestedView

    @set('view', view)

    view

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
