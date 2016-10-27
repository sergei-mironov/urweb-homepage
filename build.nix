{ libraries ? {} }:

let

  uwb = (import <urweb-build>) { inherit libraries; };

in with uwb;

rec {

  libraries = {
    xmlw = external ./lib/urweb-xmlw;
    xmlw-test = external ./lib/urweb-xmlw;
    soup = external ./lib/urweb-soup;
    prelude = external ./lib/urweb-prelude;
    monad-pack = external ./lib/urweb-monad-pack;
    bootstrap = external ./lib/uru3/Bootstrap;
    bootstrap-demo = external ./lib/uru3/Bootstrap;
    bootstrap-misc = external ./lib/uru3/BootstrapMisc;
    uru = external ./lib/uru3/Uru;
    oilprice = external ./lib/oilprice;
    callback = external ./lib/urweb-callback;
    callback-demo = external ./lib/urweb-callback;
  };

  homepage = mkExe {
    name = "HomePage";
    dbms = "sqlite";

    libraries = libraries // { };

    statements = [
      (rule "allow url github.com/grwlf/urweb-etab")
      (rule "allow url github.com/grwlf/urweb-compet")
      (sys "list")
      (sys "char")
      (sys "string")
      (sys "option")
      (embed ./tut/Slides-Minsk-2014.pdf)
      (src ./HomePage.ur ./HomePage.urs)
    ];
  };

  oilprice = import ./lib/oilprice/build.nix { inherit libraries; };
  xmlw = import ./lib/urweb-xmlw/build.nix { inherit libraries; };
  bootstrap = import ./lib/uru3/Bootstrap/build.nix { inherit libraries; };
}


