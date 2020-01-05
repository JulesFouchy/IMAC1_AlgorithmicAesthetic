class Ant{
  PVector pos ;
  float dirAngle = int(random(4))*TAU/4 ;
  color colour ;
  float probaChangingDir = 0.3 ;
  
  void paint(){
    noStroke() ;
    pg.noStroke() ;
    fill( colour ) ;
    pg.fill( colour ) ;
    rectMode(CENTER) ;
    pg.rectMode(CENTER) ;
    rect( pos.x , pos.y , SIZE_OF_A_SQUARE , SIZE_OF_A_SQUARE ) ;
    pg.rect( pos.x , pos.y , SIZE_OF_A_SQUARE , SIZE_OF_A_SQUARE ) ;
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
  
  Ant( float x , float y , color c ){
    pos = new PVector( x , y ) ;
    colour =  c ;
  }
}

float modulo( float x , float m ){
  float res = x%m ;
  if( res<0 ){
    return res + m ;
  }
  else return res ;
}
