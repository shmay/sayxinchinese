# http://emberjs.com/guides/models/defining-a-store/

DS.RESTAdapter.map 'App.Sentence', user:{ embedded:'always' }

App.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create()
