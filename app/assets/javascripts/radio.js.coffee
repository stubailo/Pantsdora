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

    brand = response["brandName"]
    name = response["productName"]
    price = response["price"]

    $("#pants-location").prepend("<li class='span3'><div class='thumbnail'><a href='#{zappos_url}'><img src='#{image_url}' /></a> <div class='caption'> <h5>#{name}</h5> <p>#{price}, by #{brand}</p> </div> </div></li>")

    if $("#pants-location").children().size() > 4
      $("#pants-location").children(":gt(3)").remove()
