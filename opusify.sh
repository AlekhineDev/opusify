#

while [ "$1" != "" ]; do
    case $1 in
        -h | --help )           echo "This script will turn .wav files into .opus files."
                                exit
                                ;;
    esac
    shift
done

mkdir .opusfiles
find . -type f -name '*.wav'|while read fname; do
filename=$(basename "$fname")
extension="${filename##*.}"
filename="${filename%.*}"
echo $fname
echo $filename
echo ".opusfiles/"$filename'.opus'
opusenc --quiet $fname ".opusfiles/"$filename'.opus' 
done