CurrentState S ;

color grey = color(255) ;
void setup() {
    size( 800 , 800 ) ;
    background(grey) ;
   
    noStroke() ;
    frameRate(1000) ;
    S = new CurrentState(width/2,height/2) ;
    //S.DrawAHexagon1(100,100) ;
    S.DrawAHexagon2() ;
    S.pos.x += 2*centerBorderDistance ;
    S.dir.rotate( -TAU/4-TAU/12 ) ;    
}

int nbHexaToDraw = 1 ;
int nbHexaDrawn = 0 ;
int nbSideDrawn = 0 ;
void draw(){
    if( S.pos.x + S.pos.y > width + height + 6 * centerVertexDistance ){
      background(grey) ;
      S.pos.x = width/2 ;
      S.pos.y = height/2 ;
      S.hue = 3 ;
      S.dir = new PVector(2*centerBorderDistance , 0) ;
      S.DrawAHexagon2() ;
      S.pos.x += 2*centerBorderDistance ;
      S.dir.rotate( -TAU/4-TAU/12 ) ;    
      nbHexaToDraw = 1 ;
      nbHexaDrawn = 0 ;
      nbSideDrawn = 0 ;
    }
    else{
      if( nbSideDrawn < 6 ){
        if( nbHexaDrawn < nbHexaToDraw ){
          S.pos.add( S.dir ) ;
          S.DrawAHexagon2() ;
          nbHexaDrawn += 1 ;
        }
        else{
          S.dir.rotate( -TAU/6 ) ;
          nbHexaDrawn = 0 ;
          nbSideDrawn += 1 ;
        }
      }
      else{
        S.pos.x += 2*centerBorderDistance ;
        nbHexaToDraw += 1 ;
        nbSideDrawn = 0 ;
      }
    }
}

void keyPressed(){
    println("Saving . . . ") ;
    String time = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second() ;
    save("z"+time+".png") ;
    println("Saved") ;
}
