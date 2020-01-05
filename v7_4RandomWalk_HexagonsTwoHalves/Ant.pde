class Ant{
  PVector pos ;
  float dirAngle = int(random(6))*TAU/6 + TAU/12 ;
  color colour1 ;
  color colour2 ;
  float probaChangingDir = 0.3 ;
  
  void paint(){
    pg.fill(255) ;
    pg.beginShape() ;
    for( float angle = 0 ; angle <= TAU+EPSILON ; angle += TAU/6 ){
      pg.vertex( pos.x + centerVertexDistance*cos(angle) , pos.y + centerVertexDistance*sin(angle) ) ;
    }
    pg.endShape() ;
    
    float startAngle = int(random(6))*TAU/6 ;
    stroke( colour1 ) ;
    fill( colour1 ) ;
    beginShape() ;
    for( float angle = startAngle ; angle <= startAngle+TAU/2+EPSILON ; angle += TAU/6 ){
      vertex( pos.x + centerVertexDistance*cos(angle) , pos.y + centerVertexDistance*sin(angle) ) ;
    }
    endShape() ;
    stroke( colour2 ) ;
    fill( colour2 ) ;
    beginShape() ;
    for( float angle = startAngle+TAU/2 ; angle <= startAngle+TAU+EPSILON ; angle += TAU/6 ){
      vertex( pos.x + centerVertexDistance*cos(angle) , pos.y + centerVertexDistance*sin(angle) ) ;
    }
    endShape() ;
    
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
  
  Ant( float x , float y , color c1 , color c2 ){
    pos = new PVector( x , y ) ;
    colour1 =  c1 ;
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
