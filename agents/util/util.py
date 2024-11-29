import re


def parse_val(string):
    match = re.search(r'\b\d{2}\b', string)
    if match:
        return int(match.group())
    return None