import src.jugador.*
import wollok.game.*
import src.laberinto.*

object juegoLaberinto {
    //tablero
    const intervaloDeTiempoInicial = 10
    var intervaloDeTiempo = intervaloDeTiempoInicial

    method ancho() = 10
    method alto() = 10

    method configurar()
    {
        game.width(self.ancho())
        game.height(self.alto())
        game.cellSize(34)
        game.boardGround("fondo.png")
        
        game.addVisual(jugador)

        /*---------------prueba para nivel 1-------------------*/
        game.addVisual(new Muro(position=new Position(x=0, y=0)))
        game.addVisual(new Muro(position=new Position(x=0, y=1)))
        game.addVisual(new Muro(position=new Position(x=0, y=2)))

        game.addVisual(new Muro(position=new Position(x=1, y=0)))
        game.addVisual(new Muro(position=new Position(x=1, y=2)))

        game.addVisual(new Muro(position=new Position(x=2, y=0)))
        game.addVisual(new Muro(position=new Position(x=2, y=2)))

        game.addVisual(new Muro(position=new Position(x=3, y=0)))
        game.addVisual(new Muro(position=new Position(x=3, y=2)))

        game.addVisual(new Muro(position=new Position(x=4, y=0)))
        game.addVisual(new Muro(position=new Position(x=4, y=2)))

        game.addVisual(new Muro(position=new Position(x=5, y=0)))
        game.addVisual(new Muro(position=new Position(x=5, y=2)))

        game.addVisual(new Muro(position=new Position(x=6, y=0)))
        game.addVisual(new Muro(position=new Position(x=6, y=2)))

        game.addVisual(new Muro(position=new Position(x=7, y=0)))
        game.addVisual(new Muro(position=new Position(x=7, y=2)))

        game.addVisual(new Muro(position=new Position(x=8, y=0)))

        game.addVisual(new Muro(position=new Position(x=9, y=0)))
        game.addVisual(new Muro(position=new Position(x=9, y=1)))
        game.addVisual(new Muro(position=new Position(x=9, y=2)))
        /*---------------prueba para nivel 1-------------------*/

        game.onTick(intervaloDeTiempo, "movimiento", { jugador.move() })

        keyboard.space().onPressDo {
            intervaloDeTiempo -= 5
            game.removeTickEvent("movimiento")
            game.onTick(intervaloDeTiempo, "movimiento", { jugador.move() })

        }

        keyboard.right().onPressDo {
            jugador.direccion(derecha)    
        }
        keyboard.d().onPressDo {
            jugador.direccion(derecha)
        }
        keyboard.left().onPressDo {
            jugador.direccion(izquierda)
        }
        keyboard.a().onPressDo {
            jugador.direccion(izquierda)
        }
        keyboard.up().onPressDo {
            jugador.direccion(arriba)
        }
        keyboard.w().onPressDo {
            jugador.direccion(arriba)
        }
        keyboard.down().onPressDo {
            jugador.direccion(abajo)
        }
        keyboard.s().onPressDo {
            jugador.direccion(abajo)
        }
    }

    method restart() {
        game.clear()
        self.configurar()
    }
    
    method jugar() {
        self.configurar()
        game.start()
    }
}