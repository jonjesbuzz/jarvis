module.exports = (robot) ->

    robot.respond /hello/i, (res) ->
        res.reply "Hello."

    robot.respond /is it that time/i, (res) ->
        res.reply "The House Party Protocol?"

    robot.respond /you know what to do/i, (res) ->
        res.reply "The Clean Slate Protocol?"

    robot.respond /A little ostentatious/i, (res) ->
        res.reply "What was I thinking?  You're usually so discreet."

    robot.respond /what do you think about/i, (res) ->
        res.reply "It's your opinion that matters to me, #{res.message.user.name}"
