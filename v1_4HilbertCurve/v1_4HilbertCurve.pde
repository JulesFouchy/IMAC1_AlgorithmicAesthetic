int N = 7 ; // order of the Hilbert Curve
int SIZE_OF_A_SQUARE = 6 ; // in pixels
int SIZE_OF_MATRIX = int(pow(2,N)) ; // in squares

color[] COLOURS = { color(225,58,255) ,color(225,58,255) ,  color(255,129,33) , color(255,129,33) , color(255,36,20) ,color(255,36,20) , color(255,255,255) , color(255,255,255) , color(255,255,255) }; // violet orange rouge blanc

float PROBABILITY_OF_CHANGING_COLOUR(int length_of_the_serie) {
  return length_of_the_serie * 0.001 ;
}

String rotationGauche( String code ){
  String res = "" ;
  for( int k = code.length() - 1 ; k >= 0 ; k-- ){
    if( code.charAt(k) == 'u' ){ res += 'r' ;} ;
    if( code.charAt(k) == 'r' ){ res += 'd' ;} ;
    if( code.charAt(k) == 'd' ){ res += 'l' ;} ;
    if( code.charAt(k) == 'l' ){ res += 'u' ;} ;
  } ;
  return res ;
}
String rotationDroite( String code ){
  String res = "" ;
  for( int k = code.length() - 1 ; k >= 0 ; k-- ){
    if( code.charAt(k) == 'u' ){ res += 'l' ;} ;
    if( code.charAt(k) == 'r' ){ res += 'u' ;} ;
    if( code.charAt(k) == 'd' ){ res += 'r' ;} ;
    if( code.charAt(k) == 'l' ){ res += 'd' ;} ;
  } ;
  return res ;
}

String hilbertCode( int N ){
  if( N == 1 ) {
    return "urd" ;
  }
  else{
    String code = hilbertCode(N-1) ;
    return rotationDroite(code) + "u" + code + "r" + code + "d" + rotationGauche(code) ;
  }
}

int size_of_canvas = SIZE_OF_A_SQUARE * SIZE_OF_MATRIX ;
void settings() {
  size( size_of_canvas , size_of_canvas ) ;
}

void setup() {
    noStroke() ;
    translate( 0 , height - SIZE_OF_A_SQUARE ) ;
    CurrentState S = new CurrentState(0,0) ;
    String code = hilbertCode( N ) ;
    
    for( int k = 0 ; k < code.length() ; k++ ){
      S.DrawASquare() ;
      if( code.charAt(k) == 'u' ){ S.y -= SIZE_OF_A_SQUARE ;} ;
      if( code.charAt(k) == 'r' ){ S.x += SIZE_OF_A_SQUARE ;} ;
      if( code.charAt(k) == 'd' ){ S.y += SIZE_OF_A_SQUARE ;} ;
      if( code.charAt(k) == 'l' ){ S.x -= SIZE_OF_A_SQUARE ;} ;
    } ;
    S.DrawASquare() ;
}

void draw(){}

void keyPressed(){
    println("Saving . . . ") ;
    String time = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second() ;
    save("z"+time+".png") ;
    println("Saved") ;
}
