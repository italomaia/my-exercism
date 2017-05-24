def decode(word):
    rs, num = list(), ''

    for c in word:
        if c.isdigit():
            num += c
        else:
            rs.append((num and int(num) or 1) * c)
            num = ''

    return ''.join(rs)


def encode(word):
    bit = [None, 0]
    rs = list()

    for c in word:
        if c == bit[0]:
            bit[1] += 1
        else:
            bit = [c, 1]
            rs.append(bit)

    return ''.join([
        '%s%s' % (x if x > 1 else '', c)
        for c, x in rs])