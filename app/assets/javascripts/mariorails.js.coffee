window.ContactManager = new Marionette.Application()

ContactManager.addRegions
  mainRegion: '#main-region'

staticTemplate = _.template("<p>Template</p>")

ContactManager.StaticView = Marionette.ItemView.extend
  template: staticTemplate

ContactManager.on "start", ->
  staticView = new ContactManager.StaticView()
  ContactManager.mainRegion.show(staticView)
