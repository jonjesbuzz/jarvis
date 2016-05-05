array = require 'array'

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

    robot.hear /P:\s*(\d)+\s*h?\s*,?\s+G:\s*(\d)+\s*h?\s*/i, (msg) ->
        graders = robot.brain.get "com.jjemson.jarvis.proctor.#{msg.message.room}" or []
        if graders is null then graders = []
        graders = array(graders)
        graders.push { id: msg.message.user.id, procH: msg.match[1], gradeH: msg.match[2]}
        graders.unique()
        robot.brain.set "com.jjemson.jarvis.proctor.#{msg.message.room}", graders
        res.reply "Thank you for your response, #{msg.message.user.real_name}"

    robot.respond /(show me )?graders$/i, (msg) ->
        graders = robot.brain.get "com.jjemson.jarvis.proctor.#{msg.message.room}" or []
        if graders is null then graders = []
        graders = array(graders)
        response = "*Statistics in #{msg.message.room}*\n"
        for obj in revs
            user = robot.brain.userForId(obj.id)
            response += "• #{user.real_name} - Proctored #{obj.procH} hours and graded #{obj.gradeH}\n"
        graders.unique()
        robot.brain.set "com.jjemson.jarvis.proctor.#{msg.message.room}", graders
        msg.send response or "None yet"