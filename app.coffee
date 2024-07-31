app = $.sammy '#main', ->
  
  @use(Sammy.Template, 'tpl')

  @get '#/', ->
    @swap ''
    #user = {name:'Luis Gonzalez', email:'luismgz@gmail.com', age:53, ego:'huge', temper:'not so good'}
    #$("body").data('user', user)
    #@partial('user.tpl', {user: user})

    $.getJSON "https://luismgz.github.io/luismgz/myjson.json", (data)->
        for i in data
            if i.name[0] is "S"
                $("#main).append "#{i.name}<br>"

  @get '#/london/', ->
    @swap ''
    #$("body").click -> alert JSON.stringify $(this).data 'user'
    apiKey = "4ea0589194d27ee4f46e3e5f56474ef5"
    $.get "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=#{apiKey}", (data) =>
      @partial 'weather.tpl', {data:data}

  @get '#/about/', ->
    @load('about.html')
      .swap()

  @get '#/contact/', ->
    @load('contact.html')
      .swap()

  @get '#/label/:name', ->
    @swap ''
    @$element().append "<h1>#{@params['name']}</h1>"

  @get '#/compose', ->
    @app.swap ''
    @$element().append '<h1>say hello to?</h1>' +
      '<form action="#/compose" method="post">' +
      '<input type="text" name="to" />' +
      '<input type="submit" name="submit" />' +
      '</form>'
  @post '#/compose', ->
    @app.swap ''
    to = @params['to'].toUpperCase()
    @$element().append "<h1>hi #{to}</h1>"

  
$ -> app.run "#/"
