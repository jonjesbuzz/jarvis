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
        res.reply "It's your opinion that matters to me."

    robot.hear /hvz/i, (res) ->
        res.reply "I'm sorry, but we've banned discussion on Humans vs. Zombies."
