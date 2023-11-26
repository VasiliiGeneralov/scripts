class Destination:
    def __init__(self, dest: str):
        self._dest: str = dest

    def __str__(self):
        return self._dest
