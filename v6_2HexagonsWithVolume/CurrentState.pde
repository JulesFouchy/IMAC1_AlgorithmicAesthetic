float centerBorderDistance = 30 ; // in pixels
float halfStarBranchLength = 2 ;
float centerVertexDistance = centerBorderDistance *2/sqrt(3) ;
float sideLength = centerBorderDistance *2/sqrt(3) ;

color white = color(255,255,255) ; 
color lightGreen = color(161,237,156) ;
color darkGreen = color(33,111,28) ;
color orange = color( 250 , 186 , 45 ) ;
color pink = color( 206 , 156 , 195 ) ;
float[] HUES = { 25 , 4 , 164 , 60 , 212 }; // orange rouge bleuCiel yellow  bleuFoncé
class CurrentState {
  PVector pos = new PVector() ;
  int hue ;
  float[][] markov ;
  PVector dir = new PVector(2*centerBorderDistance , 0) ;
  
  CurrentState( float x , float y ) {
    pos.x = x ;
    pos.y = y ;
    this.hue = 3 ;
    //this.hue = floor( random( HUES.length ) ) ;
    this.markov = randomMarkov( HUES.length , 0.75 ) ;
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
     float r = random( centerVertexDistance/2 , centerVertexDistance ) ;
     float tCenter = random(TAU) ;
     float rCenter = random(0,centerBorderDistance - r/2*sqrt(3)) ;
     translate( pos.x +rCenter*cos(tCenter), pos.y +rCenter*sin(tCenter)) ;
     int rotation = int(random(6)) ;
     rotate( rotation * TAU/6 ) ;
     for( int k = 0 ; k < r ; ++k){
       halfHexagonRight(r-k , HUES[hue] , 100-2*k , 50 + 4*k) ;
       halfHexagonLeft(r-k , (HUES[hue]+0) % 360 , 100-2*k , 50 + 4*k) ;
     }
     rotate( -rotation * TAU/3 ) ;
     translate( -pos.x -rCenter*cos(tCenter), -pos.y -rCenter*sin(tCenter) ) ;
  };
  
    void halfHexagonRight( float r , float Hue ,float S , float B){
    stroke( Hue, S , B ) ;
    fill( Hue , S , B , 100) ;
    beginShape() ;
    for( float angle = -TAU/4 ; angle <= TAU/4 +EPSILON ; angle += TAU/6 ){
      vertex( r*cos(angle)*1.01 , r*sin(angle)*1.01 ) ;
    }
    endShape() ;
  }
  
  void halfHexagonLeft( float r , float Hue ,float S , float B){
    stroke( Hue, S , B ) ;
    fill( Hue , S , B , 100) ;
    beginShape() ;
    for( float angle = TAU/4 ; angle <= 3*TAU/4 +EPSILON ; angle += TAU/6 ){
      vertex( r*cos(angle)*1.01 , r*sin(angle)*1.01 ) ;
    }
    endShape() ;
  }
  
  void hexagon( float r , float Hue ,float S , float B){
    stroke( Hue, S , B ) ;
    fill( Hue , S , B , 100) ;
    beginShape() ;
    for( float angle = TAU/12 ; angle <= TAU/12 + TAU+EPSILON ; angle += TAU/6 ){
      vertex( r*cos(angle)*1.01 , r*sin(angle)*1.01 ) ;
    }
    endShape() ;
  }
}
