App.SignInView = Ember.View.extend
  templateName: 'users/signin'

  submit: (e) ->
    token = $('meta[name="csrf-token"]').attr('content')
    @$('form').prepend "<input name='authenticity_token' type='hidden' value='#{token}' />"
