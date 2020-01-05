int SIZE_OF_A_SQUARE = 10 ; // in pixels
int SIZE_OF_MATRIX = 80 ; // in squares
int[][] COLOURS = { {225,58,255} ,{225,58,255} ,  {255,129,33} ,{255,129,33} , {255,36,20} ,{255,36,20} , {255,255,255},{255,255,255},{255,255,255} }; // violet orange rouge blanc

float PROBABILITY_OF_CHANGING_COLOUR(int length_of_the_serie) {
  return length_of_the_serie * 0.1 ;
}

int size_of_canvas = SIZE_OF_A_SQUARE * SIZE_OF_MATRIX ;
void settings() {
  size( size_of_canvas , size_of_canvas ) ;
}

void setup() {
    noStroke() ;
    for( int y_pos = 0 ; y_pos < size_of_canvas ; y_pos += SIZE_OF_A_SQUARE ) {
        CurrentState S = new CurrentState(0,y_pos) ;
        while( S.x < size_of_canvas ) {
            S.DrawASquare() ;
            S.x += SIZE_OF_A_SQUARE ; 
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
