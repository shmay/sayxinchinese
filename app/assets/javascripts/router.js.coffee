# For more information see: http://emberjs.com/guides/routing/

App.Router.map (match) ->
  @resource 'index', path: '/', ->
    @resource('sentences', { path: '/' }, -> this.route('new'))
    @resource('sentence', {path: '/sentences/:id'})
    @resource('user', {path: '/profiles/:id'})
    @resource('users')

App.IndexRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('currentUser', App.currentUser)
App.SentenceRoute = Ember.Route.extend
  model: (params) -> App.Sentence.find(params.id)
  setupController: (controller,model) ->
    controller.setUp(model)

App.SentencesRoute = Ember.Route.extend
  model: -> App.Sentence.findAll()
  setupController: (controller,model) ->
    controller.set('content',model)

App.UserRoute = Ember.Route.extend
  model: (params) -> App.User.find(params.id)
  setupController: (controller, model) -> controller.setUp(model)
  editName: -> debugger
