window.ContactManager = new Marionette.Application()

ContactManager.addRegions
  mainRegion: '#main-region'

# "initialize:after" renamed to "start"
ContactManager.on "start", ->
  contacts = ContactManager.request("contact:entities")

  contactsListView = new ContactManager.ContactsApp.List.Contacts
    collection: contacts

  ContactManager.mainRegion.show(contactsListView)

