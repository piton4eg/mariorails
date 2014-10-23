ContactManager.module "ContactsApp.List", (List, ContactManager, Backbone, Marionette, $, _) ->

  contactListTemplate =
    _.template("
      <thead>
        <tr>
          <th>First Name</th>
          <th>Last Name</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
      </tbody>
      ")
  contactTemplate =
    _.template("
      <td><%- firstName %></td>
      <td><%- lastName %></td>
      <td>
        <button class=\"btn btn-small js-delete\">
          Delete
        </button>
      </td>
      ")

  List.Contact = Marionette.ItemView.extend
    tagName: "tr"
    template: contactTemplate

    events:
      "click": "highlightName"
      "click button.js-delete": "deleteClicked"

    highlightName: ->
      @$el.toggleClass "warning"

    deleteClicked: (e) ->
      e.stopPropagation()
      @trigger("contact:delete", @model)

    remove: ->
      self = this
      # fadeOut make it hidden, not removed
      @$el.fadeOut ->
        # Marionette.ItemView.prototype.remove.call(self)
        # remove element after fadeOut
        Marionette.ItemView::remove.call self

  List.Contacts = Marionette.CompositeView.extend
    tagName: "table"
    className: "table table-hover"
    template: contactListTemplate
    # "itemView" renamed to "childView"
    childView: List.Contact
    childViewContainer: "tbody"
