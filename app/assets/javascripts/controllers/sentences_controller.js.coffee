App.SentencesController = Ember.ArrayController.extend
  canCreateTopic: true

  needs: ["composer"]
  sortProperties: ['sentence']
  sortAscending: true

  isSortedbyDate: (->
    @get('sortProperties')[0] == 'date'
  ).property('sortProperties')

  actions:
    createTopic: ->
      controller = @get("controllers.composer")

      controller.toggle(App.ComposerFormView.create(
        controller: App.ComposerFormController.create(type:'Sentence')
      ))

    changeSortTo: (sort) -> @set('sortProperties', [sort])

    toggleOrder: -> @set('sortAscending', !@get('sortAscending'))
