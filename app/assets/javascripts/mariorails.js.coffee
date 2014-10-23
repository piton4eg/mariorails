window.ContactManager = new Marionette.Application()

ContactManager.addRegions
  mainRegion: '#main-region'

# "initialize:after" renamed to "start"
ContactManager.on "start", ->
  ContactManager.ContactsApp.List.Controller.listContacts()
