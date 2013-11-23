###
A simple key value store that uses LocalStorage

jacked from discourse

###

App.KeyValueStore =
  initialized: false
  context: ""
  init: (ctx, messageBus) ->
    @initialized = true
    @context = ctx

  abandonLocal: ->
    i = undefined
    k = undefined
    return  unless localStorage and @initialized
    i = localStorage.length - 1
    while i >= 0
      k = localStorage.key(i)
      localStorage.removeItem k  if k.substring(0, @context.length) is @context
      i--
    true

  remove: (key) ->
    localStorage.removeItem @context + key

  set: (opts) ->
    return false  unless localStorage and @initialized
    localStorage[@context + opts.key] = opts.value

  get: (key) ->
    return null  unless localStorage
    localStorage[@context + key]
