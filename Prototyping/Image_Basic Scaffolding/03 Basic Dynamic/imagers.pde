//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float bumX, bumY, bumWidth, bumHeight;
PImage picBackground, picBum;
int picBumWidth, picBumHeight;
float bumX_Changed, bumY_Changed;
float picBumWidthChanged, picBumHeightChanged, biggerSide, smallerSide, ratio;
//
void setup() {
  size( 1000, 800 ); //Landscape
  appWidth = width;
  appHeight = height;
  //
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  picBackground = loadImage("../../../../Images/Square/bum.jpg");
  bumX_Changed = bumX = appWidth * 1/2;
  bumY_Changed = bumY = appHeight * 1/9000000;
  bumWidth = appWidth * 1/2;
  bumHeight = appHeight * 1/2;
  picBum = loadImage("../../../../Images/Landscape/millyrock.jpg");
  picBumWidthChanged = picBumWidth = 860;
  picBumHeightChanged = picBumHeight = 529;
  //
  //Image Compression
  biggerSide = ( picBumWidth > picBumHeight ) ? picBumWidth : picBumHeight ;
  smallerSide = ( picBumHeight < picBumWidth ) ? picBumHeight : picBumWidth ;
  ratio = biggerSide / smallerSide; //Ratio bigger than one, divide means smaller side, multiply means larger side
  println( "Big Side:", biggerSide, "\tSmall Side:", smallerSide, "\tRatio:", ratio );
  if ( bumWidth > bumHeight ) { //DIV Landscape, find larger side
    picBumHeightChanged = bumHeight;
    picBumWidthChanged = (picBumWidth > picBumHeight) ? picBumWidthChanged / ratio : picBumWidthChanged * ratio;
  } else { //DIV Portrait
    picBumWidthChanged = bumWidth;
    picBumHeightChanged = (picBumWidth > picBumHeight) ? picBumWidthChanged / ratio : picBumWidthChanged * ratio;
  }
  println( "Changed Width:", picBumWidthChanged, "\tChanged Height:", picBumHeightChanged );
  //
  //DIVs
  rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  rect( bumX, bumY, bumWidth, bumHeight );
}
//
void draw() {
  //Draw Image One Time, for testing
  image( picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  image( picBum, bumX_Changed, bumY_Changed, picBumWidthChanged, picBumHeightChanged );
}
//
void mousePressed() {
}
//
void keyPressed() {
  if (key==DOWN || key == UP); 
    picBum = loadImage("../../../../Images/Portrait/method.jpg");
  
}
//
//End MAIN
