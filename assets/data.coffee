root = exports ? this


IPv4 =
  is_valid: (addr) ->
    V4 = ///
    ^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}
    (?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$
    ///
    addr.match(V4) != null

  convert: (addr) ->
    addr = addr.split "."
    return if addr.length != 4
    for octet in addr
      num = parseInt octet, 10
      hex = num.toString 16
      if hex.length < 2
        "0" + hex
      else
        hex

$("#ip").keyup (event) ->
    addr = event.target.value.replace ' ', ''
    if not IPv4.is_valid(addr)
      $(".result").html ""
      $(".result-text").hide()
    else
      $(".result").html IPv4.convert(addr).join ""
      $(".result-text").show()

    event.preventDefault()


$("form").submit  (event) ->
  event.preventDefault()
  $(".modal").modal "hide"

$(".modal").on 'shown', ()  ->
    $(".modal input").focus()