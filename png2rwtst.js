'use strict';

if (process.argv.length !=3) {
	console.log('need to pass 1 item to this. name of input png file\n');
	process.exit();
}

const pngfile=process.argv[2];
const tileWidth = 32;
const tileHeight = 32;
const version=1.6;

const pos = pngfile.lastIndexOf(".");
const tstfile = pngfile.substr(0, pos < 0 ? pngfile.length : pos) + ".tileset";

const tileset = { "image": pngfile, "name": tstfile, "tileWidth": tileWidth, "tileHeight": tileHeight, "version": version};

console.log(tileset);

var fs = require('fs');
fs.writeFile(tstfile, JSON.stringify(tileset), 'utf8', (err) => { if(err) { console.error(err); return;};console.log(`${tileset} created!`);});

//{"image":"cat.png","name":"cat.tileset","tileWidth":32,"version":1.6,"tileHeight":32}