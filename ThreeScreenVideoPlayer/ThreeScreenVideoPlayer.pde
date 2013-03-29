   
//-----------------------------------------------------------------------------------------
/*
 * ThreeScreenVideoPlayer
 * ---------------------------------------------------------------------------
 * Jesse Scott    
 * www.jesses.co.tt | www.github.com/JesseScott/ThreeScreenVideoPlayer
 * ----------------------------------------------------------------------------
 * License:
 * Licensed according to the 
 * Attribution-Non-Commercial-Repurcussions 3.0 Unported (CC BY-NC 3.0)
 * as per 
 * http://www.graffitiresearchlab.fr/?portfolio=attribution-noncommercial-repercussions-3-0-unported-cc-by-nc-3-0
 * 
 * ----------------------------------------------------------------------------
 * Credits
 * _______
 * 
 * Programming:  
 *    Jesse Scott
 *
 *  Libraries
 *  _________
 * 
 *  GLGraphics     - Andres Colubri | http://glgraphics.sourceforge.net/
 *  GSVideo        - Andres Colubri | http://gsvideo.sourceforge.net/
 *
 * ----------------------------------------------------------------------------
 */
//-----------------------------------------------------------------------------------------

// IMPORTS
//-----------------------------------------------------------------------------------------

import processing.opengl.*;
import controlP5.*;
import processing.video.*;
import codeanticode.glgraphics.*;
import codeanticode.gsvideo.*;
import java.util.Properties;

  
// DECLARATIONS
//-----------------------------------------------------------------------------------------  

// Video
GSMovie movieOne, movieTwo, movieThree;

// Offscreen Graphics Buffers
GLGraphicsOffScreen glg1, glg2, glg3;

// CP5
ControlP5 cp5;
RadioButton rb;

// Text
PFont font;

//Settings
P5Properties properties;


// GLOBAL VARIABLES
//-----------------------------------------------------------------------------------------


// Images
PImage logo, license;

// System
int UseOpenGL, UseSecondScreen;

// Settings
int NumScreens;
int FirstScreenWidth, FirstScreenHeight, FirstScreenOffset; 
int SecondScreenWidth, SecondScreenHeight, SecondScreenOffset;
int ThirdScreenWidth, ThirdScreenHeight, ThirdScreenOffset;
int FourthScreenWidth, FourthScreenHeight, FourthScreenOffset;


// GUI
int menuHeight = 100;
int menuWidth = 1024;
int cpSize = int(menuHeight * 0.8);
int picker;


//-----------------------------------------------------------------------------------------
  

