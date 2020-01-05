// v4 : now U can C the drawing

int N = 7 ; // order of the Hilbert Curve
int SIZE_OF_A_SQUARE = 6 ; // in pixels
int SIZE_OF_MATRIX = int(pow(2,N)) ; // in squares

int[][] COLOURS = { {225,58,255} ,{225,58,255} ,  {255,129,33} ,{255,129,33} , {255,36,20} ,{255,36,20} , {255,255,255},{255,255,255},{255,255,255} }; // violet orange rouge blanc

float PROBABILITY_OF_CHANGING_COLOUR(int length_of_the_serie) {
  return length_of_the_serie * 0.01 ;
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

void setup(){
  frameRate(1000) ;
  background(0) ;
}
CurrentState S = new CurrentState(0,0) ;
String code = hilbertCode( N ) ;
int k = 0 ;
boolean bool = true ;
void draw(){
  noStroke() ;
  translate( 0 , height - SIZE_OF_A_SQUARE ) ;
  if( k < code.length() ){
      if(bool){
        S.DrawASquare() ;
      }
      else{
        S.DrawABlackSquare() ;
      }
      if( code.charAt(k) == 'u' ){ S.y -= SIZE_OF_A_SQUARE ;} ;
      if( code.charAt(k) == 'r' ){ S.x += SIZE_OF_A_SQUARE ;} ;
      if( code.charAt(k) == 'd' ){ S.y += SIZE_OF_A_SQUARE ;} ;
      if( code.charAt(k) == 'l' ){ S.x -= SIZE_OF_A_SQUARE ;} ;
      k += 1 ;
  }
  else{ if( k == code.length() ){
     if(bool){
        S.DrawASquare() ;
        bool = false ;
      }
      else{
        S.DrawABlackSquare() ;
        bool = true ;
      }
     k=0 ;
     S.x=0 ;
     S.y=0 ;
   } ;
   } 
}
