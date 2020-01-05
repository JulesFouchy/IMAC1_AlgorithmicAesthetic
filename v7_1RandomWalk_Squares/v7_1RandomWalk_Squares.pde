int SIZE_OF_A_SQUARE = 40  ; // in pixels
int widthCanvas = 1600 ;
int heightCanvas = 800 ;

int actualWidth = widthCanvas/SIZE_OF_A_SQUARE*SIZE_OF_A_SQUARE ;
int actualHeight = heightCanvas/SIZE_OF_A_SQUARE*SIZE_OF_A_SQUARE ;

int NB_OF_ANTS = 15 ;
ArrayList<Ant> ants ;

color randomColor(){
  return color(int(random(256)),int(random(256)),int(random(256))) ;
}

PGraphics pg ;
void settings() {
  size( actualWidth , actualHeight ) ;
}

void setup() {
  frameRate(1000) ;
  pg = createGraphics( actualWidth , actualHeight ) ;
  pg.beginDraw() ;
  background(0) ;
  pg.background(0) ;

  ants = new ArrayList<Ant>() ;
  for( int k = 0 ; k < NB_OF_ANTS ; ++k ){
    color c = randomColor() ;
    ants.add( new Ant( int(random(widthCanvas/SIZE_OF_A_SQUARE))*SIZE_OF_A_SQUARE+SIZE_OF_A_SQUARE/2 , int(random(widthCanvas/SIZE_OF_A_SQUARE))*SIZE_OF_A_SQUARE+SIZE_OF_A_SQUARE/2 , c ) ) ;
  }
}

void draw(){
  for( Ant ant : ants ){
    ant.move() ;
  }
}

void keyPressed(){
  if( key == 's' ){
    println("Saving . . . ") ;
    String time = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second() ;
    save("z"+time+".png") ;
    println("Saved") ;
  } ;
  if( key == 'r' ){
    background(0) ;
    pg.background(0) ;
  }
  if( key == 'c' ){
    background(0) ;
    pg.background(0) ;
    for( Ant ant : ants ){
      ant.colour = randomColor() ;
    }
  }
}
