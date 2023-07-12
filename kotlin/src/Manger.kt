interface Clickable {
    fun click()
}

class Button : Clickable {
    override fun click() = println("here is manager")
}
fun main() {
    Button.click()
}