app = $.sammy '#main', ->
  
  @use(Sammy.Template, 'tpl')

  @get '#/', ->
    @swap ''
    #user = {name:'Luis Gonzalez', email:'luismgz@gmail.com', age:53, ego:'huge', temper:'not so good'}
    #$("body").data('user', user)
    #@partial('user.tpl', {user: user})

    $.getJSON "https://luismgz.github.io/myjson.json", (data)->
        for i in data
            if i.name[0] is "K"
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
    letter = @params['name'][0].toUpperCase()

    $.getJSON "https://luismgz.github.io/myjson.json", (data)->
      header = "<thead><tr>" + ("<th>#{k.toUpperCase()}</th>" for k,v of data[0]).join("") + "</tr></thead>"      
      rows = []      
      for record in data
        rows.push "<tr>" + ("<td>#{v}</td>" for k,v of record when record.name[0] is letter).join("") + "</tr>"
      $("#main").append "<table border=1>#{header}<tbody>#{rows.join("")}</tbody></table>"


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
