"""Snooper"""

import re

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
    print string
    return True
