"""
Snooper
Solution to Advent of Code 2016 day 7
"""

import re
from itertools import izip_longest


def sum_snoopables():
    """Tells us how many IPs are snoopable given a string of IPs separated by a newline."""

    input_file = open('ips.txt')
    ip_address_list = []

    for line in input_file:
        ip_address_list.append(line.strip())
    snoopable = len(filter(find_snoopable, ip_address_list))
    return snoopable

def find_snoopable(ip_address):
    """
    The IP7 string must contain an ABBA outside of the hypernet []
    and can not contain an ABBA inside of the hypernet []
    """
    brackets = re.compile(r'\[(.*?)\]')
    decomposed_ip = brackets.split(ip_address)

    hypernet = []
    for i, chunk in enumerate(decomposed_ip):
        if i != 0 and not i % 2:
            hypernet.append(chunk)

    rest_of_ip = list(set(decomposed_ip).difference(hypernet))

    has_good_abba = some(find_abba, hypernet)
    has_bad_abba = some(find_abba, rest_of_ip)

    if has_bad_abba:
        return False

    return has_good_abba

def find_abba(string):
    """Finds an ABBA pattern in a string and returns True if it exists else False"""
    chunked = group_by_four(string)
    has_abba = False
    for chunk in chunked:
        has_abba = True if is_abba(chunk) else has_abba

    return has_abba if has_abba or len(string) <= 4 else find_abba(string[1:])

def is_abba(chunk):
    "Looks at a chunk of 4 chars and determines if it fits ABBA pattern."
    first, second, third, last = chunk
    return first == last and second == third and not first == second

def some(predicate, iterable):
    "Do some of the items in the list match the predicate? An awful hack."
    return len(filter(predicate, iterable)) > 0

def group_by_four(string):
    """Chunks string into lists of 4 chars."""
    return list(grouper(string, 4, ' '))

def grouper(iterable, num, fillvalue=None):
    """
    le chunkifier
    stolen from stack overflow's infamous Craz
    """
    args = [iter(iterable)] * num
    return izip_longest(*args, fillvalue=fillvalue)
