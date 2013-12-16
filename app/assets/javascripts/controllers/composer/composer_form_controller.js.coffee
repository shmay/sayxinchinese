Ember = @Ember

App.ComposerFormController = Ember.ObjectController.extend
  init:  ->
    type = @type
    model = @get('model')

    formView = Ember.get("App.#{type}FormView")
    mdView = Ember.get("App.#{type}MdView")

    @set('formView', formView.create(model:model))
    @set('mdView', mdView.create(model:model))

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
