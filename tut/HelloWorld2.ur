table t : {Id : int, Nam : string}

fun hello () : transaction page =
  let
    val a_desugared = tag
      null
      None
      noStyle
      None
      {Href = url(world 0)}
      (a {})
      (cdata "Hello")
  in
  return <xml>
    <head/>
    <body>
      <p>{a_desugared}</p>
    </body>
  </xml>
  end

and world (id:int) : transaction page =
  r <- oneRow(SELECT * FROM t AS T WHERE T.Id = {[id]});
  return <xml>
    <head/>
    <body>
      <p>Hello, {[r.T.Nam]}</p>
    </body>
  </xml>
