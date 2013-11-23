div = undefined
endDrag = undefined
grip = undefined
lastMousePos = undefined
min = undefined
mousePosition = undefined
originalDivHeight = undefined
originalPos = undefined
performDrag = undefined
startDrag = undefined
wrappedEndDrag = undefined
wrappedPerformDrag = undefined
div = undefined
originalPos = undefined
originalDivHeight = undefined
lastMousePos = 0
min = 230
grip = undefined
wrappedEndDrag = undefined
wrappedPerformDrag = undefined

startDrag = (e, opts) ->
  div = $(e.data.el)
  div.addClass "clear-transitions"
  div.blur()
  lastMousePos = mousePosition(e).y
  originalPos = lastMousePos
  originalDivHeight = div.height()
  wrappedPerformDrag = (->
    (e) ->
      performDrag e, opts
  )()
  wrappedEndDrag = (->
    (e) ->
      endDrag e, opts
  )()
  $(document).mousemove(wrappedPerformDrag).mouseup wrappedEndDrag
  false

performDrag = (e, opts) ->
  size = undefined
  sizePx = undefined
  thisMousePos = undefined
  thisMousePos = mousePosition(e).y
  size = originalDivHeight + (originalPos - thisMousePos)
  lastMousePos = thisMousePos
  size = Math.min(size, $(window).height())
  size = Math.max(min, size)
  sizePx = size + "px"
  opts.onDrag sizePx  if typeof opts.onDrag is "function"
  div.height sizePx
  endDrag e, opts  if size < min
  false

endDrag = (e, opts) ->
  $(document).unbind("mousemove", wrappedPerformDrag).unbind "mouseup", wrappedEndDrag
  div.removeClass "clear-transitions"
  div.focus()
  opts.resize()  if typeof opts.resize is "function"
  div = null

mousePosition = (e) ->
  x: e.clientX + document.documentElement.scrollLeft
  y: e.clientY + document.documentElement.scrollTop

$.fn.DivResizer = (opts) ->
  @each ->
    grippie = undefined
    start = undefined
    staticOffset = undefined
    div = $(this)
    return  if div.hasClass("processed")
    div.addClass "processed"
    staticOffset = null
    start = ->
      (e) ->
        startDrag e, opts

    grippie = div.find(".grippie").bind("mousedown",
      el: this
    , start())
