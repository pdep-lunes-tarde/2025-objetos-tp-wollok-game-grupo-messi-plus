import src.jugador.*
import wollok.game.*
import src.laberinto.*
import nivel1.*
import nivel2.*

class JuegoLaberinto {
    const listaNiveles = [nivel1, nivel2]
    const player = jugador
    var nivelActual = 1 
    
    method cargarVisuales()
    method player() = jugador

    method restart() {
        game.clear()
        configurador.configurar(self)
        jugador.restartJugador()
        self.cargarVisuales() 
    }
    
    method jugar() {
        self.cargarVisuales()
        configurador.configurar(self)
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

object configurador{
    method configurar(laberinto)
    {
        game.addVisual(laberinto.player())
        keyboard.up().onPressDo({ laberinto.player().irenUnaDireccion(arriba) })
		keyboard.down().onPressDo({ laberinto.player().irenUnaDireccion(abajo) })
		keyboard.left().onPressDo({ laberinto.player().irenUnaDireccion(izquierda) })
		keyboard.right().onPressDo({ laberinto.player().irenUnaDireccion(derecha) })
        keyboard.w().onPressDo({ laberinto.player().irenUnaDireccion(arriba) })
		keyboard.s().onPressDo({ laberinto.player().irenUnaDireccion(abajo) })
		keyboard.a().onPressDo({ laberinto.player().irenUnaDireccion(izquierda) })
		keyboard.d().onPressDo({ laberinto.player().irenUnaDireccion(derecha) })
        keyboard.r().onPressDo({ laberinto.restart() })
    }
}