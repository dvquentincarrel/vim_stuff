#!/usr/bin/python
import sys
import re
from datetime import timedelta
from typing import Tuple

TIME_REGEX=re.compile(r'^( *-? (\d\d:\d\d:\d\d) (\d\d:\d\d:\d\d))( #.*)?$')

def str_to_secs(time: str) -> int:
    """Gets how many seconds there are in a %HH:%MM:%SS-formatted string"""
    hrs, mins, secs = [int(part)*60**(2-index) for index, part in enumerate(time.split(':'))]
    return hrs+mins+secs

def secs_to_str(seconds: int) -> str:
    """Gets the %HH:%MM:%SS representation of a number of seconds"""
    seconds = abs(seconds)
    hours, seconds = divmod(seconds, 3600)
    minutes, seconds = divmod(seconds, 60)
    return f"{hours:02}:{minutes:02}:{seconds:02}"

def compute_line(line: str, matches: list) -> Tuple[str, int]:
    """For a given line and its matches, returns the accumulated time and line
    representation
    """
    if(not matches):
        return (line, 0)
    matches = matches[0]
    start = str_to_secs(matches[1])
    end = str_to_secs(matches[2])
    end = end if(end > start) else end + 86400
    total = end - start
    line_str = f'{matches[0]} = {secs_to_str(total)}{matches[3]}\n'
    return (line_str, total)

total = subtotal = 0
for input_line in sys.stdin:
    line, subtotal = compute_line(input_line, TIME_REGEX.findall(input_line))
    total += subtotal
    print(line, end='')
print(f'# Total: {secs_to_str(total)}')
