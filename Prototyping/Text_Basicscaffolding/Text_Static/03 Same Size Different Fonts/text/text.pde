/* Static Text
 - Testing for Aspect Ratio
 - introduce single and mutliple executed code
 - activity: do another rectangle with text in it
 - copy and paste to dynamic program
 */
// Global Variables
int appWidth, appHeight;
float actualtextX, actualtextY, actualtextWidth, actualtextHeight;
float peakWritingX, peakWritingY, peakWritingWidth, peakWritingHeight;
float footerX, footerY, footerWidth, footerHeight;
PFont actualtextFont, footerFont, phraseFont;
color blue=#0063FF, white=#FFFFFF, resetDefaultInk=white; //Not Night Mode Friendly
int size;
String actualtext = "Collect my pages", footer="CYBERPUNK", phrase="While playing dokkan";
//
//Display
size( 500, 700 ); //Portrait CANVAS
appWidth = width;
appHeight = height;
//
//Text: Single Executed Code
//Fonts from OS (Operating System)
//String[] fontList = PFont.list(); //To list all fonts available on OS
//printArray(fontList); //For listing all possible fonts to choose from, then createFont
// Tools / Create Font / Find Font / Do not press "OK", known bug
actualtextFont = createFont("Slender", 55); //Verify the font exists in Processing.Java
footerFont = createFont("Cyberpunk", 55);
phraseFont = createFont("HelveticaNeue BlackCond", 55);
//
/* Population
- using 10's
- Could be 100s or percent
- Able to use decimals to dial in the values
*/
actualtextX = appWidth*1/10;
actualtextY = appHeight*1/10;
actualtextWidth = appWidth*8/10;
actualtextHeight = appHeight*1/10;
peakWritingX = actualtextX; 
peakWritingY = appHeight*4.5/10; 
peakWritingWidth = actualtextWidth; 
peakWritingHeight = actualtextHeight;
footerX = actualtextX;
footerY = appHeight*8/10;
footerWidth = actualtextWidth; 
footerHeight = actualtextHeight; 
//DIVs
rect( actualtextX, actualtextY, actualtextWidth, actualtextHeight ); //actualtext Font
rect( peakWritingX, peakWritingY, peakWritingWidth, peakWritingHeight ); // Testing Aspect Ratio of Fonts
rect( footerX, footerY, footerWidth, footerHeight ); //Different Font
//
//Drawing Text
fill(blue); //Ink, hexidecimal copied from Color Selector
textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
//Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]
size = 41;
textFont( actualtextFont, size ); 
text( actualtext, actualtextX, actualtextY, actualtextWidth, actualtextHeight );
textFont( footerFont, size ); 
text( footer, footerX, footerY, footerWidth, footerHeight );
textFont( phraseFont, size ); 
text( phrase, peakWritingX, peakWritingY, peakWritingWidth, peakWritingHeight );
