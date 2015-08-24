dir=./videos
filename=$(date +"%Y%m%d-%H:%M:%S")

while true
do
	gst-launch -v uvch264_src device=/dev/video0 name=src auto-start=true ! h264parse ! \
	tee name=vid ! decodebin2 ! queue ! videoflip method=horizontal-flip ! aspectratiocrop aspect-ratio=4/3 ! xvimagesink sync=false force-aspect-ratio=true vid. ! \
	queue ! mux. pulsesrc device="alsa_input.usb-046d_HD_Pro_Webcam_C920_D4CFBCCF-02-C920.analog-stereo" ! audioconvert ! lamemp3enc target=1 bitrate=128 cbr=true ! \
	queue ! matroskamux name=mux ! filesink location=$dir/$filename.mkv
	#queue ! matroskamux name=mux ! filesink location=$dir/$filename.mkv
	#queue ! mux. alsasrc do-timestamp=true device="plughw:1,0" ! audio/x-raw-int,signed=true,rate=44100,channels=2 ! audioconvert ! lamemp3enc target=1 bitrate=128 cbr=true ! \
	#queue ! mux. alsasrc do-timestamp=true device="plughw:1,0" ! audio/x-raw-int,signed=true,rate=44100,channels=2 ! audioconvert ! lamemp3enc target=1 bitrate=128 cbr=true ! \
	clear
	echo "Ooops! The videobooth just crashed!"
	echo "Do not panic... We are in a few seconds!"
	echo "Please press F11 to go fullscreen!"
	sleep 10
done

