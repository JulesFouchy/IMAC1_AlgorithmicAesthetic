float minProbaColorStaysTheSame = 0.55 ;
float maxProbaColorStaysTheSame = 0.95 ;

float centerBorderDistance = 48 ; // in pixels
float halfStarBranchLength = 48 ;
float centerVertexDistance = centerBorderDistance *2/sqrt(3) ;
float sideLength = centerBorderDistance *2/sqrt(3) ;

color white = color(255,255,255) ; 
color lightGreen = color(161,237,156) ;
color darkGreen = color(33,111,28) ;
color orange = color( 250 , 186 , 45 ) ;
color pink = color( 206 , 156 , 195 ) ;
//float[] HUES = { 164,164,212 , 212} ;
float[] HUES = { 290 , 25 , 4 , 164 , 58 , 89 , 212 }; // violet orange rouge bleuCiel yellow green bleuFoncé
class CurrentState {
  PVector pos = new PVector() ;
  int hue ;
  float[][] markov ;
  PVector dir = new PVector(2*centerBorderDistance , 0) ;
  
  CurrentState( float x , float y ) {
    pos.x = x ;
    pos.y = y ;
    this.hue = int(random(HUES.length)) ;
    //this.hue = floor( random( HUES.length ) ) ;
    this.markov = randomMarkov( HUES.length , random(minProbaColorStaysTheSame,maxProbaColorStaysTheSame) ) ;
    colorMode( HSB , 360 , 100 , 100 ,100 ) ;
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
     int rotation = int(random(6)) ;
     rotate( rotation * TAU/6 ) ;
     for( int k = 0 ; k < 1 ; ++k){
       halfHexagonRight(centerVertexDistance-k , HUES[hue] , 100-2*k , 100 + 4*k) ;
       halfHexagonLeft(centerVertexDistance-k , ( HUES[hue]+180 ) % 360 , 100-2*k , 100 + 4*k) ;
     }
     rotate( -rotation * TAU/3 ) ;
     translate( -pos.x , -pos.y ) ;
  };
  
    void halfHexagonRight( float r , float Hue ,float S , float B){
    strokeWeight(2) ;
    stroke( Hue, S , B , 100 ) ;
    fill( Hue , S , B , 100) ;
    beginShape() ;
    for( float angle = -TAU/4 ; angle <= TAU/4 +EPSILON ; angle += TAU/6 ){
      vertex( r*cos(angle) , r*sin(angle) ) ;
    }
    endShape() ;
  }
  
  void halfHexagonLeft( float r , float Hue ,float S , float B){
    strokeWeight(2) ;
    stroke( Hue, S , B ) ;
    fill( Hue , S , B , 100) ;
    beginShape() ;
    for( float angle = TAU/4 ; angle <= 3*TAU/4 +EPSILON ; angle += TAU/6 ){
      vertex( r*cos(angle) , r*sin(angle) ) ;
    }
    endShape() ;
  }
  
  void hexagon( float r , float Hue ,float S , float B){
    stroke( Hue, S , B ) ;
    fill( Hue , S , B , 100) ;
    beginShape() ;
    for( float angle = TAU/12 ; angle <= TAU/12 + TAU+EPSILON ; angle += TAU/6 ){
      vertex( r*cos(angle) , r*sin(angle) ) ;
    }
    endShape() ;
  }
}
