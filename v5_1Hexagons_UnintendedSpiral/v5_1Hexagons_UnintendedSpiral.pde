int nbHexaToDraw ;
CurrentState S ;

void setup() {
    size( 800 , 800 ) ;
    background(0) ;
   
    noStroke() ;
    frameRate(30) ;
    
    nbHexaToDraw = 1 ;
    S = new CurrentState(width/2,height/2) ;
}

void draw(){
  for( int _ = 0 ; _ < 2 ; ++_ ){
         for( int k = 0 ; k < nbHexaToDraw ; ++k ) {
               S.DrawAHexagon() ;     
               S.x += S.xDir ;
               S.y += S.yDir ;
          }
          S.rotateQuarter() ;
       }
       nbHexaToDraw += 1 ;
}

void keyPressed(){
    println("Saving . . . ") ;
    String time = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second() ;
    save("z"+time+".png") ;
    println("Saved") ;
}
