
//-----------------------------------------------------------------------------------------
// SETUP

void setup() {
 
  // Reading settings.properties File
  try {
    println("Reading Properties");
    properties = new P5Properties();
    properties.load(openStream("settings.properties"));
 
    NumScreens = properties.getIntProperty("env.view.numscreens",1);
    DrawMode = properties.getIntProperty("env.view.drawmode",1);
    
    //editor window
    FirstScreenOffset = properties.getIntProperty("env.view.firstscreen.offset", 0);
    FirstScreenWidth = properties.getIntProperty("env.view.firstscreen.width",640);
    FirstScreenHeight = properties.getIntProperty("env.view.firstscreen.height",480);
    EditorBrokerLocation = properties.getProperty("remote.editor.broker.uri", "peer://group1/" + UUID.randomUUID().toString());
    EditorBrokerTopic = properties.getProperty("remote.editor.broker.topic", "TCP.BERLIN");
    
    //projection window
    SecondScreenOffset = properties.getIntProperty("env.view.secondscreen.offset",55);
    SecondScreenWidth = properties.getIntProperty("env.view.secondscreen.width",640);
    SecondScreenHeight = properties.getIntProperty("env.view.secondscreen.height",480);
    
    //first remote source
    ThirdScreenOffset = properties.getIntProperty("env.view.thirdscreen.offset",55);
    ThirdScreenWidth = properties.getIntProperty("env.view.thirdscreen.width",640);
    ThirdScreenHeight = properties.getIntProperty("env.view.thirdscreen.height",480);
    FirstBrokerLocation = properties.getProperty("remote.first.broker.uri", "peer://group1/" + UUID.randomUUID().toString());
    FirstBrokerTopic = properties.getProperty("remote.first.broker.topic", "TCP.BERLIN");
    
    //second remote source
    FourthScreenOffset = properties.getIntProperty("env.view.fourthscreen.offset",55);
    FourthScreenWidth = properties.getIntProperty("env.view.fourthscreen.width",640);
    FourthScreenHeight = properties.getIntProperty("env.view.fourthscreen.height",480);
    SecondBrokerLocation = properties.getProperty("remote.second.broker.uri", "peer://group1/" + UUID.randomUUID().toString());
    SecondBrokerTopic = properties.getProperty("remote.second.broker.topic", "TCP.BERLIN");
    println();
  }
  catch(IOException e) {
    e.printStackTrace();
    println("couldn't read config file...");
    exit();
  }
  


  // Screen stuff

  
  size(FirstScreenWidth, FirstScreenHeight + menuHeight, P2D);
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
