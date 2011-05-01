#!/bin/bash
[[ $0 == pa_vol_down ]] && _down=true 
[[ $1 ]] && let _vol_increment=$1*655 || _vol_increment=655
_full_line=`pacmd dump|grep "set-sink-volume"`
_sink_cmd=`echo $_full_line|cut -d" " -f1`
_sink_id=`echo $_full_line|cut -d" " -f2`
_sink_vol=`echo $_full_line|cut -d" " -f3`
[[ $_down ]] && let _vol=$_sink_vol-$_vol_increment || let _vol=$_sink_vol+$_vol_increment
[[ $_vol -lt 0 ]] && _vol=0
[[ $_vol -gt 65536 ]] && _vol=65536
pacmd $_sink_cmd alsa_output.pci-0000_00_1b.0.analog-stereo $_vol > /dev/null
