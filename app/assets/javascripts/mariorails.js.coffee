window.ContactManager = new Marionette.Application()

ContactManager.addRegions
  mainRegion: '#main-region'

contactTemplate =
  _.template("<h2><%- firstName %> <%- lastName %></h2>")

ContactManager.Contact = Backbone.Model.extend({})

ContactManager.ContactView = Marionette.ItemView.extend
  template: contactTemplate

ContactManager.on "start", ->
  alice = new ContactManager.Contact
    firstName:    "Alice"
    lastName:     "Arten"
    phoneNumber:  "555-55-55"

  aliceView = new ContactManager.ContactView
    model: alice

  ContactManager.mainRegion.show(aliceView)
