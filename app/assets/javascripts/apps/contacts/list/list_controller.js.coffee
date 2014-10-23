ContactManager.module "ContactsApp.List", (List, ContactManager, Backbone, Marionette, $, _) ->

  List.Controller =
    listContacts: ->
      contacts = ContactManager.request("contact:entities")

      # use List.Contacts from list_view (it's the same module)
      contactsListView = new List.Contacts
        collection: contacts

      ContactManager.mainRegion.show(contactsListView)

