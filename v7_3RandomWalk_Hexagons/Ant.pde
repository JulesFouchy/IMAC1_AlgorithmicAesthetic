class Ant{
  PVector pos ;
  float dirAngle = int(random(6))*TAU/6 + TAU/12 ;
  color colour ;
  float probaChangingDir = 0.3 ;
  
  void paint(){
    stroke( colour ) ;
    pg.stroke( colour ) ;
    fill( colour ) ;
    pg.fill( colour ) ;
    
    beginShape() ;
    for( float angle = 0 ; angle <= TAU+EPSILON ; angle += TAU/6 ){
      vertex( pos.x + centerVertexDistance*cos(angle) , pos.y + centerVertexDistance*sin(angle) ) ;
    }
    endShape() ;
    pg.beginShape() ;
    for( float angle = 0 ; angle <= TAU+EPSILON ; angle += TAU/6 ){
      pg.vertex( pos.x + centerVertexDistance*cos(angle) , pos.y + centerVertexDistance*sin(angle) ) ;
    }
    pg.endShape() ;
  }
  
  void move(){
    pos.x += centerToCenterDistance*cos(dirAngle) ;
    pos.y += centerToCenterDistance*sin(dirAngle) ;
    if( pos.x > width+2*centerToCenterDistance || pos.y > height || pos.x <0 || pos.y < 0 ){
      dirAngle = -dirAngle ;
      pos.x += centerToCenterDistance*cos(dirAngle) ;
      pos.y += centerToCenterDistance*sin(dirAngle) ;
    }
    
    int BLACK = -16777216 ;
    if( pg.get(int(pos.x),int(pos.y)) == BLACK ){
      paint() ;
    }
    
    if ( random(1) < probaChangingDir ){
      dirAngle = ( dirAngle + TAU/6*(int(random(2))*2-1) )% TAU ;
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
