# Description
#   Watch for reviews in HW channels
#
# Commands:
#   reviewed - Let hubot know you reviewed an assignment
#   hubot who reviewed - Check who reviewed an assignment.


module.exports = (robot) ->

    robot.hear /reviewed/i, (res) ->
        res.send "Thanks for reviewing!"
    
    robot.respond /show users$/i, (msg) ->
        response = ""

        for own key, user of robot.brain.data.users
            response += "#{user.id} #{user.name}"
            response += " <#{user.email_address}>" if user.email_address
            response += "\n"
        msg.send response