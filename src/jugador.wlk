import src.tpIntegrador.*
import wollok.game.*
import niveles.*
import laberinto.*


object jugador {
	var property position = game.at(1,1)
	var direccion = arriba
    var movimientos = [
        new Position(x=1, y=1)
    ]
	var hielos_rotos = []
	
	method movimientos() = movimientos
	method hielos_rotos() = hielos_rotos
	method puntaje() = movimientos.size()

	method restartListas()
	{
		movimientos = [new Position(x=1, y=1)]
		hielos_rotos = []
	}

    method image() {
        return "penguin2gde.png"
    }

// reseteo de jugador
    method restartJugador()
    {
        self.position(new Position(x=1, y=1))
        self.restartListas()
    }

    
// movimiento del jugador
	method retroceder() {
		const posicion_anterior = movimientos.get(movimientos.size() - 1)
		self.hielos_rotos().last().quitarHielo()
		movimientos.remove(movimientos.last())
		hielos_rotos.remove(hielos_rotos.last())

		position = posicion_anterior
	}
	
	method irenUnaDireccion(d) {
		self.setDireccion(d)
		self.avanzar()
	}

	method sePuedeAvanzar(sigPosicion) = 
	!(movimientos.contains(sigPosicion)) 
	&& juegoLaberinto.nivelActual().posicionValida(sigPosicion)
	
	method avanzar() {
		const proxPosicion = direccion.siguiente(position)
		if(self.sePuedeAvanzar(proxPosicion))
		{
			const hielo = new HieloRoto(position = position)
			hielos_rotos.add(hielo)
			game.addVisual(hielo)
			movimientos.add(position)

			game.sound("snow_feet_1.wav").play()
			position = proxPosicion
		}
	}

	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}

}

class Direccion {
	method siguiente(position)
    method opuesto()
}

object izquierda inherits Direccion { 
	override method siguiente(position) = position.left(1) 
	override method opuesto() = derecha
}

object derecha inherits Direccion { 
	override method siguiente(position) = position.right(1) 
	override method opuesto() = izquierda
}

object abajo inherits Direccion { 
	override method siguiente(position) = position.down(1) 
	override method opuesto() = arriba
}

object arriba inherits Direccion { 
	override method siguiente(position) = position.up(1) 
	override method opuesto() = abajo
}
