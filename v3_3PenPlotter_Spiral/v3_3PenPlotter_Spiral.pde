int SIZE_OF_A_SQUARE = 10 ; // in pixels
int SIZE_OF_MATRIX = 80 ; // in squares
int[][] COLOURS = { {225,58,255} ,{225,58,255} ,  {255,129,33} ,{255,129,33} , {255,36,20} ,{255,36,20} , {255,255,255},{255,255,255},{255,255,255} }; // violet orange rouge blanc

float PROBABILITY_OF_CHANGING_COLOUR(int length_of_the_serie) {
  return length_of_the_serie * 0.05 ;
}

int size_of_canvas = SIZE_OF_A_SQUARE * SIZE_OF_MATRIX ;
void settings() {
  size( size_of_canvas , size_of_canvas ) ;
}

void setup() {
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
        
        while (S.x > x_min) {
             S.DrawASquare() ; 
             S.x -= SIZE_OF_A_SQUARE ;
        } ;
        x_min += SIZE_OF_A_SQUARE ;
        S.x += SIZE_OF_A_SQUARE ;
    }
}

void draw(){}

void keyPressed(){
    println("Saving . . . ") ;
    String time = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second() ;
    save("z"+time+".png") ;
    println("Saved") ;
}
