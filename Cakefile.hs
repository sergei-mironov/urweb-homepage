module Cakefile where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Cake_Compet hiding(main)
import Cakefile_P

instance IsString File where fromString = file

project = do

  let pn = "HomePage.urp"

  cmp <- theapp
    (library' (externalMakeTarget (file "lib/urweb-compet/lib/uru3/Bootstrap/lib.urp") "lib"))
    (library' (externalMakeTarget (file "lib/urweb-monad-pack/lib.urp") "lib"))

  a <- uwapp "-dbms postgres" pn $ do
    debug
    library' (externalMake3
       "lib/urweb-monad-pack/Makefile"
       "lib/urweb-monad-pack/test/XmlGenDemo.urp"
       "test/XmlGenDemo.urp")
    library' (return [urp $ toUrp cmp])
    sql (pn.="sql")
    database ("dbname="++(takeBaseName pn))
    ur (pair "HomePage.ur")

  db <- rule $ do
    let sql = urpSql (toUrp a)
    let dbn = takeBaseName sql
    shell [cmd|dropdb --if-exists $(string dbn)|]
    shell [cmd|createdb $(string dbn)|]
    shell [cmd|psql -f $(sql) $(string dbn)|]
    shell [cmd|touch @(sql.="db")|]

  rule $ do
    phony "dropdb"
    depend db

  rule $ do
    phony "all"
    depend db
    depend a

main = do
  writeMake (file "Makefile") (project)

