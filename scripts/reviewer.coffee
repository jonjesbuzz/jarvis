# Description
#   Watch for reviews in HW channels
#
# Commands:
#   reviewed - Let hubot know you reviewed an assignment
#   hubot show me reviewers - Check who reviewed an assignment.

array = require 'array'

module.exports = (robot) ->

    robot.hear /reviewed/i, (msg) ->
        revs = robot.brain.get "com.jjemson.jarvis.reviewer-#{msg.message.room}" or []
        if revs is null then revs = []
        revs = array(revs)
        revs.push "#{msg.message.user.name}"
        revs = revs.unique()
        robot.brain.set "com.jjemson.jarvis.reviewer-#{msg.message.room}", revs
        msg.send "Thanks for reviewing!"
    
    robot.respond /show me reviewers/i, (msg) ->
        revs = robot.brain.get "com.jjemson.jarvis.reviewer-#{msg.message.room}" or []
        if revs is null then revs = []
        revs = array(revs)
        msg.reply revs or "None yet"