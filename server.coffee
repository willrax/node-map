express = require("express")
app = express()

app.set("view engine", "jade")
app.use(express.static(path.join(__dirname, 'public'))

app.get "/", (req, res) ->
  res.render(__dirname + "/index")

app.listen(8080)
console.log("Listening...")
