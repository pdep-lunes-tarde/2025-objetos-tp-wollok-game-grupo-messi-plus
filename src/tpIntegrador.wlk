import src.jugador.*
import wollok.game.*
import src.laberinto.*
import nivel1.*
import nivel2.*

const niveles = [nivel1, nivel2]

class JuegoLaberinto {
    
    method cargarVisuales()
    
    method configurar()
    {
        game.addVisual(jugador)
        keyboard.up().onPressDo({ jugador.irArriba() })
		keyboard.down().onPressDo({ jugador.irAbajo() })
		keyboard.left().onPressDo({ jugador.irIzquierda() })
		keyboard.right().onPressDo({ jugador.irDerecha() })
        keyboard.w().onPressDo({ jugador.irArriba() })
		keyboard.s().onPressDo({ jugador.irAbajo() })
		keyboard.a().onPressDo({ jugador.irIzquierda() })
		keyboard.d().onPressDo({ jugador.irDerecha() })
        keyboard.r().onPressDo({ self.restart() })
    }

    method restart() {
        game.clear()
        self.configurar()
        jugador.restartJugador()
        self.cargarVisuales() 
    }
    
    method jugar() {
        self.cargarVisuales()
        self.configurar()
        game.start()
    }

    method crearVisual(dibujo)
    {
        game.addVisual(dibujo)
		return dibujo
    }
    
    // method ganar(objeto) {
    //     var nroNivel = objeto.nivelActual()
    //     game.clear()
    //     niveles.get(nroNivel).jugar()
    // }
}