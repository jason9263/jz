package src

class Dog(s: String) : Animal("Dog"){
    init {
        legCount = 5
    }

    override fun makeSound() {
        println("WUFF!!")
    }


    fun bark(){
        println("WUFF!!")
    }
}