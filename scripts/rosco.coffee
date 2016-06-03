module.exports = (rosco) ->
  
  #my code here
  rosco.hear /rosco?/i, (response) ->
    response.send "yes?"

  rosco.hear /see?/i, (response) ->
    response.send "See what?"

  rosco.hear /coffee/i, (response) ->
    response.send "Did someone mention coffee?"

  rosco.respond /open the (.*) doors/i, (response) ->
    doorType = response.match[1]
    if doorType is "pod bay"
      response.reply "I'm afraid not"
    else
      response.reply "Opening the #{doorType} doors"


