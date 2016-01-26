# Description
#   Watch for reviews in HW channels
#
# Commands:
#   reviewed - Let hubot know you reviewed an assignment
#   hubot show me reviewers - Check who reviewed an assignment.
#   hubot show me reviewers in [channel] - Check who reviewed an assignment in a specific channel.

array = require 'array'

responses = [
    'Thanks for reviewing!',
    'Who\'s awesome?  You\'re awesome.',
    'And it\'s that much closer to perfection.',
    'Woohoo!  You\'re the best!'
]

module.exports = (robot) ->

    robot.hear /reviewed/i, (msg) ->
        revs = robot.brain.get "com.jjemson.jarvis.reviews.#{msg.message.room}" or []
        if revs is null then revs = []
        revs = array(revs)
        revs.push "#{msg.message.user.id}"
        revs = revs.unique()
        robot.brain.set "com.jjemson.jarvis.reviews.#{msg.message.room}", revs
        msg.reply msg.random responses
    
    robot.respond /(show me )?reviewers$/i, (msg) ->
        revs = robot.brain.get "com.jjemson.jarvis.reviews.#{msg.message.room}" or []
        if revs is null then revs = []
        revs = array(revs)
        response = "*Reviewers*\n"
        for id in revs
            u = robot.brain.userForId(id)
            response += "• #{u.real_name}\n"
        msg.send response or "None yet"

    robot.respond /(show me )?reviewers in (.*)/i, (msg) ->
        revs = robot.brain.get "com.jjemson.jarvis.reviews.#{msg.match[2]}" or []
        if revs is null then revs = []
        revs = array(revs)
        response = "*Reviewers in #{msg.match[2]}*\n"
        for id in revs
            u = robot.brain.userForId(id)
            response += "• #{u.real_name}\n"
        msg.send response or "None yet"