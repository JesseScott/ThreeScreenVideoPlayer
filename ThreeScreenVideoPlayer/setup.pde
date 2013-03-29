
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

  
  size(FirstScreenWidth, FirstScreenHeight, P2D);
  background(0);
  smooth();
  println();
  
  // Offset
  frame.setLocation(FirstScreenOffset,0);
  
  // Remote Screen(s)
  if(NumScreens >= 2){
    mc = new MessageConsumer();
    mc.setFrameSize(ThirdScreenOffset,ThirdScreenWidth,ThirdScreenHeight);
    mc.setBrokerLocation(FirstBrokerLocation);
    mc.setMessagingTopic(FirstBrokerTopic);
    mc.start();
  }
  if(NumScreens >= 3){
    mc2 = new MessageConsumer();
    mc2.setFrameSize(FourthScreenOffset,FourthScreenWidth,FourthScreenHeight);
    mc2.setBrokerLocation(SecondBrokerLocation);
    mc2.setMessagingTopic(SecondBrokerTopic);
    mc2.start();
  }


  // Graphics Buffers
  pg  = createGraphics(FirstScreenWidth, FirstScreenHeight, JAVA2D);  
  cp = createGraphics(1024, cpSize, JAVA2D); 

  
  // CP5
  println("Minimum Blob Size Set To " + blobMin);
  println("Minimum Blob Size Set To " + blobMax);
  println("Minimum Blob Size Set To " + blobThresh);
  cp5 = new ControlP5(this);
  cp5.addToggle("CAM", 250, FirstScreenHeight + 25, menuHeight/4, menuHeight/4);
  cp5.addToggle("BLB", 300, FirstScreenHeight + 25, menuHeight/4, menuHeight/4);
  cp5.addBang("SaveSettings")
     .setPosition(350, FirstScreenHeight + 25)
     .setSize(25, 25)
     ;
//  cp5.addNumberbox("BlobMin")
//     .setPosition(325, FirstScreenHeight + 25)
//     .setSize(50,25)
//     .setRange(0,1)
//     .setMultiplier(0.01) 
//     .setDirection(Controller.HORIZONTAL) 
//     .setValue(blobMin)
//     ;
//  cp5.addNumberbox("BlobMax")
//     .setPosition(400, FirstScreenHeight + 25)
//     .setSize(50, 25)
//     .setRange(0,1)
//     .setMultiplier(0.01) 
//     .setDirection(Controller.HORIZONTAL) 
//     .setValue(blobMax)
//     ;
//  cp5.addNumberbox("BlobThresh")
//     .setPosition(475, FirstScreenHeight + 25)
//     .setSize(50, 25)
//     .setRange(0,1)
//     .setMultiplier(0.01) 
//     .setDirection(Controller.HORIZONTAL)
//     .setValue(blobThresh)
//     ;  
  rb = cp5.addRadioButton("CropBox")
     .setPosition(25, FirstScreenHeight + 25)
     .setSize(25, 25)
     .setColorForeground(color(120))
     .setColorActive(color(255))
     .setColorLabel(color(255))
     .setItemsPerRow(4)
     .setSpacingColumn(25)
     .addItem("LEFT", 1)
     .addItem("RIGHT", 2)
     .addItem("TOP", 3)
     .addItem("BOTTOM", 4)
     ;
     

  frameRate(120);
  
  println();
  println("----------------------");
  println("    END OF SETUP  ");
  println("----------------------");
  println();
  
} // end SETUP
  
  //-----------------------------------------------------------------------------------------
