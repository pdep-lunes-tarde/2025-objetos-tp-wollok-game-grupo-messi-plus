import src.jugador.*
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

    method alcanzoElObjetivo(jugador) = jugador.position() == self.position()
}

class HieloRoto {
    const position
    var textura = self.imagenRandom()

    method image() = textura

    method imagenRandom(){
        const texturasPosibles = ["hieloroto.jpg","hieloroto1.jpg","hieloroto2.jpg"]
        var sacarNum = 0
        return texturasPosibles.get(sacarNum.randomUpTo(2))
    }
    method position() = position  
}