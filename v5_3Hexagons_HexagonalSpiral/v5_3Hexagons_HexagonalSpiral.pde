CurrentState S ;

void setup() {
    size( 800 , 800 ) ;
    background(0) ;
   
    noStroke() ;
    frameRate(100000) ;
    S = new CurrentState(width/2,height/2) ;
    S.DrawAHexagon() ;
    S.pos.x += 2*centerBorderDistance ;
    S.dir.rotate( -TAU/4-TAU/12 ) ;    
}

int nbHexaToDraw = 1 ;
int nbHexaDrawn = 0 ;
int nbSideDrawn = 0 ;
void draw(){
  if( nbSideDrawn < 6 ){
    if( nbHexaDrawn < nbHexaToDraw ){
      S.pos.add( S.dir ) ;
      S.DrawAHexagon() ;
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

void keyPressed(){
    println("Saving . . . ") ;
    String time = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second() ;
    save("z"+time+".png") ;
    println("Saved") ;
}
