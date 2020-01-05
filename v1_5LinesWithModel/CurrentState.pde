public class CurrentState {
 
  int x , y ;
  color colour ;
  int length_of_the_serie = 0 ;
  
  CurrentState( int x_pos , int y_pos ) {
    x = x_pos ;
    y = y_pos ;
    colour = COLOURS[ int(random(COLOURS.length)) ] ;
  };
  
  void DrawASquare(){
     fill( colour ) ;
     rect( x , y , SIZE_OF_A_SQUARE , SIZE_OF_A_SQUARE ) ;
     
     if ( random(1) < PROBABILITY_OF_CHANGING_COLOUR(length_of_the_serie) ) {
       colour = COLOURS[ int(random(COLOURS.length)) ] ;
       length_of_the_serie = 0 ;
     }
     else {
      length_of_the_serie += 1 ;
     } ;  
  };
  
  void DrawARandomSquare(){
    fill( COLOURS[ int(random(COLOURS.length)) ]  ) ;
    rect( x , y , SIZE_OF_A_SQUARE , SIZE_OF_A_SQUARE ) ;
  };
  
}
