import src.tpIntegrador.*
import wollok.game.*
import nivel1.*
import laberinto.*


object jugador {
	var property position = game.at(1,1)
	var direccion = arriba
	var property nivelActual = nivel1
    var movimientos = [
        new Position(x=1, y=1)
    ]

	method restartMovimientos()
	{
		movimientos = [new Position(x=1, y=1)]
	}

    method image() {
        return "penguin2.png"
    }

// reseteo de jugador
    method restartJugador()
    {
        self.position(new Position(x=1, y=1))
        self.restartMovimientos()
    }

// colisiones con bloques
	method comprobarSiGano() = self.position() == nivelActual.objetivoNivel().position() 
							&& movimientos.size() == nivelActual.puntajeObjetivo()
	method colision(objeto)
    {	
		
        if(objeto.nombre() == "objetivo")
        {	
			if(self.comprobarSiGano()) 
			{	
				game.say(self, "gane!")
                //niveles.get(objeto.nivelActual()).ganar()
			}
			// if(!primeraVez && self.position() == objeto.position() && movimientos.size() == nivelActual.puntajeObjetivo())
			// {
			// 	game.say(self, "gane de nuevo!")	
			// } 
        }
		if(objeto.nombre() == "hielo")
		{
			game.say(self, "no pises hielo")
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
		//if(!movimientos.contains(proxPosicion) && position != nivelActual.objetivoNivel().position())
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