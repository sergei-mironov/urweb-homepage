table t : {Id : int, Nam : string}

and world (id:int) : transaction page =
  r <- oneRow ((sql_query
    { Rows = sql_query1 [[]]
        { Distinct = False
        , From = sql_from_table [#T] t
        , Where = sql_binary sql_eq (sql_field [#T] [#Id]) (sql_inject id)
        , GroupBy = sql_subset_all [(_ :: {{Type}})]
        , Having = sql_inject True
        , SelectFields = sql_subset [[T = ((_ :: {Type}), [])]]
        , SelectExps = {}
        }
    , OrderBy = sql_order_by_Nil [(_ :: {Type})]
    , Limit = sql_no_limit
    , Offset = sql_no_offset
    })
  );
  return <xml>
    <head/>
    <body>
      <p>Hello, {[r.T.Nam]}</p>
    </body>
  </xml>



