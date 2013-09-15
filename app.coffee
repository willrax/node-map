models = require("./models/models")
mongoose = require("mongoose")
Feature = mongoose.model("Feature")

express = require("express")

app = express()
server = require("http").createServer(app)
io = require("socket.io").listen(server)

app.set("view engine", "jade")
app.use(express.static(__dirname + "/public"))

io.on "connection", (socket) ->
  socket.on "shapeAdded", (data) ->
    socket.broadcast.emit("newFeature", data)

    newFeature =
      type: data.type
      coordinates: data.coordinates

    Feature.create newFeature, (err, feature) ->
      if err
        console.log("Error saving")

app.get "/", (req, res) ->
  res.render(__dirname + "/index", { title: "Map" })

app.get "/features", (req, res) ->
  Feature.find {}, (err, features) ->
    res.send(features)

server.listen(8080)
