import src.tpIntegrador.*
import wollok.game.*
import laberinto.*
import jugador.*

object nivel1 inherits JuegoLaberinto
{   
    const nroNivel = 1
    const objetivoNivel = new Objetivo(position=new Position(x=8, y=3))
    const puntajeObjetivo = 12

    method objetivoNivel() = objetivoNivel 

    method puntajeObjetivo() = puntajeObjetivo 

    override method cargarVisuales()
    {   
        // paredes
        game.addVisual(new Muro(position=new Position(x=0, y=0)))
        game.addVisual(new Muro(position=new Position(x=0, y=1)))
        game.addVisual(new Muro(position=new Position(x=0, y=2)))

        game.addVisual(new Muro(position=new Position(x=1, y=0)))
        game.addVisual(new Muro(position=new Position(x=1, y=2)))

        game.addVisual(new Muro(position=new Position(x=2, y=0)))
        game.addVisual(new Muro(position=new Position(x=2, y=2)))
        game.addVisual(new Muro(position=new Position(x=2, y=3)))

        game.addVisual(new Muro(position=new Position(x=3, y=0)))
        game.addVisual(new Muro(position=new Position(x=3, y=3)))

        game.addVisual(new Muro(position=new Position(x=4, y=0)))
        game.addVisual(new Muro(position=new Position(x=4, y=3)))

        game.addVisual(new Muro(position=new Position(x=5, y=0)))
        game.addVisual(new Muro(position=new Position(x=5, y=2)))
        game.addVisual(new Muro(position=new Position(x=5, y=3)))

        game.addVisual(new Muro(position=new Position(x=6, y=0)))
        game.addVisual(new Muro(position=new Position(x=6, y=2)))

        game.addVisual(new Muro(position=new Position(x=7, y=0)))
        game.addVisual(new Muro(position=new Position(x=7, y=2)))
        game.addVisual(new Muro(position=new Position(x=7, y=3)))
        game.addVisual(new Muro(position=new Position(x=7, y=4)))
        game.addVisual(new Muro(position=new Position(x=8, y=4)))

        game.addVisual(new Muro(position=new Position(x=8, y=0)))

        game.addVisual(new Muro(position=new Position(x=9, y=0)))
        game.addVisual(new Muro(position=new Position(x=9, y=1)))
        game.addVisual(new Muro(position=new Position(x=9, y=2)))
        game.addVisual(new Muro(position=new Position(x=9, y=3)))
        game.addVisual(new Muro(position=new Position(x=9, y=4)))

        //llegada
        game.addVisual(objetivoNivel)
        game.whenCollideDo(jugador, { objeto => jugador.colision(objeto) })         
    }

}
