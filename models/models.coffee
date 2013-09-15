db = require("./../config/database")
mongoose = require("mongoose")

Schema = mongoose.Schema

featureSchema = new Schema(
  type:
    type: String
  coordinates: []
  radius: Number
)
mongo_url = process.env.MONGOHQ_URL
mongoose.connect("#{mongo_url}")
mongoose.connection.on "error", () ->
  console.error('connection error', arguments)

Feature = mongoose.model("Feature", featureSchema)
