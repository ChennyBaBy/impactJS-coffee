module.exports =
  notify: (error) ->
    console.error(error)
    process.exit(1) if process.env.ENV is "production"
  wrap: (body) ->
    try
      body()
    catch e
      @notify(e)