
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
      <p>Archery competitions table (in Russian)</p>
      <p><a href="https://github.com/grwlf/urweb-etab">Sources</a></p>
      </p>

      <p>
      <h3>Oilprice</h3>
      <a link={Oilprice.main {}}>Oilprice demo</a>
      <p><a href="https://github.com/grwlf/oilprice">Source</a></p>
      </p>

      <p>
      <h3>Urweb-XMLW</h3>
      Monadic interface (a Writer) for producing XML in Ur/Web.
      <p><a href="https://github.com/grwlf/urweb-xmlw">Sources</a></p>
      <p><a link={XMLW1.main {}}>XMLW demo</a></p>
      </p>

      <p>
      <h3>Compet</h3>
      The archery competitions helper in it's early development state. In
      this application XmlGen monad is used for the HTML generation.
      (* <a link={Compet.main {}}>Compet main page</a> *)
      <p><a href="https://github.com/grwlf/urweb-compet">Source</a></p>
      </p>

      <p>
      <h3>Urweb-callback</h3>
      A library for managing long-running processes
      <p><a href="https://github.com/grwlf/urweb-callback">Source</a></p>
      <p><a link={Demo2.main {}}>Ping demo</a></p>
      </p>

      <p>
      <h3>Urweb-captcha</h3>
      Captcha interface
      <p><a href="https://github.com/grwlf/urweb-captcha">Source</a></p>
      <p><a link={Captcha1.main {}}>Captcha demo</a></p>
      </p>

      <p>
      <h3>Uru</h3>
      Uru is a collection of self-contained UI modules. Currently it includes
      <p><a href="https://github.com/grwlf/uru3">Source</a></p>
      <a link={B1.main {}}>Bootstrap starter template</a>
      <a link={B2.main {}}>Bootstrap theme</a>
      <a link={B3_Login.main {}}>Login page</a>
      <a link={Modal.main {}}>Modal form dialog</a>
      <a link={Narrow.main {}}>Narrow jumbotron</a>
      <a link={Audio1.main {}}>Audio control</a>
      </p>

      <h2>Fitness bracelet comparision</h2>
      <p>
      <a link={Fitness.chart {}}>chart</a>
      </p>

      <h2>Slides and materials</h2>
      <p>
      <a link={Slides_Minsk_2014_pdf.content {}} download="UrWeb-Minsk-2014.pdf">Minsk, October 25, 2014</a>
      </p>


    </body>
  </xml>

