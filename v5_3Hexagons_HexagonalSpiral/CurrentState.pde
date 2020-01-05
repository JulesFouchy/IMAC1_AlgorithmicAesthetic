float centerBorderDistance = 17 ; // in pixels
float centerVertexDistance = centerBorderDistance *2/sqrt(3) ;
float sideLength = centerBorderDistance *2/sqrt(3) ;

color white = color(255,255,255) ; 
color lightGreen = color(161,237,156) ;
color darkGreen = color(33,111,28) ;
color orange = color( 250 , 186 , 45 ) ;
color pink = color( 206 , 156 , 195 ) ;
color[] COLOURS = { color(225,58,255) , color(255,129,33) , color(255,36,20) , color(255,255,255) }; // violet orange rouge blanc
int nbColours = 4 ;

class CurrentState {
  PVector pos = new PVector() ;
  int colour ;
  float[][] markov ;
  PVector dir = new PVector(2*centerBorderDistance , 0) ;
  
  CurrentState( float x , float y ) {
    pos.x = x ;
    pos.y = y ;
    this.colour = floor( random( COLOURS.length ) ) ;
    this.markov = randomMarkov( nbColours , 0.8 ) ;
  };
  
  void DrawAHexagon(){
     // Pick a color
     float rand = random(1) ;
     int nextColour = 0 ;
     float cumulProb = markov[colour][0] ;
     while( rand > cumulProb ){
       ++nextColour ;
       cumulProb += markov[colour][nextColour] ;
     }
     colour = nextColour ;
     stroke(COLOURS[colour] ) ;
     fill(COLOURS[colour]) ;
     // Draw the hexagon
     translate( pos.x , pos.y ) ;
     hexagon() ;
     translate( -pos.x , -pos.y ) ;
  };
  
  void hexagon(){
    beginShape() ;
    for( float angle = TAU/12 ; angle <= TAU/12 + TAU+EPSILON ; angle += TAU/6 ){
      vertex( centerVertexDistance*cos(angle)*1.01 , centerVertexDistance*sin(angle)*1.01 ) ;
    }
    endShape() ;
  }
}
