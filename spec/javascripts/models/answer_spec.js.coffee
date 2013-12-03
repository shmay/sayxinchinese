describe "Answer", ->
  beforeEach ->
    Ember.testing = true

  it "upboats when user_votes:1, other_votes_count:1", ->
    answer = App.Answer.create(JSON.parse(readFixtures("answers/answer")))

    ajaxSpy = spyOn($, 'ajax')

    ajaxSpy.andCallFake (options) =>
      expect(options.url).toEqual("/answers/#{answer.id}/vote")
      expect(options.data.newDir).toEqual(0)
      expect(answer.get('other_votes_count')).toEqual(1)
      expect(answer.get('user_votes')).toEqual(0)

    answer.vote(1)
    expect(ajaxSpy).toHaveBeenCalled()

  it "upboats when user_votes:0, other_votes_count:0", ->
    answer = App.Answer.create(JSON.parse(readFixtures("answers/answer")))
    answer.setProperties
      user_votes: 0
      other_votes_count: 0

    ajaxSpy = spyOn($, 'ajax')
    ajaxSpy.andCallFake (options) ->
      expect(options.data.newDir).toEqual(1)
      expect(answer.get('other_votes_count')).toEqual(0)
      expect(answer.get('user_votes')).toEqual(1)

    answer.vote(1)
    expect(ajaxSpy).toHaveBeenCalled()
