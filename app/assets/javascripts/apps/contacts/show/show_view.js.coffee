ContactManager.module "ContactsApp.Show", (Show, ContactManager, Backbone, Marionette, $, _) ->

  contactShowTemplate =
    _.template("
      <h1><%- firstName %> <%- lastName %></h1>
      <p><strong>Phone:<strong> <%- phoneNumber %></p>
      ")

  Show.Contact = Marionette.ItemView.extend
    template: contactShowTemplate
