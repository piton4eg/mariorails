ContactManager.module "ContactsApp.Show", (Show, ContactManager, Backbone, Marionette, $, _) ->

  Show.Controller =
    showContact: (id) ->
      contacts = ContactManager.request("contact:entities")
      model = contacts.get(id)
      contactView = new Show.Contact
        model: model

      ContactManager.mainRegion.show(contactView)
