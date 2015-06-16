
fun main {} : transaction page =
  return
  <xml>
    <head>
      <title>Sergey Mironov</title>
    </head>
    <body>
      <h2>Ur/Web</h2>
      <p>
      <h3>Etab</h3>
      <a link={Etab.main {}}>Archery competitions table (in Russian)</a>
      </p>
      <p>
      <h3>Oilprice</h3>
      <a link={Oilprice.main {}}>Oilprice demo</a>
      </p>
      <p>
      <h3>Urweb-XMLW</h3>
      <a link={XMLW1.main {}}>XMLW demo</a>
      </p>
      <p>
      <h3>Compet</h3>
      The archery competitions helper in it's early development state. In
      this application XmlGen monad is used for the HTML generation.
      <a link={Compet.main {}}>Compet main page</a>
      </p>
      <p>
      <h3>Urweb-callback</h3>
      <a link={Demo2.main {}}>Ping demo</a>
      </p>
      <p>
      <h3>Uru/Bootstrap</h3>
      <a link={B1.main {}}>Starter template demo</a>
      <a link={B2.main {}}>Bootstrap theme demo</a>
      <a link={B3_Login.main {}}>Login page demo</a>
      <a link={Modal.main {}}>Modal form demo</a>
      <a link={Narrow.main {}}>Narrow jumbotron demo</a>
      </p>

      <h2>Slides and materials</h2>
      <p>
      <a link={Slides_Minsk_2014_pdf.content {}} download="UrWeb-Minsk-2014.pdf">Minsk, October 25, 2014</a>
      </p>

    </body>
  </xml>

