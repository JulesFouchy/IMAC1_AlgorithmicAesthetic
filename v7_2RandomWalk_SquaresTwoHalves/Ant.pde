class Ant{
  PVector pos ;
  float dirAngle = int(random(4))*TAU/4 ;
  color colour1 ;
  color colour2 ;
  float probaChangingDir = 0.3 ;
  
  void paint(){
    pushMatrix() ;
    pg.pushMatrix() ;
    translate( pos.x , pos.y ) ;
    pg.translate( pos.x , pos.y ) ;
    float agl = int(random(4))*TAU/4 ;
    rotate( agl ) ;
    pg.rotate( agl ) ;
    stroke( colour2 ) ;
    fill( colour1 ) ;
    pg.fill( colour1 ) ;
    triangle( -SIZE_OF_A_SQUARE/2,-SIZE_OF_A_SQUARE/2 , SIZE_OF_A_SQUARE/2,-SIZE_OF_A_SQUARE/2 , -SIZE_OF_A_SQUARE/2,SIZE_OF_A_SQUARE/2 ) ;
    stroke( colour1 ) ;
    fill( colour2 ) ;
    triangle( SIZE_OF_A_SQUARE/2,-SIZE_OF_A_SQUARE/2 , -SIZE_OF_A_SQUARE/2,SIZE_OF_A_SQUARE/2 , SIZE_OF_A_SQUARE/2,SIZE_OF_A_SQUARE/2 ) ;
    pg.rectMode(CENTER) ;
    pg.rect( 0 , 0 , SIZE_OF_A_SQUARE , SIZE_OF_A_SQUARE ) ;
    popMatrix() ;
    pg.popMatrix() ;
  }
  
  void move(){
    pos.x = modulo( pos.x + SIZE_OF_A_SQUARE*cos(dirAngle) , width ) ;
    pos.y = modulo( pos.y + SIZE_OF_A_SQUARE*sin(dirAngle) , height ) ;
    
    int BLACK = -16777216 ;
    if( pg.get(int(pos.x),int(pos.y)) == BLACK ){
      paint() ;
    }
    
    if ( random(1) < probaChangingDir ){
      dirAngle = ( dirAngle + TAU/4*(int(random(2))*2-1) )% TAU ;
    }
  }
  
  Ant( float x , float y , color c1 , color c2 ){
    pos = new PVector( x , y ) ;
    colour1 = c1 ;
    colour2 = c2 ;
  }
}

float modulo( float x , float m ){
  float res = x%m ;
  if( res<0 ){
    return res + m ;
  }
  else return res ;
}
