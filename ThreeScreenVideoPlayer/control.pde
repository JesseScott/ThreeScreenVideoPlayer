
//-----------------------------------------------------------------------------------------
// CONTROL

// PLAY / PAUSE
void PLAY(boolean theFlag) {
  if(theFlag == true) {
    movie1.play();
    movie2.play();
    movie3.play();
  } 
  else if (theFlag == false) {
    movie1.pause();
    movie2.pause();
    movie3.pause();
  }
}

// LOOP
void LOOP(boolean theFlag) {
  if(theFlag == true) {
    movie1.loop();
    movie2.loop();
    movie3.loop();
  } 
  else if (theFlag == false) {
    movie1.noLoop();
    movie2.noLoop();
    movie3.noLoop();
  }
}
 
// STOP
void STOP(boolean theFlag) {
  movie1.stop();
  movie2.stop();
  movie3.stop();
}

// SCRUB
void SCRUB(float theVal) {
  
 // movie1.jump(   );
  
}

