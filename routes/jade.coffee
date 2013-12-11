
#
# * GET home page.
# 
exports.init = (app) ->
	app.get "jade",(req,res)->
		res.json "jade"

