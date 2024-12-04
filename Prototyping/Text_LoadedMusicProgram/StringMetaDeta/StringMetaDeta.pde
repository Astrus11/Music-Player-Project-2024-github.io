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
PFont titleFont, footerFont, phraseFont;
//
Minim minim;
int numberOfSongs =3; //Able to Autodetect based on Pathway
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs];
AudioMetaData[] playListPositionMetaData = new AudioMetaData[numberOfSongs]; 
AudioMetaData[] playListTimeRemainingMetaData = new AudioMetaData[numberOfSongs]; //"song sigma one"
AudioMetaData[] playListTotalTimeMetaData = new AudioMetaData[numberOfSongs]; //"song sigma one"
int currentSong = numberOfSongs - numberOfSongs;
void setup()
{
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  minim = new Minim(this);
  //
  // Load Music
  String musicPathway = "Music/";
  String mp3FileName = ".mp3";
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
  playListMetaData[currentSong] = playList[currentSong].getMetaData();
  currentSong++;
  playListMetaData[currentSong] = playList[currentSong].getMetaData();
  currentSong++;
  playListMetaData[currentSong] = playList[currentSong].getMetaData();
    /* NOTE: Introduce FOR LOOP
   - Known: how many lines of code
   - WHILE is for unknown loop interations
   
   for (int i=0; i<numberOfSongs; i++) {
   playListMetaData[i] = playList[i].getMetaData();
   }
   */
   /* For Prototyping Meta Data, print all information to the console first
   //Verifying Meta Data, 18 println's
   //See .mp3 Right-Click / Properties / Details
   println("\n"); //Two spaces: one for ln, one for /n escape
   println(currentSong, playListMetaData[currentSong] );
   println( "File Name: ", playListMetaData[currentSong].fileName() );
   println( "Song Length (in milliseconds): ", playListMetaData[currentSong].length() );
   println( "Song Length (in seconds): ", playListMetaData[currentSong].length()/1000 );
   println( "Song Length (in minutes & seconds): ", (playListMetaData[currentSong].length()/1000)/60, " minute", (playListMetaData[currentSong].length()/1000)-((playListMetaData[currentSong].length()/1000)/60 * 60), " seconds" );
   println( "Song Title: ", playListMetaData[currentSong].title() );
   println( "Author: ", playListMetaData[currentSong].author() ); //Song Writer or Performer
   println( "Composer: ", playListMetaData[currentSong].composer() ); //Song Writer
   println( "Orchestra: ", playListMetaData[currentSong].orchestra() );
   println( "Album: ", playListMetaData[currentSong].album() );
   println( "Disk: ", playListMetaData[currentSong].disc() );
   println( "Publisher: ", playListMetaData[currentSong].publisher() );
   println( "Date Release: ", playListMetaData[currentSong].date() );
   println( "Copyright: ", playListMetaData[currentSong].copyright() );
   println( "Comment: ", playListMetaData[currentSong].comment() );
   println( "Lyrics: ", playListMetaData[currentSong].lyrics() );
   println( "Track: ", playListMetaData[currentSong].track() );
   println( "Genre: ", playListMetaData[currentSong].genre() );
   println( "Encoded: ", playListMetaData[currentSong].encoded() ); //how a computer reads the file
   */
  //playList[currentSong].play(); //Testing Only
  //
  //Text Loading
  //Text: Single Executed Code
  //Fonts from OS (Operating System)
  //String[] fontList = PFont.list(); //To list all fonts available on OS
  //printArray(fontList); //For listing all possible fonts to choose from, then createFont
  // Tools / Create Font / Find Font / Do not press "OK", known bug
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
 //
  /* Key Board Short Cuts ... learning what the Music Buttons could be
   Note: CAP Lock with ||
   if ( key==? || key==? ) ;
   */
  if ( key=='P' || key=='p' ) playList[currentSong].play(); //Simple Play, no double tap possible
  //
  //if ( key=='P' || key=='p' ) song[currentSong].loop(0); //Simple Play, double tap possible
  /* Note: double tap is automatic rewind, no pause
   Symbol is two triangles
   This changes what the button might become after it is pressed
   */
  //if ( key=='S' || key=='s' ) song[currentSong].pause(); //Simple Stop, no double taps
  //
  if ( key=='S' | key=='s' ) {
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause(); //single tap
    } else {
      playList[currentSong].rewind(); //double tap
    }
  }
  if ( key=='L' || key=='l' ) playList[currentSong].loop(1); // Loop ONCE: Plays, then plays again, then stops & rewinds
  if ( key=='K' || key=='k' ) playList[currentSong].loop(); // Loop Infinitely //Parameter: BLANK or -1
  if ( key=='F' || key=='f' ) playList[currentSong].skip( 10000 ); // Fast Forward, Rewind, & Play Again //Parameter: milliseconds
  if ( key=='R' || key=='r' ) playList[currentSong].skip( -10000 ); // Fast Reverse & Play //Parameter: negative numbers
  if ( key=='M' || key=='m' ) { // MUTE
    //
    //MUTE Behaviour: stops electricty to speakers, does not stop file
    //NOTE: MUTE has NO built-in PUASE button, NO built-in rewind button
    //ERROR: if song near end of file, user will not know song is at the end
    //Known ERROR: once song plays, MUTE acts like it doesn't work
    if ( playList[currentSong].isMuted() ) {
      //ERROR: song might not be playing
      //CATCH: ask .isPlaying() or !.isPlaying()
      playList[currentSong].unmute();
    } else {
      //Possible ERROR: Might rewind the song
      playList[currentSong].mute();
    }
  }
  if ( key=='O' || key=='o' ) { // Pause
    //
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].play();
    }
  }
  if ( key==CODED || keyCode==ESC ) exit(); // QUIT //UP
  if ( key=='Q' || key=='q' ) exit(); // QUIT
  //
  if ( key=='N' || key=='n' ) { // NEXT //See .txt for starter hint
    if ( playList[currentSong].isPlaying() ) {
      playList[currentSong].pause();
      playList[currentSong].rewind();
      //
      if ( currentSong==numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
      playList[currentSong].play();
    } else {
      //
      playList[currentSong].rewind();
      //
      if ( currentSong==numberOfSongs-1 ) {
        currentSong = 0;
      } else {
        currentSong++;
      }
      // NEXT will not automatically play the song
      //song[currentSong].play();
    }
  }
  //if ( key=='P' || key=='p' ) ; // Previous //Students to finish
  //
  //if ( key=='S' || key=='s' ) ; // Shuffle - PLAY (Random)
  //Note: will randomize the currentSong number
  //Caution: random() is used very often
  //Question: how does truncating decimals affect returning random() floats
  /*
  if ( key=='' || key=='' ) ; // Play-Pause-STOP //Advanced, beyond single buttons
   - need to have basic GUI complete first
   */
  //
} //End keyPressed
//
// End Main Program
