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
                $("#main").append "#{i.name}<br>"

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
    #@$element().append "<h1>#{@params['name']}</h1>"
    letter = @params['name'][0]
    $.getJSON "https://luismgz.github.io/myjson.json", (data)->
      $("#main").append "<table border=1><thead><tr>"
      for k,v of data[0]
        $("#main").append "<th>#{k}</th>"
      $("#main").append "</tr></thead>"
      $("#main").append "<tbody>"
      for record in data
        $("#main").append "<tr>"
        for k,v of record
          if k[0] is letter
            $("#main").append "<td>#{v}</td>"
        $("#main").append "</tr>"
      $("#main").append "</tbody></table>"

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
