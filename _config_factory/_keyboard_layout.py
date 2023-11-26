from ._config import Config
from ._info import Info
from ._dest import Destination

class KeyboardLayout(Config):
    dst: str = '/etc/X11/xorg.conf.d/00-keyboard.conf'

    info_msg: str = """
This is an X-keyboard layout config. Restart X to take effect!

To list keymap layouts, e.g. en, ru, de, etc., please run:
```
localectl list-x11-keymap-layouts
```

To list keymap models, e.g. pc86, pc105, etc., please run:
```
localectl list-x11-keymap-models
```

To list keymap variants, e.g. qwerty, qwetz, etc., please run:
```
localectl list-x11-keymap-variants
```

To list keymap options, e.g. grp::win_space_toggle, etc., please run:
```
localectl list-x11-keymap-options
```
"""

    body: str = '''
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,ru"
        Option "XkbModel" "pc86"
        Option "XkbVariant" "qwerty"
        Option "XkbOptions" "grp:win_space_toggle"
EndSection
'''

    def __init__(self):
        super().__init__(
                Info(KeyboardLayout.info_msg),
                Destination(KeyboardLayout.dst)
                )

    def __str__(self):
        return KeyboardLayout.body


def get() -> KeyboardLayout:
    return KeyboardLayout()
