App.PagesPageController.reopen

  projects: [
    {
      title: "Mobile Distribution System",
      uri: "http://mobile-distribution-system.appspot.com"
    },
    {
      title: "Kampoze",
      uri: "http://kampoze.appspot.com"
    },
    {
      title: "Todos",
      uri: "http://todosmvc.appspot.com/"
    },
    {
      title: "Exxaro Ventures",
      uri: "kelonye.github.com/travel-out/exxaroventures/"
    },
    {
      title: "Travel Out",
      uri: "kelonye.github.com/travel-out/"
    }
  ]
  team: [
    {
      name: "Alex Ondieki",
      email: "alexnyaswabu@gmail.com",
      role: "Director"
    },
    {
      name: "Mitchel Kelonye",
      email: "kelonyemitchel@gmail.com",
      role: "Web Developer"
    },
    {
      name: "Oluoch Ebrahim",
      email: "oluochebrahim@gmail.com",
      role: "Web Developer"
    },
    {
      name:"Daniel Ragira",
      email: "danielragira",
      role: "Sales Manager"
    }
  ]

  init: ->
    that = @
    Em.$.getJSON "http://search.twitter.com/search.json?q=kelonye&page=1&callback=?", (data) ->
      tweets = data.results.map((content) ->
        #date = new Date(content.created_at)
        #content.date = date.toDateString()
        content.uri = "https://twitter.com/twitterapi/status/#{content.id_str}"
        content
      )
      that.set "tweets", tweets
