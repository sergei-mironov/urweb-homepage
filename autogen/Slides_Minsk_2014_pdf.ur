val binary = Slides_Minsk_2014_pdf_c.binary
val text = Slides_Minsk_2014_pdf_c.text
fun blobpage {} = b <- binary () ; returnBlob b (blessMime "application/pdf")
val geturl = url(blobpage {})
val propagated_urls = 
    []
