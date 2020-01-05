import controlP5.* ;
ControlP5 cp5;

boolean timeIsRunning = true ;

int radius = 400 ;
int NB_OF_CROWNS = 40 ;
int NB_OF_ANGULAR_SECTIONS = 50 ;
int NB_OF_ANTS = 20 ;
float PROBA_OF_CHANGING_DIRECTION = 0.1 ;
int FRAME_RATE = 60 ;

float minHue = 0 ;
float maxHue = 360 ;
float minSaturation = 0 ;
float maxSaturation = 100 ;
float minBrightness = 30 ;
float maxBrightness = 100 ;

Range hueRange ;
Range saturationRange ;
Range brightnessRange ; 

float crownLength ;
float angleLengthOfASection ;
ArrayList<Ant> ants ;

color randomColor(){
  colorMode( HSB , 360 , 100 , 100 ) ;
  return color(int(random(minHue,maxHue)),int(random(minSaturation,maxSaturation)),int(random(minBrightness,maxBrightness))) ;
}

void settings() {
  size( 1600 , 2*radius+50 ) ;
}

void setup() {
  updateVariables() ;
  resetScreen() ;
  createSliders() ;
}

void draw(){
  if( timeIsRunning ){
    for( Ant ant : ants ){
      ant.move() ;
    }
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
    resetAntsPosition() ;
    resetScreen() ;
    timeIsRunning = true ;
  }
  if( key == 'c' ){
    updateVariables() ;
    resetScreen() ;
    timeIsRunning = true ;
  }
  if( key == ' ' ){
    timeIsRunning = !timeIsRunning ;
  }
}
