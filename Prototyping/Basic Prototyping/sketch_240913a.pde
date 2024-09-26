import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 3; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
int currentSongIndex = 0;
//
int appWidth, appHeight;
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float stopX, stopY, stopWidth, stopHeight;
String musicPath = "MP3s/";
String mp3FileName = ".mp3";
String[] musicNames = {
  "one",
  "two",
  "three"
};
//
void setup()
{
  size(900, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonDIV_Width = appWidth*1/2;
  musicButtonDIV_Height = appHeight*1/2;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height - musicButtonDIV_Height*1/2;
     //if ( musicButtonWidth <= musicButtonHeight ) { //error: square does not go in the middle
      // musicButtonWidth needs to change
      //musicButtonWidth = musicButtonHeight;
  // } else {
      // musicButtonWidth needs to change
      //musicButtonWidth = musicButtonHeight;
  // }
  //Use if statement to change, introduce ternary operator
  //
  //Population (Variables)
  //musicButtonSquareWidth = ;
  //musicButtonSquareHeight = ;
  //musicButtonSquareX = ;
  //musicButtonSquareY = ;
  //float padding = 1.0/4.0;
  //float stopButtonSize = 1.0-(1.0/4.0);
  /*
  stopWidth = musicButtonDIV_Width*stopButtonSize; // stopButtonSize
  stopHeight = musicButtonDIV_Height*stopButtonSize; // stopButtonSize
  stopX = musicButtonDIV_X;
  stopY = musicButtonDIV_Y;
  */
  //
  //
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder
  //
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
  //Alphebetical order, same as OS ordering files
  String groove = "groove";
  String beatYourCompetition = "Beat_Your_Competition";
  String theSimplest = "The_Simplest";
  //
  //Add Reading into Array
  String directory = "../../" + musicPathway;
  println ( currentSong, directory );
  String file = directory + groove + mp3FileName;
  println (file);
  song[currentSong] = minim.loadFile( file );
  file = directory + theSimplest + mp3FileName;
  println (file);
  song[currentSong+=1] = minim.loadFile( file );
  println( currentSong, song[currentSong] );
  file = directory + beatYourCompetition + mp3FileName;
  //
  currentSong = 0;
  //
  song[currentSong].play();
  //Use play(timeStart) & loop(numberOfLoops)
  //Purpose is 2D Shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  rect( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
} //End setup
//
void draw() {
  background(200); // Gray Scale 0-255
  //rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight ); //Square
  //fill(0, 0, 255);
  //textSize(32);
  //text("Now Playing: " + musicNames[currentSongIndex], 50, height / 2);
  //text("Press SPACE to switch songs", 50, height / 2 + 40);
  //rect ( stopX, stopY, stopWidth, stopHeight );
} //End draw
//
void mousePressed() {
} //End mousePressed
//
void keyPressed() {
} //End keyPressed
//
// End Main Program
