
type myRecord = record [A=int, B=float, C=string, D=bool]
val x:myRecord = { A = 0, B = 1.2, C = "world", D = True }
val v1 = x.A (* == 0: int *)
val v2 = x.C (* == ("hi": string)  *)

type myRecord2 = record [A=int, Z=xbody]
val y:myRecord2 = { A = 5,  Z = <xml><p>Hello, {[x.C]}</p></xml> }
val v3 = y.A (* == 5 *)

fun getA r : int = r.A
val v4 = getA x (* Работает, если убрать следующую строчку *)
val v5 = getA y (* Работает, если убрать предыдущую строчку *)
                (* Две строчки вместе вызывают ошибку проверки типов *)

fun getA [t:::{Type}] [t~[A]] (r:record (t++[A=int])) : int = r.A
val v4 = getA x (* == 0 *)
val v5 = getA y (* == 5 *)

fun main {} : transaction page =
  return <xml><head/><body/></xml>


