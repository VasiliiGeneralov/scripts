from abc import ABC, abstractmethod
from ._info import Info
from ._dest import Destination

class Config(ABC):
    def __init__(self, info: Info, dest: Destination):
        self._info: Info = info
        self._dest: Destination = dest

    @abstractmethod
    def __str__(self):
        pass

    @property
    def info(self) -> str:
        return ''.join(
                    [
                        str(self._info),
                        '\n\n',
                        'Destination:\n\t',
                        str(self._dest)
                    ]
                )
