int SIZE_OF_A_SQUARE = 10 ; // in pixels
int SIZE_OF_MATRIX = 80 ; // in squares
PImage model ;
float PROBABILITY_OF_CHANGING_COLOUR(int length_of_the_serie) {
  return length_of_the_serie * 0.05 ;
}
color[] COLOURS = { color(225,58,255) ,color(225,58,255) ,  color(255,129,33) , color(255,129,33) , color(255,36,20) ,color(255,36,20) , color(255,255,255) , color(255,255,255) , color(255,255,255) }; // violet orange rouge blanc

int size_of_canvas = SIZE_OF_A_SQUARE * SIZE_OF_MATRIX ;
void settings() {
  size( size_of_canvas , size_of_canvas ) ;
}

void setup() {
    model = loadImage("model.png") ;
    model.loadPixels() ;
    
    noStroke() ;
    for( int y_pos = 0 ; y_pos < size_of_canvas ; y_pos += SIZE_OF_A_SQUARE ) {
        CurrentState S = new CurrentState(0,y_pos) ;
        while( S.x < size_of_canvas ) {
            int x = int(map( S.x , 0 , width , 0 , model.width )) ;
            int y = int(map( S.y , 0 , height , 0 , model.height )) ;
            if( model.pixels[y * model.width + x ] == color(0) ) {
              S.DrawASquare() ;
            }
            else {
              S.DrawARandomSquare() ;
            };
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
