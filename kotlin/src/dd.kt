package src

import java.util.*

// Kotlin Hello World Program
fun main(args: Array<String>) {
    val x = arrayOf(1, 2, 3, 4)

    for (i in 1..10)
        println(i)
    for (i in 10 downTo 1)
        println(i)

    for (i in 1..10 step 2)
        print(i)
    val a = 1
    val scanner = Scanner(System.`in`)
    val b = scanner.nextInt()
    println(a)
    println(b)
    println(a + b)
    print(add(a, b))
    println("Hello World!")
    for (i in x)
        println(i)
    for ((i, e) in x.withIndex())
        println("$i  $e")

    val y = if ((1..199).random() % 2 == 1) {
        0
    } else {
        1
    }

    val w = when ((1..100).random() % 2) {
        0 -> 9
        1 -> 2
        else -> 100
    }


    val f = "12345"
    val g = "12345"

    println(f == g)
    println(f === g)


    println(insert("hello world ZJ"))
    print((1..100).random())
}

fun add(a: Int, b: Int): Int {
    return a + b
}


fun insert(a: String): String {
    return "$a  ${a.length} ${a.substring(0 until 1)}"
}


