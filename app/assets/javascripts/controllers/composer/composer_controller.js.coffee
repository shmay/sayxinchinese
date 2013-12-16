App.ComposerController = Ember.ObjectController.extend
  toggleComposer: ->
    @toggle @get('view').get('nestedView')

  toggle: (options) ->

    view = @createViews(options)

    if view.state == 'inDOM'
      if @get('composeState') == 'closed'
        @open(view, nestedView)
      else
        @close()
    else
      view.appendTo('body')

  createViews: (options) ->
    type = options.type
    model = Ember.get("App.#{type}").create()
    @set('model', model)

    nestedView = App.ComposerFormView.create
      controller: App.ComposerFormController.create
        model: model
        title: options.title
        type: type

    view = App.ComposerView.create
      message: "New Sentence"
      controller: @
      nestedView: nestedView

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
