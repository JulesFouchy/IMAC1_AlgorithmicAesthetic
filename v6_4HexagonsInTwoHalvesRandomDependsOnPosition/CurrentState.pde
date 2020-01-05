float centerBorderDistance = 30 ; // in pixels
float halfStarBranchLength = 2 ;
float centerVertexDistance = centerBorderDistance *2/sqrt(3) ;
float sideLength = centerBorderDistance *2/sqrt(3) ;

color orange = color(255,138,28) ;
color blue_comp = color(28,143,255) ;
color pink = color(237,43,192) ;
color blue_compPink = color(43,64,237) ;
color purple = color(136,43,237) ;
color blue_compPurple = color(43,209,237) ;
color roseFushia = color(237,43,101) ;
color bleuDeau = color(43,237,177) ;
color yellow = #FAF321 ;
color bleu_fonce = #070CF0 ;
color[] HUES = {orange,blue_comp,pink,blue_compPink,purple,blue_compPurple,roseFushia,bleuDeau} ;
//color[] HUES = {orange,blue_comp,yellow,bleu_fonce} ;
class CurrentState {
  PVector pos = new PVector() ;
  int colour ;
  PVector dir = new PVector(2*centerBorderDistance , 0) ;
  
  CurrentState( float x , float y ) {
    pos.x = x ;
    pos.y = y ;
    this.colour = 3 ;
  };
  
  void DrawAHexagon2(){
     // Pick a color
     colour = modulo( int( map( (float) Math.atan2( pos.y - height/2 , pos.x-width/2 ) , -PI , PI , 0 , HUES.length/2 ) + 0.75*randomGaussian() ) , HUES.length/2 )  ;
     // Draw the hexagon
     translate( pos.x , pos.y ) ;
     int rotation = int(random(6)) ;
     rotate( rotation * TAU/3 ) ;
     halfHexagonRight(centerVertexDistance , HUES[2*colour]) ;
     halfHexagonLeft(centerVertexDistance , HUES[2*colour+1]) ;
     rotate( -rotation * TAU/3 ) ;
     translate( -pos.x , -pos.y ) ;
  };
  
    void halfHexagonRight( float r , color c ){
      stroke(c) ;
      fill(c) ;
      beginShape() ;
      for( float angle = -TAU/4 ; angle <= TAU/4 +EPSILON ; angle += TAU/6 ){
        vertex( r*cos(angle) , r*sin(angle) ) ;
      }
      endShape() ;
  }
  
  void halfHexagonLeft( float r , color c ){
      stroke(c) ;
      fill(c) ;
      beginShape() ;
      for( float angle = TAU/4 ; angle <= 3*TAU/4 +EPSILON ; angle += TAU/6 ){
        vertex( r*cos(angle) , r*sin(angle) ) ;
      }
      endShape() ;
    }
}

int modulo( int a , int b ){
  int mod = a%b ;
  if( mod < 0 )
    return mod + b ;
  else
    return mod ;
}
