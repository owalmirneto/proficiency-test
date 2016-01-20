ready = ->
  # Vendors
  Bootstrap.init()
  Chosen.init()

$(document).ready ready
$(document).on 'page:load', ready
