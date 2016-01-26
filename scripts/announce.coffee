# Description
#   Watch for reviews in HW channels
#
# Commands:
#   hubot announce in (channel) (message) - Announce something in a specific channel.

module.exports = (robot) ->
    
    robot.respond /announce in #([A-Za-z0-9\-]*) (.*)$/i, (msg) ->
        robot.messageRoom msg.match[1] msg.match[2]