sealed class Expr {
    class Num(val value: Double) : Expr()
    class Sum(val left: Expr, val right: Expr) : Expr()
    object NotANumberJZ : Expr()
}


fun eval(e: Expr): Double =
    when (e) {
        is Expr.Num -> e.value
        is Expr.Sum -> eval(e.left) + eval(e.right)
        else -> {
            Double.NaN
        }
    }


fun main(args: Array<String>) {

}