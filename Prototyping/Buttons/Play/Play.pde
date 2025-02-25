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
//
int appWidth, appHeight;
//CAUTION: IF Statement Variable Population
float musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height;
float musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight;
float stopX, stopY, stopWidth, stopHeight;
float playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y;
float quitLine;
//
color blue=#1669F5, darkblue=#0929D8, purple=#B116F5, lightgray=#8CC4F0, dark=#554C43, black=#000000, fweh=#141234;
color stopButtonHoverOver;
color dayForeground=blue, dayHoverover=darkblue, dayBackground=purple;
color darkForeground=blue, darkHoverover=dark, darkBackground=lightgray;
color nightForeground=dark, nightHoverover=black, nightBackground=fweh;
color appColorForeground, appColorHoverover, appColorBackground;
color stopButtonHoverover;
color quitLineColor;
//
Boolean colorDarkMode=true;
//
void setup()
{
  size(1000, 800);
  appWidth = width;
  appHeight = height;
  //Variables for any music button
  musicButtonDIV_Width = appWidth*1/2;
  musicButtonDIV_Height = appHeight*1/2;
  musicButtonDIV_X = musicButtonDIV_Width - musicButtonDIV_Width*1/2;
  musicButtonDIV_Y = musicButtonDIV_Height - musicButtonDIV_Height*1/2;
  //Use if statement to change, introduce ternary operator
  //
  //Population (Variables)
  //Work out a case Study: shorter side of DIV
  if ( musicButtonDIV_Width >= musicButtonDIV_Height ) { // Landscape //error: square does not go in the middle
    // musicButtonWidth needs to change
    musicButtonSquareWidth = musicButtonDIV_Height ;
    musicButtonSquareHeight = musicButtonDIV_Height ;
    float padding1 = musicButtonDIV_Width - musicButtonDIV_Height; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X + padding2 ; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y;
  } else { //Portrait
    // musicButtonHeight needs to change
    musicButtonSquareWidth = musicButtonDIV_Width ;
    musicButtonSquareHeight = musicButtonDIV_Width;
    float padding1 = musicButtonDIV_Height - musicButtonDIV_Width; //working out value needed, with formulae
    float padding2 = padding1*1/2; ////working out value needed, with formulae
    musicButtonSquareX = musicButtonDIV_X; //note: minus moves it the wrong way, difficult to see
    musicButtonSquareY = musicButtonDIV_Y + padding2;
  }
  //See Case Studies and paper folding
  stopWidth = musicButtonSquareWidth*1/2;
  stopHeight = musicButtonSquareHeight*1/2;
  stopX = musicButtonSquareX + musicButtonSquareWidth*1/4;
  stopY = musicButtonSquareY + musicButtonSquareHeight*1/4;
  quitLine = (musicButtonSquareWidth/musicButtonSquareWidth) + musicButtonSquareWidth*1/4*1/2;
  playButton1X = musicButtonSquareX + musicButtonSquareWidth*1/4;
  playButton1Y  = musicButtonSquareY + musicButtonSquareHeight*1/4;
  playButton2X = musicButtonSquareX + musicButtonSquareWidth*3/4;
  playButton2Y = musicButtonSquareY + musicButtonSquareHeight*1/2;
  playButton3X = musicButtonSquareX + musicButtonSquareWidth*1/4;
  playButton3Y = musicButtonSquareY + musicButtonSquareHeight*3/4;
  //
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
  song[currentSong] = minim.loadFile( file );
  file = directory + TheDrinkler + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  file = directory + weSaiyansHaveLimits + mp3FileName;
  song[currentSong+=1] = minim.loadFile( file );
  //
  currentSong = 0;
  //
  //song[currentSong].play();
  //Use play(timeStart) & loop(numberOfLoops)
  //Purpose is 2D Shapes
  //Introduce keyPressed as keyboard shortcuts
  //Introduce mousePressed as interaction
  //
  //DIVs
  //rect() based on variables; variables change with program (introduces parameters of a function and TABS)
  //rect( X, Y, Width, Height );
  //rect( musicButtonDIV_X, musicButtonDIV_Y, musicButtonDIV_Width, musicButtonDIV_Height );
  println(colorDarkMode);
  if (colorDarkMode==false && hour()<=7 && hour()>=17) 
  {
    //Night Mode
    appColorForeground=nightForeground;
    appColorHoverover=nightHoverover;
    appColorBackground=nightBackground;
    println("sigma");
  } 
    else if (colorDarkMode==false && hour()<7 || hour()>17) 
    {
      //Dark Mode
      appColorForeground=darkForeground;
      appColorHoverover=darkHoverover;
      appColorBackground=darkBackground;
      println("DashTech1");
    } 
    else 
    {
      //Day Mode
      appColorForeground=dayForeground;
      appColorHoverover=dayHoverover; 
      appColorBackground=dayBackground;
      println("DashTech3");
    } 
 } //End setup
