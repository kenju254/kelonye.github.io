require 'ember'

get = Em.get
set = Em.set

window.App = Em.Application.create()

App.PAGES = [
  'home'
  'about-us'
  'our-services'
  'why-exxaro'
  'reach-us'
]

require('ember-page')(App)
require './controllers'
require './views'