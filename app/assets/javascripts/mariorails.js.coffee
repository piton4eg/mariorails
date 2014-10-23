window.ContactManager = new Marionette.Application()

ContactManager.addRegions
  mainRegion: '#main-region'

contactItemTemplate =
  _.template("<h2><%- firstName %> <%- lastName %></h2>")

ContactManager.ContactItemView = Marionette.ItemView.extend
  tagName: "li"
  template: contactItemTemplate

ContactManager.ContactsView = Marionette.CollectionView.extend
  tagName: "ul"
  # "itemView" renamed to "childView"
  childView: ContactManager.ContactItemView

# "initialize:after" renamed to "start"
ContactManager.on "start", ->
  contacts = ContactManager.request("contact:entities")

  contactsListView = new ContactManager.ContactsView
    collection: contacts

  ContactManager.mainRegion.show(contactsListView)

