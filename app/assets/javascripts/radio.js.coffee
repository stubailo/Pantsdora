$ ->
  interval_id = -1

  repeat = (ms, func) -> setInterval func, ms

  $("#search-submit").click (event) ->
    event.preventDefault()
    start_radio($("#search-terms").val())

  start_radio = (terms) ->
    $("#pants-location").html("")
    clearInterval(interval_id) unless interval_id == -1

    get_more_pants(terms)
    interval_id = repeat 5000, ->
      get_more_pants(terms)

  get_more_pants = (terms) ->
    $.get("/pants/random.json", {q: terms}, pants_callback)
    
  pants_callback = (response) ->
    image_url = response["largeImageUrl"]
    zappos_url = response["productUrl"]

    $("#pants-location").prepend("<div class='span3 pull-left'><a href='#{zappos_url}'><img src='#{image_url}' /></a></div>")

    if $("#pants-location").children().size() > 4
      $("#pants-location").children(":gt(3)").remove()
