# Description
#   Watch for reviews in HW channels
#
# Commands:
#   reviewed - Let hubot know you reviewed an assignment
#   hubot who reviewed - Check who reviewed an assignment.


module.exports = (robot) ->

    robot.hear /reviewed/i, (res) ->
        res.send "Thanks for reviewing!"