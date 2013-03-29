
//-----------------------------------------------------------------------------------------
// SETUP

void setup() {
 
  // Reading settings.properties File
  try {
    println("Reading Properties");
    properties = new P5Properties();
    properties.load(openStream("settings.properties"));
 
    NumScreens = properties.getIntProperty("env.view.numscreens", 1);
    
    //editor window
    FirstScreenOffset = properties.getIntProperty("env.view.controlWindow.offset", 0);
    FirstScreenWidth = properties.getIntProperty("env.view.controlWindow.width", 500);
    FirstScreenHeight = properties.getIntProperty("env.view.controlWindow.height", 500);
    
    //projection window
    SecondScreenOffset = properties.getIntProperty("env.view.firstBuffer.offset", 55);
    SecondScreenWidth = properties.getIntProperty("env.view.firstBuffer.width", 1024);
    SecondScreenHeight = properties.getIntProperty("env.view.firstBuffer.height", 768);
    
    //first remote source
    ThirdScreenOffset = properties.getIntProperty("env.view.secondBuffer.offset", 155);
    ThirdScreenWidth = properties.getIntProperty("env.view.secondBuffer.width", 1024);
    ThirdScreenHeight = properties.getIntProperty("env.view.secondBuffer.height", 768);
    
    //second remote source
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

  
  // CP5
  cp5 = new ControlP5(this);
  cp5.addToggle("CAM", 250, FirstScreenHeight + 25, menuHeight/4, menuHeight/4);
  cp5.addToggle("BLB", 300, FirstScreenHeight + 25, menuHeight/4, menuHeight/4);

     

  frameRate(120);
  
  println();
  println("----------------------");
  println("    END OF SETUP  ");
  println("----------------------");
  println();
  
} // end SETUP
  
  //-----------------------------------------------------------------------------------------
