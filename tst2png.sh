#convert from TK tst directly to png and convert old bkg color (0,1,2) to (255, 0, 255)

tstfile="${1}"
filename=$(basename "$tstfile")
filebase="${filename%.*}"

pnmfile="${filebase}.pnm"
pngfile="${filebase}.png"
tilsetfile="${filebase}.tileset"

if [ "$tstfile" == "" ]; then
	echo "must provide a tst file"
	exit
fi

echo "converting file $tstfile to png"

echo "deleting existing pnm, $pnmfile, and png, $pngfile"

for file in $pnmfile $pngfile $tilsetfile
do
	if [ -f $file ]; then
		rm -f $file
	fi
done

echo "converting tst to pnm..."
./tst2pnm.pl $tstfile

echo "converting pnm to png"
echo "if this fails, be sure you've installed imagemagick and created an environment variable, imagemagick, pointing to magick.exe"
echo "you can also do an export PATH=\$PATH:/c/Program\ Files/ImageMagick-7.0.8-Q16/magick.exe"

magick.exe convert $pnmfile -transparent "rgb(255,0,255)" $pngfile
node png2rwtst.js $pngfile


