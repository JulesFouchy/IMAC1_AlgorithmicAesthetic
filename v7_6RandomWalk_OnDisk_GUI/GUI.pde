void updateVariables(){
  crownLength = radius/NB_OF_CROWNS ;
  angleLengthOfASection = TAU/NB_OF_ANGULAR_SECTIONS ;
  frameRate(FRAME_RATE) ;
  ants = new ArrayList<Ant>() ;
  for( int k = 0 ; k < NB_OF_ANTS ; ++k ){
    ants.add( new Ant() ) ;
  }
}

void resetScreen(){
  background(0) ;
  text("You can press the space bar to pause, 's' to save,\n'r' to redraw with the same colours and 'c' to change colours." , 50 , 300 ) ;
  drawHues(50,350,250,25) ;
}

void resetAntsPosition(){
  for( Ant ant : ants ){
      ant.rCount = 0 ;
      ant.thetaCount = int(random(NB_OF_ANGULAR_SECTIONS)) ;
      ant.direction = OUTWARDS ;
    }
}

void createSliders(){
  
  cp5 = new ControlP5(this);
  
  hueRange = cp5.addRange("HUE_RANGE")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(50,400)
             .setSize(250,25)
             .setRange(0,360)
             .setLowValue(0)
             .setHighValue(360)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true) 
             ;
             
 saturationRange = cp5.addRange("SATURATION_RANGE")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(50,450)
             .setSize(250,25)
             .setRange(0,100)
             .setLowValue(0)
             .setHighValue(100)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true) 
             ;
             
 brightnessRange = cp5.addRange("BRIGHTNESS_RANGE")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(50,500)
             .setSize(250,25)
             .setRange(0,100)
             .setLowValue(30)
             .setHighValue(100)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true) 
             ;
     
  cp5.addSlider("NB_OF_CROWNS")
   .setPosition(50,50)
   .setSize(250,25)
   .setRange(1,200)
   ;
   
  cp5.addSlider("NB_OF_ANGULAR_SECTIONS")
   .setPosition(50,100)
   .setSize(250,25)
   .setRange(1,200)
   ;
   
  cp5.addSlider("NB_OF_ANTS")
   .setPosition(50,150)
   .setSize(250,25)
   .setRange(0,200)
   ;
   
 cp5.addSlider("PROBA_OF_CHANGING_DIRECTION")
   .setPosition(50,200)
   .setSize(250,25)
   .setRange(0,1)
   ;
   
 cp5.addSlider("FRAME_RATE")
   .setPosition(50,250)
   .setSize(250,25)
   .setRange(1,180)
   ;
}

void controlEvent(ControlEvent theEvent) {
  if( !theEvent.isFrom("FRAME_RATE") ){
    delay(100) ;
    updateVariables() ;
    resetScreen() ;
    timeIsRunning = true ;
  }
  else{
    frameRate(FRAME_RATE) ;
  }
  if( theEvent.isFrom("HUE_RANGE") ) {
    minHue = theEvent.getController().getArrayValue(0);
    maxHue = theEvent.getController().getArrayValue(1);
  }
  if( theEvent.isFrom("SATURATION_RANGE") ) {
    minSaturation = theEvent.getController().getArrayValue(0);
    maxSaturation = theEvent.getController().getArrayValue(1);
  }
  if( theEvent.isFrom("BRIGHTNESS_RANGE") ) {
    minBrightness = theEvent.getController().getArrayValue(0);
    maxBrightness = theEvent.getController().getArrayValue(1);
  }
}

void drawHues( float xTopLeft , float yTopLeft , float Width , float Height ){
  colorMode( HSB , 360 , 100 , 100 ) ;
  for( float xShift = 0 ; xShift < Width ; xShift++ ){
    stroke( xShift/Width*360 , 100 , 100 ) ;
    line( xTopLeft+xShift , yTopLeft , xTopLeft+xShift , yTopLeft+Height ) ; 
  }
}
