float centerBorderDistance = 20 ; // in pixels
float halfStarBranchLength = 8 ;
float centerVertexDistance = centerBorderDistance *2/sqrt(3) ;
float sideLength = centerBorderDistance *2/sqrt(3) ;

color white = color(255,255,255) ; 
color lightGreen = color(161,237,156) ;
color darkGreen = color(33,111,28) ;
color orange = color( 250 , 186 , 45 ) ;
color pink = color( 206 , 156 , 195 ) ;
float[] HUES = { 290 , 25 , 4 , 164 , 58 }; // violet orange rouge bleuCiel yellow
class CurrentState {
  PVector pos = new PVector() ;
  int hue ;
  float[][] markov ;
  PVector dir = new PVector(2*centerBorderDistance , 0) ;
  
  CurrentState( float x , float y ) {
    pos.x = x ;
    pos.y = y ;
    this.hue = floor( random( HUES.length ) ) ;
    this.markov = randomMarkov( HUES.length , 0.65 ) ;
    colorMode( HSB , 360 , 100 , 100 ) ;
  };
  
  void DrawAHexagon2(){
     // Pick a color
     float rand = random(1) ;
     int nextHue = 0 ;
     float cumulProb = markov[hue][0] ;
     while( rand > cumulProb ){
       ++nextHue ;
       cumulProb += markov[hue][nextHue] ;
     }
     hue = nextHue ;
     // Draw the hexagon
     translate( pos.x , pos.y ) ;
     hexagon(HUES[hue]) ;
     translate( -pos.x , -pos.y ) ;
  };
  
  void hexagon( float Hue ){
    stroke( Hue, 100,100) ;
    fill( Hue , 100 , 100 ) ;
    beginShape() ;
    for( float angle = TAU/12 ; angle <= TAU/12 + TAU+EPSILON ; angle += TAU/6 ){
      vertex( centerVertexDistance*cos(angle)*1.01 , centerVertexDistance*sin(angle)*1.01 ) ;
    }
    endShape() ;
    stroke( Hue, 100,80) ;
    fill( Hue , 100 , 80 ) ;
    for( int _ = 0 ; _ < 3 ; ++_ ){
      beginShape() ;
      vertex(-halfStarBranchLength , -(centerVertexDistance-halfStarBranchLength/sqrt(3)) ) ;
      vertex( 0 , -centerVertexDistance ) ;
      vertex(halfStarBranchLength , -(centerVertexDistance-halfStarBranchLength/sqrt(3)) ) ;
      vertex(halfStarBranchLength , (centerVertexDistance-halfStarBranchLength/sqrt(3)) ) ;
      vertex( 0 , -centerVertexDistance ) ;
      vertex(-halfStarBranchLength , (centerVertexDistance-halfStarBranchLength/sqrt(3)) ) ;
      vertex(-halfStarBranchLength , -(centerVertexDistance-halfStarBranchLength/sqrt(3)) ) ;
      endShape() ;
      rotate(TAU/3) ;
    }
  }
}
