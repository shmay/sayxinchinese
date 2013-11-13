App.IndexController = Ember.Controller.extend
  page: 'index'
  isUsers: ((page)->
    page == 'users'
  ).property('page')
