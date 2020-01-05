final int OUTWARDS = 0 ;
final int CLOCKWISE = 1 ;
final int INWARDS = 2 ;
final int ANTICLOCKWISE = 3 ;

class Ant{
  // Coordinates of the bottome left corner
  int rCount ;
  int thetaCount ;
  int direction ;
  color colour ;
    
  float dAgl(float r){
    return TAU/30/r ;
  }
  void paint(){
    float r = rCount*crownLength ;
    float theta = thetaCount*angleLengthOfASection ;
    PShape s = createShape() ;
    s.beginShape() ;
    s.stroke( colour ) ;
    s.fill( colour ) ;
    for( float agl = theta ; agl < theta + TAU/NB_OF_ANGULAR_SECTIONS ; agl += dAgl(r) ){
      s.vertex( width*2/3+r*cos(agl) , height/2+r*sin(agl) ) ;
    }
    for( float agl = theta + TAU/NB_OF_ANGULAR_SECTIONS ; agl > theta ; agl -= dAgl(r+crownLength) ){
      s.vertex( width*2/3+(r+crownLength)*cos(agl) , height/2+(r+crownLength)*sin(agl) ) ;
    }
    s.endShape() ;
    shape(s,0,0) ;
  }
  
  void move(){
    switch( direction ){
      case OUTWARDS :
        rCount = (rCount+1)%NB_OF_CROWNS ;
        break ;
      case INWARDS :
        rCount -= 1 ;
        if( rCount <= 0 ){
          rCount = 0 ;
          direction = OUTWARDS ;
        }
        break ;
      case CLOCKWISE :
        thetaCount += 1 ;
        break ;
      case ANTICLOCKWISE :
        thetaCount -= 1 ;
        break ;
    }
    
    paint() ;
    
    if( random(1) < PROBA_OF_CHANGING_DIRECTION ){
      direction = modulo( (direction + int(random(2))*2-1) , 4 )  ;
    }
  }
  
  Ant(){
    rCount = 0 ;
    thetaCount = int(random(NB_OF_ANGULAR_SECTIONS)) ;
    colour =  randomColor() ;
    direction = OUTWARDS ;
  }
}

int modulo( int x , int m ){
  int res = x%m ;
  if( res<0 ){
    return res + m ;
  }
  else return res ;
}
