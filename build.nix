{ libraries ? {} }:

let

  uwb = (import <urweb-build>) { inherit libraries; };

in with uwb;

rec {

  libraries = {
    xmlw = external ./lib/urweb-xmlw;
    soup = external ./lib/urweb-soup;
    prelude = external ./lib/urweb-prelude;
    monad-pack = external ./lib/urweb-monad-pack;
    bootstrap = external ./lib/uru3/Bootstrap;
    bootstrap-misc = external ./lib/uru3/BootstrapMisc;
    uru = external ./lib/uru3/Uru;
  };

  homepage = mkExe {
    name = "HomePage";
    dbms = "sqlite";

    inherit libraries;

    statements = [
      (set "allow mime text/css")
      (sys "list")
      (sys "char")
      (sys "string")
      (sys "option")
      (embed ./favicon.ico)
      (embed ./flag_ru.gif)
      (embed ./flag_uk.gif)
      (embed-css ./Oilprice.css)
      (src ./Oilprice.ur ./Oilprice.urs)
    ];
  };

  oilprice = import ./lib/oilprice/build.nix { inherit libraries; };
}



