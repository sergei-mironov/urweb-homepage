module Cakefile where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Cakefile_P

instance IsString File where fromString = file

project = do

  let pn = "HomePage.urp"

  a <- uwapp "-dbms postgres" pn $ do
    debug
    sql (pn.="sql")
    library' (externalMake3
       "lib/urweb-monad-pack/Makefile"
       "lib/urweb-monad-pack/test/XmlGen.urp"
       "test/XmlGen.urp")
    ur (pair "HomePage.ur")

  db <- rule $ do
    let sql = urpSql (toUrp a)
    let dbn = takeBaseName sql
    shell [cmd|dropdb --if-exists $(string dbn)|]
    shell [cmd|createdb $(string dbn)|]
    shell [cmd|psql -f $(sql) $(string dbn)|]
    shell [cmd|touch @(sql.="db")|]

  rule $ do
    phony "all"
    depend db
    depend a

main = do
  writeMake (file "Makefile") (project)

