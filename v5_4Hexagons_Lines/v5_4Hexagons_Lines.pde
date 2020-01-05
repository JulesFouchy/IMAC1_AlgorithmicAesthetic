CurrentState S ;

float initialLineX ;
float initialLineY ;

void setup() {
    size( 800 , 800 ) ;
    background(0) ;
    initialLineX = -centerVertexDistance ;
    initialLineY = -centerVertexDistance ;
    S = new CurrentState(initialLineX,initialLineY) ;    
}

int dirX = 1 ;

void draw(){
   S.DrawAHexagon() ;     
   S.x += centerBorderDistance * dirX ;
   S.y += centerVertexDistance + sideLength/2 ;
   dirX *= -1 ;
   
   if( S.y > height + centerVertexDistance ){
     dirX = 1 ;
     initialLineX += 2*centerBorderDistance ;
     S.x = initialLineX ;
     S.y = initialLineY ;
   }
}

void keyPressed(){
    println("Saving . . . ") ;
    String time = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second() ;
    save("z"+time+".png") ;
    println("Saved") ;
}
