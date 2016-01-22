# Description
#   Generate links to a Piazza post
#
# Configuration:
#   HUBOT_PIAZZA_CLASS - The class identifier.
#
# Commands:
#   Piazza@[Question] - Responds with the link to the specified question

classID = process.env.HUBOT_PIAZZA_CLASS


module.exports = (robot) ->
    robot.hear /piazza@(\d{1,3})/i, (res) ->
        res.send "https://piazza.com/class/#{classID}?cid=#{res.match[1]}"