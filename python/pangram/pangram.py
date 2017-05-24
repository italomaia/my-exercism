import string


def is_pangram(sentence):
    return len(set([
        c for c in sentence.lower()
        if c in string.ascii_lowercase])) == 26