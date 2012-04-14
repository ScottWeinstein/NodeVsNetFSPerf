_       = require 'underscore'
async   = require 'async'
fs      = require 'fs'

testDir = process.argv[2]

doFile = (fileName, cb) ->
    fs.stat fileName, (err, stats) =>
        throw err if err
        if stats.isFile()
            fs.readFile fileName, (readErr, data) -> 
                if readErr and readErr.errno isnt 0
                    console.warn readErr
                cb()
        else 
        if stats.isDirectory()
            traverseDir fileName, cb
        else
            cb()


traverseDir = (dir, cb) ->
    fs.readdir dir, (err,files) ->
        throw err if err
        files = _.map files, (f) -> "#{dir}/#{f}"
        async.forEach(files, doFile, (err) -> throw err if err)
        cb()

traverseDir testDir, () ->