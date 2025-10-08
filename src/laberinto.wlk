import wollok.game.*

class Muro {
    const position
    method image() {
        return "pared.jpg"
    }
    method position() {
        return position
    }
}

class Objetivo {
    const position
    method image() = "objetivo.jpg"
    method position() = position  
}