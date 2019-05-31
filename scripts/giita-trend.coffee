# Description
#   毎日Qiitaのトレンド１位を投稿する
#
# Dependencies:
#   "cron": "<module version>"
#   "time": "<module version>"
#
# Configuration:
#   HUBOT_SLACK_CHANNEL
#
# Commands:
#   None
#
# Notes:
#   None
#
# Author:
#   voidoperator

cron = require('cron').CronJob

module.exports = (robot) ->
    # *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
    new cron '0 0 20 * * *', () ->
        robot.http('https://us-central1-qiita-trend-web-scraping.cloudfunctions.net/qiitaScraiping/daily/2019-02-01')
            .get() (err, res, body) ->
                # err handling.
                if err
                    robot.send "Encountered an error :( #{err}"
                    return
                # success.
                robot.messageRoom prosess.env.HUBOT_SLACK_CHANNEL, "#{res.data[0].title}¥n#{res.data[0].url}"
