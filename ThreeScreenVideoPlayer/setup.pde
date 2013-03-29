
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
  
  // Graphics Buffers
  glg1 = new GLGraphicsOffScreen(this, SecondScreenWidth, SecondScreenHeight, true, 4);
  glg2 = new GLGraphicsOffScreen(this, ThirdScreenWidth,  ThirdScreenHeight,  true, 4);
  glg3 = new GLGraphicsOffScreen(this, FourthScreenWidth, FourthScreenHeight, true, 4);
  
  // Movies
  movie1 = new GSMovie(this, "../Movies/movie1.mov");
  movie2 = new GSMovie(this, "../Movies/movie2.mov");
  movie2 = new GSMovie(this, "../Movies/movie3.mov");

  // Textures
  texture1 = new GLTexture(this);
  texture2 = new GLTexture(this);
  texture3 = new GLTexture(this);
  
  // CP5
  cp5 = new ControlP5(this);
  cp5.addToggle("PLAY", 250, FirstScreenHeight + 100, menuHeight/4, menuHeight/4);
  cp5.addToggle("RESET", 300, FirstScreenHeight + 25, menuHeight/4, menuHeight/4);
  cp5.addSlider("PLAYHEAD").setPosition(100,50).setRange(0,255);
     

  frameRate(120);
  
  println();
  println("----------------------");
  println("    END OF SETUP  ");
  println("----------------------");
  println();
  
} // end SETUP
  
  //-----------------------------------------------------------------------------------------
