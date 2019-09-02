updated in 2019 to handle more of the overall workflow on converting old TK2 tsts to new RPGWizard tilesets  
http://rpgwizard.org/

PreReqs:

1. install imagemagick  
   *  https://imagemagick.org/    
2. install node  
3. ensure node and imagemagick are in your PATH variable.  
4. cd to a directory with TK2 tsts  
5. pass a list of tsts to the shell script. what I do is:  $ find . -type f -name "*.tst" -exec tst2png.sh {} \;  
6. wait for scripts to run.  

What's happening behind the scenese?
*  existing png, pnm, and tileset files are deleted, if they exist
*  tst2ppm runs and converts tst files to pnm, but also replaces the 0,1,2 "special" black to 255,0,255 (magenta).
*  then imagemagick convert runs to convert the pnm to pngs, and replaces the magenta to transparent (yes, could have just left the 0,1,2, but for some reason I didn't change that).
*  then the js file creates RPGwizard *.tileset files in JSON using the pngs.

NOTE:  to use in RPGWizard, you will need to:

1.  have a project already created.
2.  copy over all of the generated *.png files from above to the ./Graphics/ folder in your RPGwizard project
3.  copy over all of the generated *.tileset files above to the ./TileSets/ folder in your RPGwizard project


Previous Readme from TAW below. Thanks TAW!
tst2ppm
=======

Converts RPGToolkit's TST format to PNM

Usage
=====

    ./tst2pnm.pl file.tst

It will create file.pnm in the same directory.
