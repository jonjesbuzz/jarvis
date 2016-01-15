# Description
#   Watch for reviews in HW channels
#
# Commands:
#   reviewed - Let hubot know you reviewed an assignment
#   hubot show me reviewers - Check who reviewed an assignment.

array = require 'array'

module.exports = (robot) ->

    robot.hear /reviewed/i, (msg) ->
        revs = robot.brain.get "com.jjemson.jarvis.reviews.#{msg.message.room}" or []
        if revs is null then revs = []
        revs = array(revs)
        revs.push "#{msg.message.user.id}"
        revs = revs.unique()
        robot.brain.set "com.jjemson.jarvis.reviews.#{msg.message.room}", revs
        msg.reply "Thanks for reviewing!"
    
    robot.respond /show me reviewers/i, (msg) ->
        revs = robot.brain.get "com.jjemson.jarvis.reviews.#{msg.message.room}" or []
        if revs is null then revs = []
        revs = array(revs)
        response = "*Reviewers*\n"
        for id in revs
            u = robot.brain.userForId(id)
            response += "• #{u.real_name}\n"
        msg.send response or "None yet"

    robot.respond /show me reviewers in (.*)/i, (msg) ->
        revs = robot.brain.get "com.jjemson.jarvis.reviews.#{msg.match[1]}" or []
        if revs is null then revs = []
        revs = array(revs)
        response = "*Reviewers*\n"
        for id in revs
            u = robot.brain.userForId(id)
            response += "• #{u.real_name}\n"
        msg.send response or "None yet"