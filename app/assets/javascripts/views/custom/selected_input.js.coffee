App.FocusedField = Ember.TextField.extend
  didInsertElement: -> @$().focus()
  keyDown: (e) ->
    if e.keyCode == 27
      method = ['editName']
    else if e.keyCode == 13
      method = ['saveModel', name:@$().val()]

    if method
      c = @get('parentView').get('controller')
      c.send.apply(c, method)
