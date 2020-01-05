float centerToCenterDistance = 71 ; // in pixels
float centerVertexDistance = centerToCenterDistance/sqrt(3) ;
float sideLength = centerToCenterDistance/sqrt(3) ;

int desiredSizeOfCanvas = 800 ;
int nbHexaX = desiredSizeOfCanvas / int(2*centerVertexDistance) ;
int actualSizeOfCanvasX = nbHexaX * int(2*centerVertexDistance) ;
int nbHexaY = desiredSizeOfCanvas / int(centerToCenterDistance) ;
int actualSizeOfCanvasY = nbHexaY * int(centerToCenterDistance) ;

int NB_OF_ANTS = 5 ;
ArrayList<Ant> ants ;

color randomColor(){
  return color(int(random(256)),int(random(256)),int(random(256))) ;
}

PGraphics pg ;
void settings() {
  size( actualSizeOfCanvasX , actualSizeOfCanvasY ) ;
}

void setup() {
  frameRate(1000000) ;
  pg = createGraphics( actualSizeOfCanvasX + int(centerToCenterDistance) , actualSizeOfCanvasY + int(centerToCenterDistance) ) ;
  pg.beginDraw() ;
  background(0) ;
  pg.background(0) ;

  ants = new ArrayList<Ant>() ;
  for( int k = 0 ; k < NB_OF_ANTS ; ++k ){
    color c = randomColor() ;
    float x = 0 ;
    float y = int(random(nbHexaY/2)) * centerToCenterDistance ;
    ants.add( new Ant( x , y , c ) ) ;
  }
}

void draw(){
  for( Ant ant : ants ){
    ant.move() ;
  }
}

void keyPressed(){
  if( key == 's' ){
    println("Saving . . . " ) ;
    String time = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second() ;
    save("zz"+time+".png") ;
    println("Saved !") ;
  } ;
  if( key == 'r' ){
    background(0) ;
    pg.background(0) ;
    ants = new ArrayList<Ant>() ;
    for( int k = 0 ; k < NB_OF_ANTS ; ++k ){
      color c = randomColor() ;
      float x = 0 ;
      float y = int(random(nbHexaY/2)) * centerToCenterDistance ;
      ants.add( new Ant( x , y , c ) ) ;
    }
  }
}
