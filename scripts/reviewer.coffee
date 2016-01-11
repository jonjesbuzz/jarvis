# Description
#   Watch for reviews in HW channels
#
# Commands:
#   reviewed - Let hubot know you reviewed an assignment
#   hubot who reviewed - Check who reviewed an assignment.


module.exports = (robot) ->

    robot.hear /reviewed/i, (res) ->
        revs = robot.brain.get "com.jjemson.jarvis.reviewer-#{res.message.room}" or []
        revs.concat "#{msg.message.user.name}"
        robot.brain.set "com.jjemson.jarvis.reviewer-#{res.message.room}", revs
        res.send "Thanks for reviewing!"
    
    robot.respond /show users$/i, (msg) ->
        revs = robot.brain.get "com.jjemson.jarvis.reviewer-#{res.message.room}" or []
        response = revs.toString
        msg.send response