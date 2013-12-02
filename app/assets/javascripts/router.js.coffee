# For more information see: http://emberjs.com/guides/routing/

App.Router.map (match) ->
  @resource 'index', path: '/', ->
    @resource('sentences', { path: '/' }, -> this.route('new'))
    @resource('sentence', {path: '/sentences/:id'})
    @resource('user', {path: '/profiles/:id'})
    @resource('users')

App.SentenceRoute = Ember.Route.extend
  model: (params) -> App.Sentence.find(params.id)

App.SentencesRoute = Ember.Route.extend
  model: -> App.Sentence.find()
  setupController: (controller,model) ->
    controller.set('content',model)

App.UserRoute = Ember.Route.extend
  model: (params) -> $.getJSON("/profiles/" + params.id)
  setupController: (controller, model) ->
    controller.set('content', model)
