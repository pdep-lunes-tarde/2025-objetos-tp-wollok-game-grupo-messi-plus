import src.jugador.*
import wollok.game.*
import src.laberinto.*
import niveles.*

object juegoLaberinto {
    const listaNiveles = [nivel1, nivel2]
    var nroNivel = 0
    var nivelActual = listaNiveles.get(nroNivel)

    method nivelActual() = nivelActual 
    
    method cargarVisuales()
    {   
        // paredes
        nivelActual.listaObstrucciones().map({posicion => self.crearVisual(new Muro(position = posicion))})
        //llegada
        self.crearVisual(nivelActual.objetivoNivel())
        game.whenCollideDo(jugador, { objeto => jugador.colision(objeto) })         
    }

    method restart() {
        game.clear()
        configurador.configurar(self)
        jugador.restartJugador()
        self.cargarVisuales() 
    }
    
    method jugar() {
        self.cargarVisuales()
        configurador.configurar(self)
        if(nroNivel == 0)
        {game.start()}
    }

    method crearVisual(dibujo)
    {
        game.addVisual(dibujo)
		return dibujo
    }
    
     method ganar() {
        nroNivel =+ 1
        nivelActual = listaNiveles.get(nroNivel)
        self.restart()
        self.jugar()
     }
}

object configurador{
    method configurar(laberinto)
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
        keyboard.r().onPressDo({ laberinto.restart() })
    }
}


