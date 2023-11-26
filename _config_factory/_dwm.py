from ._config import Config
from ._config import Info
from ._config import Destination

class XinitDwm(Config):
    dst: str = '~/.xinitrc'

    info_msg: str = """
This config is read when X starts.

To output some info to xroot try:
```
# Statusbar loop
while true; do
   xsetroot -name "$( date +"%F %R" )"
   sleep 1m    # Update time every minute
done &
```
or even:
```
slstatus &
```

To list available screens and modes, simply run:
```
xrandr
```

Don't forget to set the resolution of your screen(s):
```
# May want to wait for a couple of seconds
# if the resolution isn't set properly
# sleep 2

xrandr --output HDMI-1 --mode 1920x1080 --rate 60
```
"""

    body: str = """
exec dbus-launch --sh-syntax --exit-with-session dwm
"""

    def __init__(self):
        super().__init__(
                Info(XinitDwm.info_msg),
                Destination(XinitDwm.dst)
                )

    def __str__(self):
        return XinitDwm.body


def get() -> XinitDwm:
    return XinitDwm()
