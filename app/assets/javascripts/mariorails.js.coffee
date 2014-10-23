window.ContactManager = new Marionette.Application()

ContactManager.addRegions
  mainRegion: '#main-region'

ContactManager.navigate = (route, options = {}) ->
  Backbone.history.navigate(route, options)

ContactManager.getCurrentRoute = ->
  Backbone.history.fragment

# "initialize:after" renamed to "start"
ContactManager.on "start", ->
  if Backbone.history
    Backbone.history.start()

    if @getCurrentRoute() is ""
      ContactManager.trigger("contacts:list")
