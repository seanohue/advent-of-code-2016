"""Snooper"""

import re
from itertools import izip_longest

def find_snoopable(ip_address):
    """
    The IP7 string must contain an ABBA outside of the hypernet []
    and can not contain an ABBA inside of the hypernet []
    """
    brackets = re.compile(r'\[(.*?)\]')
    decomposed_ip = brackets.split(ip_address)
    hypernet = decomposed_ip[1]
    rest_of_ip = ''.join(list(set(decomposed_ip).difference([hypernet])))

    has_good_abba = find_abba(rest_of_ip)
    has_bad_abba = find_abba(hypernet)


    return has_good_abba and not has_bad_abba

def find_abba(string):
    """Finds an ABBA pattern in a string and returns True if it exists else False"""
    chunked = group_by_four(string)
    has_abba = False
    for chunk in chunked:
        first, second, third, last = chunk
        if first == last and second == third and not first == second:
            has_abba = True

    return has_abba

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
