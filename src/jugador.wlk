import src.tpIntegrador.*
import wollok.game.*
import nivel1.*
import laberinto.*


object jugador {
	var property position = game.at(1,1)
	var direccion = arriba
	var nivelActual = juegoLaberinto.nivelActual()
    var movimientos = [
        new Position(x=1, y=1)
    ]
	

	method puntaje() = movimientos.size()

	method restartMovimientos()
	{
		movimientos = [new Position(x=1, y=1)]
	}

    method image() {
        return "penguin2gde.png"
    }

// reseteo de jugador
    method restartJugador()
    {
        self.position(new Position(x=1, y=1))
        self.restartMovimientos()
    }

// colisiones con bloques

	method colision(objeto)
    {	
		if(nivelActual.comprobarSiSeGano()) 
			{	
				game.say(self, "gane!")
                juegoLaberinto.ganar()
			}
	}
    
// movimiento del jugador
	method retrocede() {
		position = direccion.opuesto().siguiente(position)
	}
	
	method irenUnaDireccion(d) {
		self.setDireccion(d)
		self.avanzar()
	}

	method sePuedeAvanzar(sigPosicion) = 
	!(movimientos.contains(sigPosicion)) 
	&& !(nivelActual.listaObstrucciones().contains(sigPosicion))
	
	method avanzar() {
		const proxPosicion = direccion.siguiente(position)
		if(self.sePuedeAvanzar(proxPosicion))
		{
			game.addVisual(new HieloRoto(position = position))
			movimientos.add(position)
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