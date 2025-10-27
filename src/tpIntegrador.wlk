import src.jugador.*
import wollok.game.*
import src.laberinto.*
import niveles.*

object juegoLaberinto {
    const listaNiveles = [nivel1, nivel2]
    var nroNivel = 0

    method nivelActual() = listaNiveles.get(nroNivel)
    
    method cargarVisuales()
    {   
        game.addVisual(instrucciones)
        // paredes
        self.nivelActual().listaObstrucciones().map({posicion => self.crearVisual(new Muro(position = posicion))})
        //llegada
        self.crearVisual(self.nivelActual().objetivoNivel())
        game.whenCollideDo(jugador, { objeto => jugador.colision(objeto) })         
    }

    method restart() {
        game.sound("ohno_retry.wav").play()
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
        game.clear()
        jugador.restartJugador()    

        if(self.nivelActual() != listaNiveles.last())
        {    
            nroNivel += 1
            self.jugar()
        } else
        {
            game.addVisual(instrucciones)
            game.addVisual(ganaste)
        }
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
        keyboard.x().onPressDo({ jugador.retroceder() })
    }
}

object ganaste {
    method image() = "ganaste2.png"
    method position() = new Position(x=0, y=0) 
}

object instrucciones {
    method image() = "instrucciones.jpg"
    method position() = new Position(x=10, y=0)
}
