ContactManager.module "Entities", (Entities, ContactManager, Backbone, Marionette, $, _) ->
  Entities.Contact = Backbone.Model.extend
    defaults:
      phoneNumber: "No phone number"

  Entities.ContactCollection = Backbone.Collection.extend
    model: Entities.Contact
    # sort
    comparator: (contact) ->
      contact.get('firstName') + ' ' + contact.get('lastName')

  contacts = undefined
  initializeContacts = ->
    contacts = new Entities.ContactCollection([
      {
        id: 1
        firstName: "Bob"
        lastName: "Brigham"
        phoneNumber: "555-0163"
      }
      {
        id: 2
        firstName: "Alice"
        lastName: "Tampen"
        phoneNumber: "555-0163"
      }
      {
        id: 3
        firstName: "Charlie"
        lastName: "Campbell"
        phoneNumber: "555-0163"
      }
      {
        id: 4
        firstName: "Alice"
        lastName: "Arten"
        phoneNumber: "555-0163"
      }
    ])

  API = getContactEntities: ->
    initializeContacts() if contacts is undefined
    contacts

  ContactManager.reqres.setHandler "contact:entities", ->
    API.getContactEntities()
