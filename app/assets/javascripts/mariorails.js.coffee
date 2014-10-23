window.ContactManager = new Marionette.Application()

ContactManager.addRegions
  mainRegion: '#main-region'

contactTemplate =
  _.template("<h2><%- firstName %> <%- lastName %></h2>")

ContactManager.Contact = Backbone.Model.extend
  defaults:
    phoneNumber: "No phone number"

ContactManager.ContactView = Marionette.ItemView.extend
  template: contactTemplate
  id: 'contact'

  events:
    "click h2": "alertPhone"

  alertPhone: ->
    alert(@model.escape("phoneNumber"))

ContactManager.on "start", ->
  alice = new ContactManager.Contact
    firstName:    "Alice"
    lastName:     "Arten"
    # phoneNumber:  "555-55-55"

  aliceView = new ContactManager.ContactView
    model: alice

  ContactManager.mainRegion.show(aliceView)
