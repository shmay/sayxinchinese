App.NoticeView = Ember.View.extend
  didInsertElement: ->
    window.setTimeout(
      (=>
        @$().fadeOut(1000, =>
          @get('model').set('hasErred',false)
        )
      ), 500)
