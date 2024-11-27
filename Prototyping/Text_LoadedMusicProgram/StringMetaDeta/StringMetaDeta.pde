/* META Data - Strings
 */
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
int appWidth,  appHeight;
float stwX1, stwY1, stwWidth1, stwHeight1;
float stwX2, stwY2, stwWidth2, stwHeight2;
float stwX3, stwY3, stwWidth3, stwHeight3;
//
Minim minim;
int numberOfSongs =8;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
Audiostw[] playListTitlestw; = new AudioPlayer[numberOfSongs]; //"song sigma one"
Audiostw[] playListPositionstw; = new AudioPlayer[numberOfSongs]; //"song sigma one"
Audiostw[] playListTimeRemainingstw; = new AudioPlayer[numberOfSongs]; //"song sigma one"
Audiostw[] playListTotalTimestw; = new AudioPlayer[numberOfSongs]; //"song sigma one"
int currnetSong = numberOfSongs - numberOfSongs;
void setup()
{
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //
  //Population
  stwX1 = appWidth*1/10; //Title
  stwY1 = appHeight*4/10;
  stwWidth1 = appWidth*8/10;
  stwHeight1 = appHeight*1/10;
  stwX2 = appWidth*1/10; //Song Position
  stwY2 = appHeight*3/10;
  stwWidth2 = appWidth*3/10;
  stwHeight2 = appHeight*1/10;
  stwX3 = appWidth*4/10; //Time Remaining
  stwY3 = appHeight*3/10;
  stwWidth3 = appWidth*5/10;
  stwHeight3 = appHeight*1/10;
  
  //DIV //stwX, stwY, stwWidth, stwHeight
  rect( stwX1, stwY1, stwWidth1, stwHeight1 );
  rect( stwX2, stwY2, stwWidth2, stwHeight2 );
  rect( stwX3, stwY3, stwWidth3, stwHeight3 );
} //End setup
//
void draw() {
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
//End Main
