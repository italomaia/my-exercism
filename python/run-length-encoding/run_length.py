"""
Exercism.io run length kata
"""


from re import sub


def filter_out_ones(text):
    """Filter out ones"""
    new_str = ""
    for i, c in enumerate(text):
        if not (c is '1'
                and not text[i - 1].isdigit()
                and not text[i + 1].isdigit()):
            new_str += c

    return new_str


def encode(text):
    """Run length encodes given text"""
    encoding = sub(r'(.)\1*', lambda m: str(len(m.group(0))) +
                   m.group(1), text)

    return filter_out_ones(encoding)


def decode(text):
    """Run length decodes given text"""
    return sub(r'(\d+)(\D)', lambda m: m.group(2) * int(m.group(1)),
               text)