//
void draw() {
  background(appColorBackground); // Gray Scale: 0-255
  //
  rect( musicButtonSquareX, musicButtonSquareY, musicButtonSquareWidth, musicButtonSquareHeight );
  //stroke(); //Colour
  //
  /* Note: 3 types of colour, in pairs for hoverover
   - Day: Foreground: #DED7D0 | Hoverover: #D38531 | Background: #FFBC74
   - Dark: Foreground: #DED7D0 | Hoverover: #BC6A11 | Background: #554C43
   - Night, no blue: Foreground: #312E2B | Hoverover: #2E2E2E | Background: #0D0D0D
   - Dark Mode is for all the time, how bright the screen is and eye strain
   - API: when does sunrise, when does sunset, is the system time within those hours
   - Night mode is for all the time or just
   - Note: preferences are hardcoded here but can be choices in CS20
   */
  //if ( day ) {} else if ( dark ) {} else {}
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    stopButtonHoverOver= appColorHoverover;
    quitLineColor = appColorHoverover;
  } else {
    stopButtonHoverOver = appColorForeground;
    quitLineColor = appColorForeground;
  }
  //
  //
  fill(stopButtonHoverover);
  noStroke(); //Colour
  //
  //triangle(playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y);
  //
  fill(1);
  stroke(1);
  textSize(100);
  text("YBA prime update", 140, 120);
  //
  stroke(quitLineColor);
  strokeWeight(quitLine);
  //strokeCap(ROUND);
  noFill();
  noStroke();
  stroke(1);
  strokeWeight(5);
  fill(quitLineColor);
  triangle(playButton1X, playButton1Y, playButton2X, playButton2Y, playButton3X, playButton3Y);
  fill(225);
  stroke(1);
  //Music Buttons Interactions: cascading IFs can become AND Statements
  //Note: keypressed must have click on screen
  //song[currentSong].isPlaying();
  //
} //End draw
//
void mousePressed() {
  //Boolean for Click
  //if() {} else {}
   /* STOP Button Mouse Press, after Hoverover
   Must have Hoverover to ensure mouse will activate, visual confirmation of algorithm
   */
  if ( mouseX>musicButtonSquareX && mouseX<musicButtonSquareX+musicButtonSquareWidth && mouseY>musicButtonSquareY && mouseY<musicButtonSquareY+musicButtonSquareHeight ) {
    song[currentSong].loop(0);
   }
} //End mousePressed
//
void keyPressed() {
  /* Key Board Short Cuts ... learning what the Music Buttons could be
   Note: CAP Lock with ||
   if ( key==? || key==? ) ;
   */
  //if ( key=='P' || key=='p' ) song[currentSong].play(); //Simple Play, no double tap possible
  //
  if ( key=='P' || key=='p' ) song[currentSong].loop(0); //Simple Play, double tap possible
  /* Note: double tap is automatic rewind, no pause
   Simble is two triangles
   This changes what the button might become after it is pressed
   */
  //if ( key=='S' || key=='s' ) song[currentSong].pause(); //Simple Stop, no double taps
  //
  if ( key=='S' | key=='s' ) { 
   if ( song[currentSong].isPlaying() ) {
   song[currentSong].pause(); //single tap
   } else {
   song[currentSong].rewind(); //double tap
   }
   }
   if ( key=='L' | key=='l' ); song[currentSong].loop(1); // one loop
   if ( key=='K' | key=='k' ); song[currentSong].loop(); // loop forever
   if ( key=='F' | key=='f' ); song[currentSong].skip(10000); // fast forward
   if ( key=='R' | key=='r' ); song[currentSong].skip(-10000); // rewind
   if ( key=='M' | key=='m' ); {//mute
     //
     if ( song[currentSong].isMuted() ) {
       //ERROR: song might not be playing
       //CATCH: ask .isPlaying() or !.isPlaying()song[currentSong].unmute();
       song[currentSong].unmute();
     } else {
       //Possible ERROR: Might rewind the song
       song[currentSong].mute();
     }
   }
     if ( key=='O' || key=='o' ) { // Pause
      //
      if ( song[currentSong].isPlaying() ) {
       song[currentSong].pause();
      } else {
       song[currentSong].play();
      }
    }
   if (key == CODED || keyCode ==ESC) exit(); //good ol' quit button
   if (key == 'Q' || key == 'q') exit();
   /*if ( key=='>' | key=='>' ); {//next song
     song[currentSong].stop;
     song[currentSong+=1] = minim.loadFile(file);
     song[currentSong].play;
   }
   if ( key=='<' | key=='<' ); //previous song
   */
   /*
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   if ( key=='' | key=='' ); //
   */
} //End keyPressed
//
// End Main Program
