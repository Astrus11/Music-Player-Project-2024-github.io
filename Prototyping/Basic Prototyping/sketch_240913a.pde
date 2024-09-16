import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim;
int numberOfSongs = 8; //Able to Autodetect based on Pathway
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
int currentSong = numberOfSongs - numberOfSongs; //beginning current song is ZERO
//
void setup() 
{
 size(900, 800);
 //
 minim = new Minim(this); //load from data directory, loadFile should also load from project folderv
 // Load Music
 String musicPathway = "Music/";
 String mp3FileName = ".mp3";
 String placeholder = "placeholder1tho";
 String placeholder2 = "placeholderfr";
 String placeholder3 = "placeholderagain";
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
// End Main Program
