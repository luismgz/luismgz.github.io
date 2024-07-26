<h1>London, UK</h1>
        <table border=1, space=2, style="font-family:Helvetica">
          <tr>
            <th>Sky</th>
            <td><%= data.weather[0].main %></td>
          </tr>
          <tr>
            <th>Temperature</th>
            <td><%= data.main.temp %>K</td>
          </tr>
          <tr>
            <th>Humidity</th>
            <td><%= data.main.humidity %>%</td>
          </tr>
          <tr>
            <th>Wind Speed</th>
            <td><%= data.wind.speed %>m/s</td>
          </tr>
        </table>