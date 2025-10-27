import src.jugador.*
import wollok.game.*


class Muro {
    const position
    const nombre = "pared"

    method nombre() = nombre
    method image() {
        return "paredgrande.jpg"
    }
    method position() {
        return position
    }
}

class Objetivo {
    const position
    const nombre = "objetivo"
    method nombre() = nombre
    method image() = "objetivogrande.jpg"
    method position() = position  

    method alcanzoElObjetivo(jugador) = jugador.position() == self.position()
    method alcanzarElObjetivo()
    {
        game.removeVisual(self)
    }
}

class HieloRoto {
    const position
    const textura = self.imagenRandom()

    method image() = textura

    method imagenRandom(){
        const texturasPosibles = ["hielorotogrande.jpg","hieloroto1grande.jpg","hieloroto2grande.jpg"]
        var sacarNum = 0
        return texturasPosibles.get(sacarNum.randomUpTo(2))
    }
    method position() = position
    method quitarHielo()
    {
        game.sound("pop.wav").play()
        game.removeVisual(self)
    }  
}