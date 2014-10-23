window.ContactManager = new Marionette.Application()

ContactManager.addRegions
  mainRegion: '#main-region'

staticTemplate = _.template("<p>Template</p>")
otherTemplate = _.template("<h2>Other template</h2>")

ContactManager.StaticView = Marionette.ItemView.extend
  template: staticTemplate

ContactManager.on "start", ->
  staticView = new ContactManager.StaticView
    template: otherTemplate
    id: 'template-id'
  ContactManager.mainRegion.show(staticView)
