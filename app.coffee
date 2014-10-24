net = require 'net'
fs = require 'fs'

opts =
  host: "localhost"
  port: 20880

client = net.connect opts, ->
  console.log "connect #{opts.host}:#{opts.port} successfully."
  client.write "ls\r\n\r\n"

client.on "data", (data)->
  arr = data.toString().split("\r\n")[0...-1]
  result =
    arr
      .map (item) ->
        "#{item}=dubbo://#{opts.host}:#{opts.port}"
      .join("\r\n")
  name = "dubbo-#{opts.host}-#{opts.port}.properties"
  fs.writeFile name, result, (err) ->
    console.log err ? "saved #{name}"
    client.end()

  
client.on "end", ->
  console.log "client disconnected"
  
