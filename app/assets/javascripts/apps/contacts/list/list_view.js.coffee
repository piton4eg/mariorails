ContactManager.module "ContactsApp.List", (List, ContactManager, Backbone, Marionette, $, _) ->

  contactListTemplate =
    _.template("<thead><tr><th>First Name</th><th>Last Name</th></tr></thead><tbody></tbody>")
  contactTemplate =
    _.template("<td><%- firstName %></td><td><%- lastName %></td>")

  List.Contact = Marionette.ItemView.extend
    tagName: "tr"
    template: contactTemplate

    events:
      "click": "highlightName"

    highlightName: ->
      @$el.toggleClass "warning"

  List.Contacts = Marionette.CompositeView.extend
    tagName: "table"
    className: "table table-hover"
    template: contactListTemplate
    # "itemView" renamed to "childView"
    childView: List.Contact
    childViewContainer: "tbody"
