ContactManager.module "ContactsApp", (ContactsApp, ContactManager, Backbone, Marionette, $, _) ->

  ContactsApp.Router = Marionette.AppRouter.extend
    appRoutes:
      "contacts": "listContacts"

  API =
    listContacts: -> ContactsApp.List.Controller.listContacts()

  ContactManager.on "contacts:list", ->
    ContactManager.navigate("contacts")
    API.listContacts()


  ContactManager.addInitializer ->
    new ContactsApp.Router
      controller: API
