int SIZE_OF_A_SQUARE = 10 ; // in pixels
int SIZE_OF_MATRIX = 80 ; // in squares
int size_of_canvas = SIZE_OF_A_SQUARE * SIZE_OF_MATRIX ;

color white = color(255,255,255) ; 
color lightGreen = color(161,237,156) ;
color darkGreen = color(33,111,28) ;
color orange = color( 250 , 186 , 45 ) ;
color pink = color( 206 , 156 , 195 ) ;

float probaKeepingTheSameColour = 0.75 ;

color[] COLOURS = { color(225,58,255) , color(255,129,33) , color(255,36,20) , color(255,255,255) }; // violet orange rouge blanc
int nbColours = 4 ;

public class CurrentState {
  int x , y ;
  int colour ;
  float[][] markov ;
  
  CurrentState( int x , int y ) {
    this.x = x ;
    this.y = y ;
    this.colour = floor( random( COLOURS.length ) ) ;
    this.markov = randomMarkov( nbColours , probaKeepingTheSameColour ) ;
  };
  
  void DrawASquare(){     
     float rand = random(1) ;
     int nextColour = 0 ;
     float cumulProb = markov[colour][nextColour] ;
     while( rand > cumulProb ){
       ++nextColour ;
       cumulProb += markov[colour][nextColour] ;
     }
     colour = nextColour ;
     fill( COLOURS[colour] ) ;
     rect( x , y , SIZE_OF_A_SQUARE , SIZE_OF_A_SQUARE ) ;
  };
}
