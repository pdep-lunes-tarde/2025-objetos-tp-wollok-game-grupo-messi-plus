import src.jugador.*
import wollok.game.*
import src.tpIntegrador.juegoLaberinto


class Muro {
    const position
    

    
    method image() {
        return "paredgrande.jpg"
    }
    method position() {
        return position
    }
}

class Objetivo {
    const position
    
    method image() = "objetivogrande.jpg"
    method position() = position  

    method alcanzoElObjetivo(jugador) = jugador.position() == self.position()

    method colisionConJugador(){
        juegoLaberinto.nivelActual().comprobarSiSeGano() 
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
