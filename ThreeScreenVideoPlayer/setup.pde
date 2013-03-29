
//-----------------------------------------------------------------------------------------
// SETUP

void setup() {
 
  // Reading settings.properties File
  try {
    println("Reading Properties");
    properties = new P5Properties();
    properties.load(openStream("settings.properties"));
 
    NumScreens = properties.getIntProperty("env.view.numscreens", 1);
    
    // Control Window
    FirstScreenOffset = properties.getIntProperty("env.view.controlWindow.offset", 0);
    FirstScreenWidth = properties.getIntProperty("env.view.controlWindow.width", 500);
    FirstScreenHeight = properties.getIntProperty("env.view.controlWindow.height", 500);
    
    // Second Window (First Movie)
    SecondScreenOffset = properties.getIntProperty("env.view.firstBuffer.offset", 55);
    SecondScreenWidth = properties.getIntProperty("env.view.firstBuffer.width", 1024);
    SecondScreenHeight = properties.getIntProperty("env.view.firstBuffer.height", 768);
    
    // Third Window (Second Movie)
    ThirdScreenOffset = properties.getIntProperty("env.view.secondBuffer.offset", 155);
    ThirdScreenWidth = properties.getIntProperty("env.view.secondBuffer.width", 1024);
    ThirdScreenHeight = properties.getIntProperty("env.view.secondBuffer.height", 768);
    
    // Fourth Window (Third Movie)
    FourthScreenOffset = properties.getIntProperty("env.view.thirdBuffer.offset", 255);
    FourthScreenWidth = properties.getIntProperty("env.view.thirdBuffer.width", 1024);
    FourthScreenHeight = properties.getIntProperty("env.view.thirdBuffer.height", 768);
    println();
  }
  catch(IOException e) {
    e.printStackTrace();
    println("Couldn't read config file...");
    exit();
  }
  
  // Screen stuff
  size(FirstScreenWidth, FirstScreenHeight, GLConstants.GLGRAPHICS);
  background(0);
  smooth();
  println();
  
  // Texture Windows
  textureWindow1 = new GLTextureWindow(this, SecondScreenOffset, 0, SecondScreenWidth, SecondScreenHeight);
  textureWindow2 = new GLTextureWindow(this, ThirdScreenOffset,  0, ThirdScreenWidth,  ThirdScreenHeight);
  textureWindow3 = new GLTextureWindow(this, FourthScreenOffset, 0, FourthScreenWidth, FourthScreenHeight);
  
  // Movies
  movie1 = new GSMovie(this, "../movies/movie1.mov");
  movie2 = new GSMovie(this, "../movies/movie2.mov");
  movie3 = new GSMovie(this, "../movies/movie3.mov");

  // Calculate Length
  movie1Length = movie1.length();
  movie2Length = movie2.length();
  movie3Length = movie3.length();

  // Textures
  texture1 = new GLTexture(this);
  texture2 = new GLTexture(this);
  texture3 = new GLTexture(this);
  
  // Assign Movies To Textures
  movie1.setPixelDest(texture1);
  movie2.setPixelDest(texture2);
  movie3.setPixelDest(texture3);
  
  // Set Buffer Size
  texture1.setPixelBufferSize(10);
  texture1.delPixelsWhenBufferFull(false);
  texture2.setPixelBufferSize(10);
  texture2.delPixelsWhenBufferFull(false);
  texture3.setPixelBufferSize(10);
  texture3.delPixelsWhenBufferFull(false);
  
  // Assign textures To Texture Windows
  textureWindow1.setTexture(texture1);
  textureWindow2.setTexture(texture2);
  textureWindow3.setTexture(texture3);
  
  // Set Frame Rates
  textureWindow1.frameRate(30);
  textureWindow2.frameRate(30);
  textureWindow3.frameRate(30);
  
  // Loop
  movie1.loop();
  movie2.loop();
  movie3.loop();
  
  // CP5
  cp5 = new ControlP5(this);
  cp5.addToggle("PLAY",  FirstScreenWidth / 4, FirstScreenHeight / 4, 75, 75);
  cp5.addBang("STOP").setPosition(FirstScreenWidth / 4, FirstScreenHeight / 2).setSize(75, 75);
  cp5.addSlider("SCRUB").setPosition(100, 50).setRange(0, 255);
  
  // Font
  font = loadFont("Serif-48.vlw");
  textFont(font);  
  textSize(24);

  // Set Frame Rate (ideal)
  frameRate(120);
  
  println();
  println("----------------------");
  println("    END OF SETUP  ");
  println("----------------------");
  println();
  
} // end SETUP
  
  //-----------------------------------------------------------------------------------------
