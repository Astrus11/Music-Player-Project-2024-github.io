import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 3;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs;  //beginning current song as ZERO
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs];
//
int appWidth, appHeight;
float stwX1, stwY1, stwWidth1, stwHeight1;
float stwX2, stwY2, stwWidth2, stwHeight2;
float stwX3, stwY3, stwWidth3, stwHeight3;
PFont slenderFont, cyberpunkFont, saiyanFont;
color ink, bizzyblue=#0041FF, white=#FFFFFF, resetDefaultInk=white;
int size;
String title = "pillar1", footer= "pillar2", phrase= "pillar3";
Boolean randomColour = false;
//
/*
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
 AudioMetaData[] playListTitleMetaData = new AudioMetaData[numberOfSongs];
 AudioMetaData[] playListPositionMetaData = new AudioMetaData[numberOfSongs];
 AudioMetaData[] playListTimeRemainingMetaData = new AudioMetaData[numberOfSongs]; //might change
 AudioMetaData[] playListTotalTimeMetaData = new AudioMetaData[numberOfSongs]; //might change
 int currentSong = numberOfSongs - numberOfSongs;
 */
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
  String IReallyWannaStayAtYourHouse = "IReallyWannaStayAtYourHouse";
  String TheDrinkler = "TheDrinkler";
  String saiyansHaveLimits = "saiyansHaveLimits";
  //
  //Add Reading into Array
  String directory = "../../../" + musicPathway;
  String file = "";
  /*
  String file = directory + meatballParade + mp3FileName;
  playList[currentSong] = minim.loadFile( file );
  file = directory + sneakySnitch + mp3FileName;
  playList[currentSong+=1] = minim.loadFile( file );
  file = directory + monkeys + mp3FileName;
  playList[currentSong+=1] = minim.loadFile(file);
  */
  //
  for (int i=0; i<numberOfSongs; i++) {
    if (i==0) file = directory + IReallyWannaStayAtYourHouse + mp3FileName;
    if (i==1) file = directory + TheDrinkler + mp3FileName;
    if (i==2) file = directory + saiyansHaveLimits + mp3FileName;
    playList[i] = minim.loadFile( file );
  }
  currentSong = 0;
  //
  //
  // NOTE: Lines of code repeating
  /*
  playListMetaData[currentSong] = playList[currentSong].getMetaData(); //reads song meta 1, like song 1, mimicing array notation
  currentSong++;
  playListMetaData[currentSong] = playList[currentSong].getMetaData();
  currentSong++;
  playListMetaData[currentSong] = playList[currentSong].getMetaData();
  currentSong++;
  */
  /* NOTE: Introduce FOR LOOP
   - Known: how many lines of code
   - WHILE is for unknown loop interations
   */
   for (int i=0; i<numberOfSongs; i++) {
   playListMetaData[i] = playList[i].getMetaData();
   }
  //
  currentSong = 0;
  //
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
  cyberpunkFont = createFont("Slender", 55); //Verify the font exists in Processing.Java
  slenderFont = createFont("Cyberpunk", 55);
  saiyanFont = createFont("HelveticaNeue BlackCond", 55);
  //
  //
  //Population
  stwX2 = stwX1 = appWidth*6/10;
  stwY1 = appHeight*2/10;
  stwWidth1 = appWidth*4/10;
  stwHeight3 = stwHeight2 = stwHeight1 = appHeight*1/10;
  stwY2 = appHeight*3/10;
  stwWidth2 = appWidth*4/10;
  stwX3 = appWidth*6/10;
  stwY3 = appHeight*4/10;
  stwWidth3 = appWidth*4/10;
  //
  //DIV: turn off onces repeated in VOID draw, saves systems resources
  //X, Y, Width, Height
  /*
  rect( stwX1, stwY1, stwWidth1, stwHeight1 ); //Title
  rect( stwX2, stwY2, stwWidth2, stwHeight2 ); //Position
  rect( stwX3, stwY3, stwWidth3, stwHeight3 ); //Time Remaining | Total Song Length
  */
}
//
void draw() {
  //
  /*Optical Illusion creating movement
   - screen goes at front of draw(), repeating setup()
   */
  fill(resetDefaultInk);
  rect( stwX1, stwY1, stwWidth1, stwHeight1 );
  rect( stwX2, stwY2, stwWidth2, stwHeight2 );
  rect( stwX3, stwY3, stwWidth3, stwHeight3 );
  //
  //Drawing Text: applies to all text
  textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]
  ink = bizzyblue;
  fill(ink);
  size = 30; //Change the number until it fits
  textFont( slenderFont, size );
  /*Problem: .mp3 does not have the Meta Data Entered
   - must inspect .mp3 properties / details for information
   - what if Drag&Drop thus no inspection
   - metadata=="", then should put something in for the user
   */
  String titleCheck = ( playListMetaData[currentSong].title()!="" ) ? "Title Exists": "Title Does not Exist" ; //Careful with "not ="
  text( playListMetaData[currentSong].title(), stwX1, stwY1, stwWidth1, stwHeight1 );
  fill(ink);
  size = 43; //Change the number until it fits
  textFont( cyberpunkFont, size );
  //int timeRemaining = playListMetaData[currentSong].length()/1000; // Needs Updating
  int timeRemaining = playListMetaData[currentSong].length()/1000 - playList[currentSong].position()/1000; // Needs Updating
  String concatTimeRemaining = str ( timeRemaining ) + " | " + str ( playListMetaData[currentSong].length()/1000 ) + " Seconds";
  text( concatTimeRemaining, stwX3, stwY3, stwWidth3, stwHeight3 ); //Note: str(timeRemaining)
  //NOTE: Students to format Minutes and Seconds
  //
  //Repeating Code, different from Static
  ink = ( randomColour == true ) ? color( random(0, 256), random(256), random(256) ) : bizzyblue ; //Ternary Operator
  //
  fill(ink);
  size = 83; //Change the number until it fits
  textFont( saiyanFont, size );
  text( str ( playList[currentSong].position()/1000 ), stwX2, stwY2, stwWidth2, stwHeight2 );
  //
  /*
  fill(resetDefaultInk);
   //rect( metaDataX1, metaDataY1, metaDataWidth1, metaDataHeight1 );
   //rect( metaDataX2, metaDataY2, metaDataWidth2, metaDataHeight2 );
   rect( metaDataX3, metaDataY3, metaDataWidth3, metaDataHeight3 );
   */
}
//
void mousePressed() {
  //Boolean for Click
  //if() {} else {}
  //
  /* STOP Button Mouse Press, after Hoverover
   Must have Hoverover to ensure mouse will activate, visual confirmation of algorithm
   */
  if ( mouseX>stwX1 && mouseX<stwX1+stwWidth1 && mouseY>stwY1 && mouseY<stwY1+stwHeight1 ) {
    playList[currentSong].play(); // .loop(0) ... .play() matches keyPressed
  }
}
//
void keyPressed() {
   // Random Colour of .title()
  if ( randomColour == true ) {
    randomColour = false;
  } else {
    randomColour = true;
  }
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
}
//
// end main
