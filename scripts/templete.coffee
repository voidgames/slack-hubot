# Description
#   <description of the scripts functionality>
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot <trigger> - <what the respond trigger does>
#   <trigger> - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   <github username of the original script author>

module.exports = (robot) ->
    # your code here
    # The robot.hear /badger/ callback is called anytime a message's text matches. 
    robot.hear /badger/i, (msg) ->
        # send massage
        msg.send "badger?"
        # parameter msg have info about massage(ex.user.name).
        msg.send "@#{msg.message.user.name}, badger."
        # reply to send user
        msg.reply "Im afraid I cant let you do that."

    # The robot.respond /open the pod bay doors/i callback is only called for messages 
    # that are immediately preceded by the robot's name or alias.
    robot.respond /open the (.*) doors/i, (msg) ->
        # then res.match[0] is "open the pod bay doors", and res.match[1] is just "pod bay"
        doorType = res.match[1]
        # http-client is available.
        robot.http('http://example.com')
            .get() (err, res, body) ->
                # err handling.
                if err
                    msg.send "Encountered an error :( #{err}"
                    return
                # success.
                msg.send "#{res.data}"
