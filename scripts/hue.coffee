ifttt_key = require('./resources/ifttt/ifttt_key')

fire = (msg, event_name) ->
  msg.http('https://maker.ifttt.com/trigger/turn_off_all/with/key/' + ifttt_key.key)
    .get() (err, res, body) ->
      if err
        res.send "Encountered an error :( #{err}"

module.exports = (robot) ->
  robot.respond /明るく|電気つけて|turn on/i, (msg) ->
    fire msg, 'turn_on_all';
    msg.reply "電気つけます";

  robot.respond /消灯|電気消して|turn off/i, (msg) ->
    fire msg, 'turn_off_all';
    msg.reply "消しときますね";

  robot.respond /blink|ピカピカ/i, (msg) ->
    fire msg, 'blink_all';
    msg.reply "ピカピカさせますね";
