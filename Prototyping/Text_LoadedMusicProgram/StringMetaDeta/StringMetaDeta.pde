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
int numberOfSongs =3;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioMetaData[] playListTitleMetaData = new AudioMetaData[numberOfSongs]; 
AudioMetaData[] playListPositionMetaData = new AudioMetaData[numberOfSongs]; 
AudioMetaData[] playListTimeRemainingMetaData = new AudioMetaData[numberOfSongs]; //"song sigma one"
AudioMetaData[] playListTotalTimeMetaData = new AudioMetaData[numberOfSongs]; //"song sigma one"
int currentSong = numberOfSongs - numberOfSongs;
void setup()
{
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  //
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, same as OS ordering files
  String TheDrink = "TheDrink";
  String weSaiyansHaveLimits = "weSaiyansHaveLimits";
  String TheDrinkler = "TheDrinkler";
  //
  //Add Reading into Array
  String directory = "../../../" + musicPathway;
  String file = directory + TheDrink + mp3FileName;
  playList[currentSong] = minim.loadFile( file );
  file = directory + TheDrinkler + mp3FileName;
  playList[currentSong+=1] = minim.loadFile( file );
  file = directory + weSaiyansHaveLimits + mp3FileName;
  playList[currentSong+=1] = minim.loadFile( file );
  //
  currentSong = 0;
  //
  playList[currentSong].play();
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
