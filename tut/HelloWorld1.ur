
table t : {Id : int, Nam : string}

fun hello () : transaction page =
  return <xml>
    <head/>
    <body>
      <p><a link={world 0}>Hello what?</a></p>
    </body>
  </xml>

and world (id:int) : transaction page =
  r <- oneRow(SELECT * FROM t AS T WHERE A.Id = {[id]});
  return <xml>
    <head/>
    <body>
      <p>Hello, {[r.T.Nam]}!</p>
    </body>
  </xml>

