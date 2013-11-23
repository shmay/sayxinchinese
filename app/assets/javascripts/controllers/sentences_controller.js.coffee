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

      controller.toggle(App.NewSentenceView.create(
        controller: App.SentenceController.create(
          model: App.Sentence.createRecord()
        )
      ))

    changeSortTo: (sort) ->
      console.log sort
      @set('sortProperties', [sort])

    toggleOrder: ->
      @set('sortAscending', !@get('sortAscending'))
