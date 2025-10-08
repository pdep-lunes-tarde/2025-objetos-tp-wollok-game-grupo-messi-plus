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

	method inicializarMovimientos()
	{
		movimientos = [new Position(x=1, y=1)]
	}

    method image() {
        return "penguin.png"
    }
// set y get del nivActual
    method nivelActual(nvoNivel) {
        nivelActual = nvoNivel
    }

    method nivelActual() = nivelActual 
// reseteo de jugador
    method restartJugador()
    {
        self.position(new Position(x=1, y=1))
        self.inicializarMovimientos()
    }

// colisiones con bloques

	method colision(objeto)
    {
        if(objeto.nombre() == "pared")
        {
            self.retrocede()
        }
        if(objeto.nombre() == "objetivo")
        {	
			var primeraVez = true
			if(self.position() == objeto.position()
			 	&& 
				 movimientos.size() == nivelActual.puntajeObjetivo()
				 &&
				 primeraVez) // && todos los hielos estan rotos, pisados
			{	
				primeraVez = false
				game.say(self, "gane!")
                //niveles.get(objeto.nivelActual()).ganar()
			}
			if(!primeraVez && self.position() == objeto.position() && movimientos.size() == nivelActual.puntajeObjetivo())
			{
				game.say(self, "gane de nuevo!")	
			} 
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
	
	method irArriba() {
		direccion = arriba
		self.avanzar()
	}

	method irAbajo() {
		direccion = abajo
		self.avanzar()
	}

	method irIzquierda() {
		direccion = izquierda
		self.avanzar()
	}

	method irDerecha() {
		direccion = derecha
		self.avanzar()
	}
	
	method avanzar() {
		const proxPosicion = direccion.siguiente(position)
		if(!movimientos.contains(proxPosicion) && position != nivelActual.objetivoNivel().position())
		{
		game.addVisual(new Hielo(position = position))
		movimientos.add(position)
		position = proxPosicion
		}
	}
	
	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}
	// set y get de posicion
    method position() = position
    method position(_position) {
		position = _position	
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