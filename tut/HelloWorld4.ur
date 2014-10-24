table t : {Id : int, Nam : string}

fun hello () : transaction page =
  return <xml>
    <head/>
    <body>
      <p><a link={world 0}>Hello</a></p>
    </body>
  </xml>

and world (id:int) : transaction page =
  r <- oneRow ((Basis.sql_query
    { Rows = Basis.sql_query1 [[]]
        { Distinct = False
        , From = sql_from_table [#T] t
        , Where = sql_binary sql_eq (sql_field [#T] [#Id]) (sql_inject id)
        , GroupBy = sql_subset_all [(_ :: {{Type}})]
        , Having = sql_inject True
        , SelectFields = sql_subset [[T = ((_ :: {Type}), [])]]
        , SelectExps = {}
        }
    , OrderBy = Basis.sql_order_by_Nil [(_ :: {Type})]
    , Limit = Basis.sql_no_limit
    , Offset = Basis.sql_no_offset
    })
  );
  return <xml>
    <head/>
    <body>
      <p>Hello, {[r.T.Nam]}</p>
    </body>
  </xml>
