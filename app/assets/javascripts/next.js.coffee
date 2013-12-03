#= require_tree ./lib
#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self

Handlebars = Ember.Handlebars
showdown = new Showdown.converter()

Handlebars.helper 'dynamicView', (options) ->
  # options.data.view == ModalView
  path = options.data.view.nestedView
  Handlebars.helpers.view.call(this, path, options)

Handlebars.helper 'dynamicRender', (name, model, options) ->
  Handlebars.helpers.render.call(this, name, model, options)

Handlebars.registerBoundHelper "markdown", (input) ->
  if input
    new Handlebars.SafeString(showdown.makeHtml(input))
  else
    ""

Ember.Handlebars.helper 'dynView', (name, options) ->
  Handlebars.helpers.view.call(this, name, options)

$ ->
  $(document).on 'mouseenter', '.tip', -> $(this).tooltip().tooltip('show')
  $(document).on 'mouseleave', '.tip', -> $(this).tooltip('hide')
