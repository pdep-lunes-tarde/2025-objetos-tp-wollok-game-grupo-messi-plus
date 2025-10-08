import wollok.game.*


class Muro {
    const position
    const nombre = "pared"

    method nombre() = nombre
    method image() {
        return "pared.jpg"
    }
    method position() {
        return position
    }
}

class Objetivo {
    const position
    const nombre = "objetivo"
    method nombre() = nombre
    method image() = "objetivo.jpg"
    method position() = position  
}

class Hielo {
    const position
    const nombre = "hielo"
    method nombre() = nombre
    method image() = "piso.jpg"
    method position() = position  
}