#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require underscore
#= require backbone
#= require backbone.marionette
#= require mariorails
#= require_tree ../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

$ ->
  Mariorails.start()
