module.exports = (jobbot) ->
  
  jobbot.respond /wakeup!/i, (res) ->
    res.send "Yes?"

  #OVERHEAR
  jobbot.hear /work/i, (res) ->
    res.send "Did someone mention work? Ask me if there are 'any jobs today?' and I'll take a look for you"

  # FETCH JOBS
  jobbot.respond /any jobs today?/i, (res) ->
      res.send "Checking..."

      # GO GO GADGET JOBS!
      jobapi = "https://jobs.github.com/positions.json"

      jobbot.http(jobapi)
       .header('Accept','application/json')
       .get() (err,response,body) ->
          if err
            res.send "Encountered an error :( #{err}"
            return

          #PICK ONE
          data = JSON.parse body

          suggest = data[Math.floor(Math.random() * data.length)]
          res.send "How about #{suggest.title} at #{suggest.company} in #{suggest.location}? #{suggest.url}"
