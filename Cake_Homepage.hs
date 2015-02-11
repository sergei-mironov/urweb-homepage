module Cake_Homepage where

import Development.Cake3
import Development.Cake3.Ext.UrWeb as UW
import Development.Cake3.Utils.Slice

import qualified Cake_Compet as Compet
import qualified Cake_Callback as Callback
import qualified Cake_Bootstrap as Bootstrap
import qualified Cake_URU as Uru
import qualified Cake_Prelude as Prelude
import qualified Cake_MonadPack as Prelude
import qualified Cake_XMLW as XMLW
import Cake_Homepage_P

pn = file "HomePage.urp"

app = uwapp "-dbms postgres" pn $ do
  debug
  library Compet.app
  library Callback.demo
  library Bootstrap.demo1
  library Bootstrap.demo2
  library Bootstrap.demo3
  library Bootstrap.demo_modal
  library Bootstrap.demo_narrow
  library XMLW.demo
  sql (pn.="sql")
  database ("dbname="++(takeBaseName pn))
  rewrite UW.all "HomePage/main"
  embed (file "tut/Slides-Minsk-2014.pdf")
  ur (pair (file "HomePage.ur"))

db = rule $ do
  let sql = (pn.="sql")
  let dbn = takeBaseName sql
  shell [cmd|dropdb --if-exists $(string dbn)|]
  shell [cmd|createdb $(string dbn)|]
  shell [cmd|psql -f $(sql) $(string dbn)|]
  shell [cmd|touch @(sql.="db")|]

main = writeMake (file "Makefile") $ do

  rule $ do
    phony "dropdb"
    depend db

  rule $ do
    phony "all"
    depend app

