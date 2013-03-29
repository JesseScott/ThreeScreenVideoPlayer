 
//-----------------------------------------------------------------------------------------
// DRAW

void draw() {
   // Clear BG
   background(0);

  // Read Movies
  if (movie1.available()) {
    movie1.read();
  }
  if (movie2.available()) {
    movie2.read();
  }
  if (movie3.available()) {
    movie3.read();
  }
  
  // Check Buffer
  if(texture1.putPixelsIntoTexture()) {
    if(textureWindow1.ready()) {
      
    }
  }
  if(texture2.putPixelsIntoTexture()) {
    if(textureWindow2.ready()) {
      
    }
  }
  if(texture3.putPixelsIntoTexture()) {
    if(textureWindow3.ready()) {
      
    }
  }
  
  // GUI
  cp5.draw();

  // FPS
  if(frameCount % 120 == 0) {
    fps = round(frameRate); 
    //println("FPS " + fps);
  }
  smooth();
  fill(255);
  textFont(font);
  text("Frame Rate Is : " + fps, 100, height - 100);
 
} // end DRAW

// Render
void post() {
  textureWindow1.render();  
  textureWindow2.render();  
  textureWindow3.render();  
}
  
//-----------------------------------------------------------------------------------------

