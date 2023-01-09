package src

import java.awt.Color

class JZ(var id: Int)

data class Student(val id: Int, var name: String, val gender: Int)

fun getMnemonic(color: Color) =
    when (color) {
        Color.RED -> 'J'
        Color.ORANGE -> 'Z'
        else -> 'K'
    }

fun mix(c1: Color, c2: Color) =
    when (setOf<Color>(c1, c2)) {
        setOf(Color.RED, Color.YELLOW) -> "J"

        else -> {
            "Z"
        }
    }

fun isEven(number: Int = 10): Boolean {
    return number % 2 != 1
}


fun Int.isOdd(): Boolean {
    return this % 2 == 1
}


fun<T> List<T>.customCount(function: (T) -> Boolean): Int {
    var counter = 0
    for (string in this) {
        if (function(string)) {
            counter++
        }
    }

    return counter
}


//fun main(args: Array<String>) {
//    val list = listOf<String>("a", "b", "c")
//    val count = list.customCount { currentStr ->
//        currentStr.length == 1
//    }
//
//    println(count)
//}
