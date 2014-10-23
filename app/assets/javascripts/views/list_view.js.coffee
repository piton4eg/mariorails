ContactManager.module "ContactsApp.List", (List, ContactManager, Backbone, Marionette, $, _) ->

  contactTemplate =
    _.template("<h2><%- firstName %> <%- lastName %></h2>")

  List.Contact = Marionette.ItemView.extend
    tagName: "li"
    template: contactTemplate

  List.Contacts = Marionette.CollectionView.extend
    tagName: "ul"
    # "itemView" renamed to "childView"
    childView: List.Contact

