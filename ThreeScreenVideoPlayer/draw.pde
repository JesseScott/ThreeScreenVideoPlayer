 
//-----------------------------------------------------------------------------------------
// DRAW

void draw() {
  


    
    // Buffer
    pg.beginDraw();
      pg.smooth();

      
    pg.endDraw();
    
    // Buffer Image
    image(pg, 0, 0);
    
    // GUI
    cp5.draw();


    // FPS
    if(frameCount % 120 == 0) {
      int fps = round(frameRate); 
      //println("FPS " + fps);
    }
 
} // end DRAW
  
//-----------------------------------------------------------------------------------------

