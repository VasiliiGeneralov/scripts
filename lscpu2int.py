#!/usr/bin/env python3

def lscpu_to_int(lscpu_entry: str) -> int:
    suffix_pos = 0
    for char in lscpu_entry:
        if not char.isalpha():
            suffix_pos += 1
        else:
            break
    lscpu_amount_str = lscpu_entry[:suffix_pos].lstrip().rstrip()
    lscpu_suffix = lscpu_entry[suffix_pos:].lstrip().rstrip()
    lscpu_amount_digit = None
    if lscpu_amount_str.isdigit():
        lscpu_amount_digit = 0
        for digit in lscpu_amount_str:
            lscpu_amount_digit = (lscpu_amount_digit * 10) + int(digit)
    else:
        lscpu_amount_digit = float(lscpu_amount_str)
    result = lscpu_amount_digit
    if lscpu_suffix in ['KB', 'KiB']:
        result = result * 1024
    elif lscpu_suffix in ['MB', 'MiB']:
        result = result * 1024 * 1024
    return result
