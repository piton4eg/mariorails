ContactManager.module "ContactsApp.Show", (Show, ContactManager, Backbone, Marionette, $, _) ->

  Show.Controller =
    showContact: (model) ->
      contactView = new Show.Contact
        model: model

      ContactManager.mainRegion.show(contactView)
