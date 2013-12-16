App.ComposerView = Em.View.extend
  templateName: 'composer',
  classNames: ['nodisplay']
  elementId: 'reply-control'
  didInsertElement: ->
    $replyControl = $('#reply-control')
    $replyControl.DivResizer({})

    @$().slideDown()

  movePanels: (sizePx) -> $('#reply-control').css('bottom', sizePx)

  checkWindowSize: ->
    #nestedController = @get('nestedView').get('controller')

    #isMobile = nestedController.get('isMobile')
    #if window.innerWidth <= 1200
    #  if not isMobile
    #    nestedController.set('isMobile', true)
    #else
    #  if isMobile
    #    nestedController.set('isMobile', false)

  willInsertElement: ->
    @checkWindowSize()
    window.onresize = => @checkWindowSize()
