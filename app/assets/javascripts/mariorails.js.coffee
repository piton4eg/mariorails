window.ContactManager = new Marionette.Application()

contactItemTemplate =
  _.template("<h2><%- firstName %> <%- lastName %></h2>")

ContactManager.addRegions
  mainRegion: '#main-region'

ContactManager.Contact = Backbone.Model.extend
  defaults:
    phoneNumber: "No phone number"

ContactManager.ContactCollection = Backbone.Collection.extend
  model: ContactManager.Contact

ContactManager.ContactItemView = Marionette.ItemView.extend
  tagName: "li"
  template: contactItemTemplate

ContactManager.ContactsView = Marionette.CollectionView.extend
  tagName: "ul"
  # "itemView" renamed to "childView"
  childView: ContactManager.ContactItemView

# "initialize:after" renamed to "start"
ContactManager.on "start", ->
  contacts = new ContactManager.ContactCollection([
    {
      firstName: "Bob"
      lastName: "Brigham"
      phoneNumber: "555-0163"
    }
    {
      firstName: "Charlie"
      lastName: "Campbell"
      phoneNumber: "555-0163"
    }
    {
      firstName: "Alice"
      lastName: "Arten"
      phoneNumber: "555-0163"
    }
  ])

  contactsListView = new ContactManager.ContactsView
    collection: contacts

  ContactManager.mainRegion.show(contactsListView)

