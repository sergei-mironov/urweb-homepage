val t : sql_table [Id=int, Nam=string] [] = ???
(* val t : sql_table [Id=int, Nam=string] [] = error <xml/>  ==typechecks== *)

fun hello () : transaction page =
  return <xml>
    <head/>
    <body>
      <p><a link={world 0}>Hello</a></p>
    </body>
  </xml>

and world (id:int) : transaction page =
  r <- oneRow(SELECT * FROM t AS T WHERE T.Id = {[id]});
  return <xml>
    <head/>
    <body>
      <p>Hello, {[r.T.Nam]}</p>
    </body>
  </xml>
