open Slides_Minsk_2014_pdf_c
fun content {} = b <- blob () ; returnBlob b (blessMime "application/pdf")
val propagated_urls : list url = 
    []
val url = url(content {})
val geturl = url
