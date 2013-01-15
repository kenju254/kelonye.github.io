
get = Em.get
set = Em.set
compile = Em.Handlebars.compile

App.PAGES.forEach (page)->
  Em.TEMPLATES[page] = compile require("./templates/pages/#{page}")

Em.TEMPLATES['pages'] = compile require './templates/index'

App.NavItem = Em.View.extend require('ember-select'),
  template: compile require('./templates/page-list-item')
  title: Em.computed ->
    content = get @, 'content'
    content.replace /-/g, ' '

App.Nav = Em.CollectionView.extend
  tagName: "ul"
  classNames: ["nav"]
  itemViewClass: App.NavItem

App.TeamMemberView = Em.View.extend
  tagName: "a"
  rel: "tooltip"
  href: (->
    email = get @, 'content.email'
    "mailto:#{email}"
  ).property "content.email"
  img: (->
    name = get @, "content.name"
    name = name.replace(/\s/g,"_").toLowerCase()
    "build/client/img/team/#{name}.png"
  ).property "content.name"

  attributeBindings: ["rel","href"]

  template: Em.Handlebars.compile(
    """<img {{bindAttr src="view.img"}}>"""
  )

  didInsertElement: ->
    member = @get "content"
    this.$().tooltip
      title: "#{member.name} - #{member.role}",
      placement: "top",
      hide: 100

App.ProjectSlideView = Em.View.extend
  tagName: "li"

  hrefBinding: 'content.uri'
   
  img: (->
    title = get @, 'content.title'
    title = title.replace(/\s/g,"_").toLowerCase()
    "build/client/img/projects/#{title}.png"
  ).property "content.title"

  template: Em.Handlebars.compile(
    """
    <a {{bindAttr href="view.href" target="external"}}>
    <img {{bindAttr src="view.img"}}>
    </a>
    """
  )

App.ProjectSliderView = Em.CollectionView.extend
  tagName: 'ul'
  itemViewClass: App.ProjectSlideView

  didInsertElement: ->
    require './easyslider'
    Em.$('#slider').easySlider
      auto: true,
      continuous: true,
      numeric: true
