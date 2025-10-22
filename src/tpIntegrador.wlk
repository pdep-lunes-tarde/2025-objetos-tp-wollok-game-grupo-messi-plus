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
        keyboard.up().onPressDo({ jugador.irenUnaDireccion(arriba) })
		keyboard.down().onPressDo({ jugador.irenUnaDireccion(abajo) })
		keyboard.left().onPressDo({ jugador.irenUnaDireccion(izquierda) })
		keyboard.right().onPressDo({ jugador.irenUnaDireccion(derecha) })
        keyboard.w().onPressDo({ jugador.irenUnaDireccion(arriba) })
		keyboard.s().onPressDo({ jugador.irenUnaDireccion(abajo) })
		keyboard.a().onPressDo({ jugador.irenUnaDireccion(izquierda) })
		keyboard.d().onPressDo({ jugador.irenUnaDireccion(derecha) })
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