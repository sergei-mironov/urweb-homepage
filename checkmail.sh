#!/bin/sh
swaks "-s" "smtp.gmail.com"  "-p" "587" "-t" ierton@gmail.com "-f" grrwlf@gmail.com "--header" "Subject: ccc" "-S" "--protocol" "ESMTP" "-tls" "-a" "-au" "ierton@gmail.com" "-ap" "12Usvtqkbot" "--body" "test" "--timeout" "5"

