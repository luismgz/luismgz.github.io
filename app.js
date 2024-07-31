var app;

app = $.sammy('#main', function() {
  this.use(Sammy.Template, 'tpl');
  this.get('#/', function() {
    this.swap('');
    //user = {name:'Luis Gonzalez', email:'luismgz@gmail.com', age:53, ego:'huge', temper:'not so good'}
    //$("body").data('user', user)
    //@partial('user.tpl', {user: user})
    return $.getJSON("https://luismgz.github.io/luismgz/myjson.json", function(data) {
      var i, j, len, results;
      results = [];
      for (j = 0, len = data.length; j < len; j++) {
        i = data[j];
        if (i.name[0] === "S") {
          results.push($("#main").append(`${i.name}<br>`));
        } else {
          results.push(void 0);
        }
      }
      return results;
    });
  });
  this.get('#/london/', function() {
    var apiKey;
    this.swap('');
    //$("body").click -> alert JSON.stringify $(this).data 'user'
    apiKey = "4ea0589194d27ee4f46e3e5f56474ef5";
    return $.get(`https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=${apiKey}`, (data) => {
      return this.partial('weather.tpl', {
        data: data
      });
    });
  });
  this.get('#/about/', function() {
    return this.load('about.html').swap();
  });
  this.get('#/contact/', function() {
    return this.load('contact.html').swap();
  });
  this.get('#/label/:name', function() {
    this.swap('');
    return this.$element().append(`<h1>${this.params['name']}</h1>`);
  });
  this.get('#/compose', function() {
    this.app.swap('');
    return this.$element().append('<h1>say hello to?</h1>' + '<form action="#/compose" method="post">' + '<input type="text" name="to" />' + '<input type="submit" name="submit" />' + '</form>');
  });
  return this.post('#/compose', function() {
    var to;
    this.app.swap('');
    to = this.params['to'].toUpperCase();
    return this.$element().append(`<h1>hi ${to}</h1>`);
  });
});

$(function() {
  return app.run("#/");
});
