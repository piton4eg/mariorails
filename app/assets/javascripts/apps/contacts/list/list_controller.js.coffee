ContactManager.module "ContactsApp.List", (List, ContactManager, Backbone, Marionette, $, _) ->

  List.Controller =
    listContacts: ->
      contacts = ContactManager.request("contact:entities")

      # use List.Contacts from list_view (it's the same module)
      contactsListView = new List.Contacts
        collection: contacts

      # "itemview:..." rename to "childview:..."
      contactsListView.on "childview:contact:delete", (childView, model) ->
        contacts.remove(model)

      ContactManager.mainRegion.show(contactsListView)

