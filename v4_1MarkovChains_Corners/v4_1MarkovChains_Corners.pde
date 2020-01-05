void settings() {
  size( size_of_canvas , size_of_canvas ) ;
}

void setup() {
    noStroke() ;
    for( int dist = 0 ; dist < size_of_canvas ; dist += SIZE_OF_A_SQUARE ) {
        CurrentState S = new CurrentState(0,dist) ;
        while( S.x < dist ) {
            S.DrawASquare() ;
            S.x += SIZE_OF_A_SQUARE ; 
        } ;
        while( S.y >= 0 ) {
            S.DrawASquare() ;
            S.y -= SIZE_OF_A_SQUARE ; 
        }
    }
}

void draw(){}

void keyPressed(){
    println("Saving . . . ") ;
    String time = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second() ;
    save("z"+time+".png") ;
    println("Saved") ;
}