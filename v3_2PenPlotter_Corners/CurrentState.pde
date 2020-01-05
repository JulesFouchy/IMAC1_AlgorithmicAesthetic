public class CurrentState {
 
  int x , y ;
  int[] colour ;
  color colorSquare = color(157,46,198) ;
  int length_of_the_serie = 0 ;
  float angle = random(TAU/2) ;
  int spaceBetweenLines = floor(random( 2 , 11 )) ;
  float maxLength = sqrt( sq(SIZE_OF_A_SQUARE) + sq(SIZE_OF_A_SQUARE) ) ;
  PGraphics pg = createGraphics( SIZE_OF_A_SQUARE , SIZE_OF_A_SQUARE ) ;
  
  CurrentState( int xPos , int yPos ) {
    x = xPos ;
    y = yPos ;
  };
  
  void DrawASquare(){
    pg.beginDraw() ;
     pg.background(0) ;
     pg.stroke(colorSquare) ;
      if( TAU/8 < angle && angle < TAU/4 ){
        for( int xPos = -SIZE_OF_A_SQUARE ; xPos < SIZE_OF_A_SQUARE ; xPos += spaceBetweenLines ){
          pg.line( xPos , 0 , xPos + maxLength * cos( angle) , maxLength * sin(angle) ) ;
        }
      }
      else{
        if( TAU/4 < angle && angle < TAU*3/8 ){
        for( int xPos = -SIZE_OF_A_SQUARE ; xPos < SIZE_OF_A_SQUARE ; xPos += spaceBetweenLines ){
          pg.line( xPos + SIZE_OF_A_SQUARE , 0 , xPos + SIZE_OF_A_SQUARE + maxLength * cos( angle) , maxLength * sin(angle) ) ;
        }
      }
      else{
        if( angle <= TAU/8 ) {
            for( int yPos = -SIZE_OF_A_SQUARE ; yPos < SIZE_OF_A_SQUARE ; yPos += spaceBetweenLines ){
            pg.line( 0 , yPos , maxLength * cos( angle) , yPos + maxLength * sin(angle) ) ;
            }
        }
        else{
          for( int yPos = -SIZE_OF_A_SQUARE ; yPos < SIZE_OF_A_SQUARE ; yPos += spaceBetweenLines ){
            pg.line( SIZE_OF_A_SQUARE , yPos , SIZE_OF_A_SQUARE + maxLength * cos( angle) , yPos + maxLength * sin(angle) ) ;
        }
        }
      }
      }
      
      pg.endDraw() ;
      image(pg,x,y) ;
    
     if ( random(1) < PROBABILITY_OF_CHANGING_COLOUR(length_of_the_serie) ) {
       angle = random(TAU/2) ;
       spaceBetweenLines = floor(random( 2 , 11 )) ;
       length_of_the_serie = 0 ;
     }
     else {
      length_of_the_serie += 1 ;
     } ;
     
  };
  
}
