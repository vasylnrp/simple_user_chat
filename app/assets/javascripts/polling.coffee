window.Poller = {
  poll: (timeout) ->
    if timeout is 0
      Poller.request()
    else
      this.pollTimeout = setTimeout ->
        Poller.request()
      , timeout || 5000
  clear: -> clearTimeout(this.pollTimeout)
  request: ->
    first_id = $('.message').first().data('id')
    $.get('/messages', after_id: first_id)
}

jQuery ->
  Poller.poll() if $('#messages').size() > 0