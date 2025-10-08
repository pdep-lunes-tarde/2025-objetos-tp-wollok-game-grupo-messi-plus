import wollok.game.*
import src.tpIntegrador.*
import laberinto.*

//  PENDIENTE
object nivel2 inherits JuegoLaberinto
{   
    const objetivoNivel = new Objetivo(position=new Position(x=8, y=3))
    const nroNivel = 2
    method cargarVisuales() 
    {
        
    }

    method setNivelActualAJugador(objeto)
    {
        objeto.nivelActual(nroNivel)
    }

    method comprobarSiGano(jugador)
    {
        return jugador.position() == objetivoNivel.position()
    }
}