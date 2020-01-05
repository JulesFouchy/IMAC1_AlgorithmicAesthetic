float centerBorderDistance = 20 ; // in pixels
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
  float x , y ;
  int colour ;
  float[][] markov ;
  float xDir = centerBorderDistance ;
  float yDir = - sideLength/2 - centerVertexDistance ;
  
  CurrentState( float x , float y ) {
    this.x = x ;
    this.y = y ;
    this.colour = floor( random( COLOURS.length ) ) ;
    this.markov = randomMarkov( nbColours , 0.65 ) ;
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
     stroke(0) ;
     fill(COLOURS[colour]) ;
     // Draw the hexagon
     translate( x , y ) ;
     hexagon() ;
     translate( -x , -y ) ;
  };
  
  void hexagon(){
    beginShape() ;
    for( float angle = TAU/12 ; angle <= TAU/12 + TAU+EPSILON ; angle += TAU/6 ){
      vertex( centerVertexDistance*cos(angle) , centerVertexDistance*sin(angle) ) ;
    }
    endShape() ;
    stroke( 0 ) ;
    for( float angle = TAU/4 ; angle < TAU/4 + TAU-EPSILON ; angle += TAU/3 ){
      line( 0 , 0 , centerVertexDistance*cos(angle) , centerVertexDistance*sin(angle) ) ;
    }
  }
  
  void rotateQuarter(){
    float tmp = xDir ;
    xDir = - yDir ;
    yDir = tmp ;
  }  
}
