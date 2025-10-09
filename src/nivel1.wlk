import src.tpIntegrador.*
import wollok.game.*
import laberinto.*
import jugador.*

object nivel1 inherits JuegoLaberinto
{   
    const nroNivel = 1
    const objetivoNivel = new Objetivo(position=new Position(x=8, y=3))
    const puntajeObjetivo = 12
    const listaObstrucciones = [
        new Position(x=0, y=0), // muro inferior
        new Position(x=1, y=0),
        new Position(x=2, y=0),
        new Position(x=3, y=0),
        new Position(x=4, y=0),
        new Position(x=5, y=0),
        new Position(x=6, y=0),
        new Position(x=7, y=0),
        new Position(x=8, y=0),
        new Position(x=9, y=0),

        new Position(x=0, y=1), // muro derecho
        new Position(x=0, y=2),
        
        new Position(x=1, y=2), // muro superior
        new Position(x=2, y=2),
        new Position(x=2, y=3),
        new Position(x=3, y=3),        
        new Position(x=4, y=3),
        new Position(x=5, y=2),
        new Position(x=5, y=3),
        new Position(x=6, y=2),
        new Position(x=7, y=2),
        new Position(x=7, y=3),
        new Position(x=7, y=4),
        new Position(x=8, y=4),
        
        new Position(x=9, y=1), // muro izquierdo
        new Position(x=9, y=2),
        new Position(x=9, y=3),
        new Position(x=9, y=4)
    ]

    method objetivoNivel() = objetivoNivel 
    method listaObstrucciones() = listaObstrucciones
    method puntajeObjetivo() = puntajeObjetivo 

    override method cargarVisuales()
    {   
        // paredes
        self.listaObstrucciones().map({posicion => self.crearVisual(new Muro(position = posicion))})
        //llegada
        self.crearVisual(objetivoNivel)
        game.whenCollideDo(jugador, { objeto => jugador.colision(objeto) })         
    }

}
