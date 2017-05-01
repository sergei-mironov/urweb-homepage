open BootstrapStyles

datatype water = Water of string
datatype bike = Bike of string
datatype life = Life of int
datatype price = Price of int
datatype gps = GPS of string

val none = "no"
val yes = "yes"

fun bracelet nm lnk (lnk_img:url)
  (Water water)
  (Bike bike)
  (Life life)
  (GPS gps)
  (Price price)
  =
  <xml>
    <tr>
    <td><a href={lnk}>{[nm]}</a></td>
    <td><img src={lnk_img} height=100 width=100/></td>
    <td>{[water]}</td>
    <td>{[bike]}</td>
    <td>{[life]}</td>
    <td>{[gps]}</td>
    <td>${[price]}</td>
    </tr>
  </xml>


fun chart {} : transaction page =
  Uru.run (
  JQuery.add (
  Bootstrap.add (
  Soup.narrow (fn nar =>
  Uru.withBody (fn _ =>

    return
    <xml>
    {nar.Container
    <xml>
    <table class="bs3_table">
      <tr>
      </tr>

      {bracelet
        "Garmin Vivosmart HR+"
        (bless "https://buy.garmin.com/en-US/US/p/548743#overview")
        (bless "https://static.garmincdn.com/en/products/010-01955-36/v/cf-lg.jpg")
        (Water "WR50")
        (Bike yes)
        (Life 5)
        (GPS yes)
        (Price 179)
      }

      {bracelet
        "Garmin Vivosmart HR"
        (bless "https://buy.garmin.com/en-US/US/p/531166#overview")
        (bless "https://static.garmincdn.com/en/products/010-01955-06/v/cf-lg.jpg")
        (Water "WR50")
        (Bike none)
        (Life 5)
        (GPS none)
        (Price 150)
      }

      {bracelet
        "Fitbit alta HR"
        (bless "https://www.fitbit.com/altahr")
        (bless "https://static1.fitbit.com/simple.b-cssdisabled-png.h9f07b4f134b27ac12bcd8fe0e87668a0.pack?items=%2Fcontent%2Fassets%2Fpip%2Fimages%2Fproducts%2Fatm_blue_gray_3qtr.png")
        (Water none)
        (Bike "via SmartTrack")
        (Life 7)
        (GPS none)
        (Price 130)
      }


    </table>
    </xml>
    }
    {nar.Footer
    <xml>
    </xml>
    }
    </xml>

  )))))
