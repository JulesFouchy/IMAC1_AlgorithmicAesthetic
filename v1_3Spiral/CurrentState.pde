public class CurrentState {
 
  int x , y ;
  int[] colour ;
  int length_of_the_serie = 0 ;
  
  CurrentState( int x_pos , int y_pos ) {
    x = x_pos ;
    y = y_pos ;
    colour = COLOURS[ floor( random(COLOURS.length) ) ] ;
  };
  
  void DrawASquare(){
    
     fill( colour[0] , colour[1] , colour[2] ) ;
     rect( x , y , SIZE_OF_A_SQUARE , SIZE_OF_A_SQUARE ) ;
     
     if ( random(1) < PROBABILITY_OF_CHANGING_COLOUR(length_of_the_serie) ) {
       colour = COLOURS[ floor( random(COLOURS.length) ) ] ;
       length_of_the_serie = 0 ;
     }
     else {
      length_of_the_serie += 1 ;
     } ;
     
  };
  
}
