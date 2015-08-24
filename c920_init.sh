v4l2-ctl --set-fmt-video=width=1920,height=1080,pixelformat=1
#v4l2-ctl --set-fmt-video=width=960,height=720,pixelformat=1
v4l2-ctl --set-parm=30

#config -d /dev/video0 -r VBR -b 5000
config -d /dev/video0 -r CBR -b 10000


