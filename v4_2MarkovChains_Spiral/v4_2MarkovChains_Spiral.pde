void settings() {
  size( size_of_canvas , size_of_canvas ) ;
}

void setup() {
    background(255) ;
    noStroke() ;
    int x_min = 0 ;
    int x_max = size_of_canvas ;
    int y_min = 0 ;
    int y_max = size_of_canvas ;
        
    CurrentState S = new CurrentState(0,0) ;
        
    while (x_min < x_max && y_min < y_max) {
      
        while (S.y < y_max - SIZE_OF_A_SQUARE) {
             S.DrawASquare() ;     
             S.y += SIZE_OF_A_SQUARE ;
        } ;
        y_max -= SIZE_OF_A_SQUARE ;
        
        while (S.x < x_max - SIZE_OF_A_SQUARE) {
             S.DrawASquare() ; 
             S.x += SIZE_OF_A_SQUARE ;
        } ;
        x_max -= SIZE_OF_A_SQUARE ;
        
        while (S.y > y_min) {
             S.DrawASquare() ; 
             S.y -= SIZE_OF_A_SQUARE ;
        } ;
        y_min += SIZE_OF_A_SQUARE ;
        
        while (S.x > x_min + SIZE_OF_A_SQUARE) {
             S.DrawASquare() ; 
             S.x -= SIZE_OF_A_SQUARE ;
        } ;
        x_min += SIZE_OF_A_SQUARE ;
    }
    S.DrawASquare() ;
}

void draw(){}

void keyPressed(){
    println("Saving . . . ") ;
    String time = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second() ;
    save("z"+time+".png") ;
    println("Saved") ;
}
