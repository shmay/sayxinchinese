Ember = @Ember

App.ComposerFormController = Ember.Controller.extend
  init:  ->
    type = @type
    controller = Ember.run(Ember.get("App.#{type}FormController"), 'create')
    @set('nestedController', controller)
    formView = Ember.get("App.#{type}FormView")
    mdView = Ember.get("App.#{type}MdView")

    @set('formView', Ember.run(formView, 'create', controller:controller))
    @set('mdView', Ember.run(mdView, 'create', controller:controller))

  layout: 'composer_form'

  isMobile: false
  preview: false

  notMobileOrPreview: (->
    !@get('isMobile') or @get('preview')
  ).property('preview', 'isMobile')

  isPreviewAndMobile: ( ->
    @get('preview') and @get('isMobile')
  ).property('preview', 'isMobile')

  showPreview: -> @set('preview', true)
  showForm: -> @set('preview', false)
  state: 'form'

  submit: ->
    @set('state', 'submitting')
    @get('nestedController').submit()
