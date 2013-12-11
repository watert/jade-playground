
###
Module dependencies.
###
mongoose = require("mongoose")
mongoose.connect "localhost/jade_pg"
express = require("express")
require("coffee-script")
routes = require("./routes")
user = require("./routes/user")
http = require("http")
path = require("path")
app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev") 
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, "public"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")
app.get "/", routes.index
app.get "/users", user.list
require("./routes/jade").init(app)
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

