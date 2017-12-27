if (xrandr | grep "HDMI-1 connected" >/dev/null)
then
	xrandr --output HDMI-1 --mode 1360x768 --pos 1366x0 --rotate normal --output eDP-1 --primary --mode 1366x768 --pos 0x0 --rotate normal
	monitor="HDMI-1" 
else
	xrandr --output HDMI-1 --off --output eDP-1 --primary --mode 1366x768 --pos 0x0 --rotate normal	
	monitor="VGA-1"
fi
#echo $monitor$monitor
lineno=`grep -n 'set $monitor ' ~/.config/i3/config | cut -d : -f 1`
sed -i $lineno's/.*/set $monitor '$monitor'/' ~/.config/i3/config 

