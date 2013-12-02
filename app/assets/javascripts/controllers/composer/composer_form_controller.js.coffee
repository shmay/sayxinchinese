Ember = @Ember

App.ComposerFormController = Ember.Controller.extend
  init:  ->
    type = @type

    controller = Ember.get("App.#{type}FormController").create
      model: @get('model')
      sentence: @get('sentence')

    @set('nestedController', controller)
    formView = Ember.get("App.#{type}FormView")
    mdView = Ember.get("App.#{type}MdView")

    @set('formView', formView.create(controller:controller))
    @set('mdView', mdView.create(controller:controller))

  layout: 'composer_form'

  isMobile: false
  preview: false
  currState: 'form'

  notMobileOrPreview: (->
    !@get('isMobile') or @get('preview')
  ).property('preview', 'isMobile')

  isPreviewAndMobile: ( ->
    @get('preview') and @get('isMobile')
  ).property('preview', 'isMobile')

  isSubmitting: ( ->
    @get('currState') == 'submitting'
  ).property('currState')

  showPreview: -> @set('preview', true)
  showForm: -> @set('preview', false)

  submit: ->
    @set('currState', 'submitting')
    @get('nestedController').submit()

  reset: ->
    @get('nestedController').reset()
