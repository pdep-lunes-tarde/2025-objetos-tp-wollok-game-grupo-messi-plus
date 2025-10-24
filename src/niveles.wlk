import src.tpIntegrador.*
import wollok.game.*
import laberinto.*
import jugador.*

class Nivel
{
    const objetivoNivel = new Objetivo(position=new Position(x=8, y=8))

    method objetivoNivel() = objetivoNivel
    method listaObstrucciones()
    method puntajeObjetivo()

    method comprobarSiSeGano(){
        return jugador.position() == self.objetivoNivel().position()
        && jugador.puntaje() == self.puntajeObjetivo()
    }
}

object nivel1 inherits Nivel
{   
    override method puntajeObjetivo() = 41
    override method listaObstrucciones() = [
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
        new Position(x=0, y=3),
        new Position(x=0, y=4),
        new Position(x=0, y=5),
        new Position(x=0, y=6),
        new Position(x=0, y=7),
        new Position(x=0, y=8),
        
        new Position(x=1, y=2), // muros interiores
        new Position(x=1, y=3),
        new Position(x=2, y=2),
        new Position(x=2, y=3),
        new Position(x=2, y=7),
        new Position(x=3, y=3),
        new Position(x=3, y=7),        
        new Position(x=4, y=3),
        new Position(x=4, y=7),
        new Position(x=5, y=2),
        new Position(x=5, y=3),
        new Position(x=5, y=4),
        new Position(x=5, y=7),
        new Position(x=6, y=2),
        new Position(x=6, y=4),
        new Position(x=6, y=6),
        new Position(x=7, y=2),
        new Position(x=7, y=3),
        new Position(x=7, y=4),
        new Position(x=7, y=6),
        new Position(x=8, y=6),
        new Position(x=8, y=7),
    
        new Position(x=0, y=9), // muro superior
        new Position(x=1, y=9),
        new Position(x=2, y=9),
        new Position(x=3, y=9),
        new Position(x=4, y=9),
        new Position(x=5, y=9),
        new Position(x=6, y=9),
        new Position(x=7, y=9),
        new Position(x=8, y=9),
        new Position(x=9, y=9),        
        
        new Position(x=9, y=1), // muro izquierdo
        new Position(x=9, y=2),
        new Position(x=9, y=3),
        new Position(x=9, y=4),
        new Position(x=9, y=5),
        new Position(x=9, y=6),
        new Position(x=9, y=7),
        new Position(x=9, y=8)
    ]
}

object nivel2 inherits Nivel
{   
    override method puntajeObjetivo() = 0
    override method listaObstrucciones() = [
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
        new Position(x=0, y=3),
        new Position(x=0, y=4),
        new Position(x=0, y=5),
        new Position(x=0, y=6),
        new Position(x=0, y=7),
        new Position(x=0, y=8),
        
        //muros interiores
        new Position(x= 1,y= 2),
        new Position(x= 1,y= 3),
        new Position(x= 1,y= 4),
        new Position(x= 1,y= 5),
        new Position(x= 1,y= 6),
        new Position(x= 3,y= 1),
        new Position(x= 3,y= 2),
        new Position(x= 3,y= 3),
        new Position(x= 3,y= 4),
        new Position(x= 4,y= 4),
        new Position(x= 4,y= 6),
        new Position(x= 4,y= 7),
        new Position(x= 4,y= 8),
        new Position(x= 5,y= 8),
        new Position(x= 6,y= 3),
        new Position(x= 6,y= 6),
        new Position(x= 6,y= 8),
        new Position(x= 7,y= 4),
        new Position(x= 7,y= 8),
        new Position(x= 8,y= 1),
        new Position(x= 8,y= 2),
    
        new Position(x=0, y=9), // muro superior
        new Position(x=1, y=9),
        new Position(x=2, y=9),
        new Position(x=3, y=9),
        new Position(x=4, y=9),
        new Position(x=5, y=9),
        new Position(x=6, y=9),
        new Position(x=7, y=9),
        new Position(x=8, y=9),
        new Position(x=9, y=9),        
        
        new Position(x=9, y=1), // muro izquierdo
        new Position(x=9, y=2),
        new Position(x=9, y=3),
        new Position(x=9, y=4),
        new Position(x=9, y=5),
        new Position(x=9, y=6),
        new Position(x=9, y=7),
        new Position(x=9, y=8)
    ]
}