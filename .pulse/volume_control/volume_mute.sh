#! /bin/sh

# Il n'y a pas de mute-toggle dans PulseAudio
# Du moins j'ai pas trouvé, du coup on se fait un petit
# toggle maison

mute=`cat /home/leyaude/.pulse/volume_control/is_mute`

if [ $mute -eq 0 ]; then
	pacmd set-sink-mute 0 0;
	echo "1" > /home/leyaude/.pulse/volume_control/is_mute;
else
	pacmd set-sink-mute 0 1;
	echo "0" > /home/leyaude/.pulse/volume_control/is_mute;
fi
