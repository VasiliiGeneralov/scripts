#!/usr/bin/env python3

def lscpu_to_int(lscpu_entry: str) -> int:

    def __apply_lscpu_suffix(digit, suffix: str):
        result = digit
        if suffix in ['KB', 'KiB']:
            result = result * 1024
        elif suffix in ['MB', 'MiB']:
            result = result * 1024 * 1024
        return result

    if not lscpu_entry:
        return -1
    suffix_pos = 0
    for char in lscpu_entry:
        if not char.isalpha():
            suffix_pos += 1
        else:
            break
    lscpu_amount_str = lscpu_entry[:suffix_pos].lstrip().rstrip()
    lscpu_suffix = lscpu_entry[suffix_pos:].lstrip().rstrip()
    if not lscpu_amount_str:
        return -1
    try:
        lscpu_amount_digit = 0
        for digit in lscpu_amount_str:
            lscpu_amount_digit = (lscpu_amount_digit * 10) + int(digit)
        return __apply_lscpu_suffix(lscpu_amount_digit, lscpu_suffix)
    except ValueError:
        pass
    try:
        lscpu_amount_digit = float(lscpu_amount_str)
        return __apply_lscpu_suffix(lscpu_amount_digit, lscpu_suffix)
    except ValueError:
        return -1
