#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require underscore
#= require backbone
#= require backbone.marionette
#= require mariorails
#= require_tree ./entities
#= require_tree ./apps

$ -> ContactManager.start()
