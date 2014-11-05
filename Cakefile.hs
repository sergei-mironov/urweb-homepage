module Cakefile where

import Development.Cake3
import Development.Cake3.Ext.UrWeb as UW
import qualified Cake_Compet as Compet hiding(main)
import qualified Cake_Callback as Callback hiding(main)
import qualified Cake_Bootstrap as Bootstrap hiding(main)
import qualified Cake_Prelude as Prelude hiding(main)
import Cakefile_P

instance IsString File where fromString = file

project = do

  let pn = "HomePage.urp"

  dc <- Callback.demo_callback

  b1 <- Bootstrap.demo1 [NoScan]
  b2 <- Bootstrap.demo2 [NoScan]
  b3 <- Bootstrap.demo3 [NoScan]

  p <- Prelude.thelib

  cmp <- Compet.theapp
    (library p)
    (library' (externalMakeTarget (file "lib/uru3/Bootstrap/lib.urp") "lib"))
    (library' (externalMakeTarget (file "lib/urweb-monad-pack/lib.urp") "lib"))

  a <- uwapp "-dbms postgres" pn $ do
    debug
    library' (externalMake3
       "lib/urweb-monad-pack/Makefile"
       "lib/urweb-monad-pack/test/XmlGenDemo.urp"
       "test/XmlGenDemo.urp")
    library' (return [urp $ toUrp cmp])
    library' (return [urp $ toUrp dc])
    library' (return $ map (urp . toUrp) [b1,b2,b3])
    sql (pn.="sql")
    database ("dbname="++(takeBaseName pn))
    rewrite UW.all "HomePage/main"
    bin (file "tut/Slides-Minsk-2014.pdf") []
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

