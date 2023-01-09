package src

abstract class Animal(
    val name: String,
    var legCount: Int = 4
) {
    init {
        println("hello name is $name")
    }

    abstract fun makeSound()
}