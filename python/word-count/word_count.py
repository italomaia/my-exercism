"""
Exercism.io word count kata
"""

from collections import Counter
from re import split


def word_count(sentence):
    """Returns a dict of words and their number of occurences"""
    words = split(r'[\W_]+', sentence.lower())
    valid_words = filter(bool, words)

    return Counter(valid_words)