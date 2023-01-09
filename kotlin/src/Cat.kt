package src

class Cat(s: String) : Animal("cat") {

    override fun makeSound() {
        println("memo  $name  $legCount")
    }

    fun meow() {
        println("memo  $name  $legCount")
    }
}